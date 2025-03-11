<?php

namespace App\Http\Controllers;

use App\Http\Resources\BarcoResource;
use App\Http\Resources\DetalleHabitacionResource;
use App\Http\Resources\FotoBarcoResource;
use App\Http\Resources\HabitacionResource;
use App\Models\Barco;
use App\Models\DetalleHabitacion;
use App\Models\FotoBarco;
use App\Models\Habitacion;
use DB;
use Illuminate\Http\Request;
use Log;
use Storage;

class BarcoController extends Controller
{
    // Obtener todos los barcos o uno específico
    public function getAll(Request $request)
    {
        $request->validate([
            'id' => 'sometimes|integer|min:1',
            'incluir_desactivados' => 'sometimes|boolean' // este mae sirve para excluir desactivados de una
        ]);

        if ($request->has('id')) {
            return $this->getById($request->id);
        }

        $query = Barco::with(['habitaciones', 'fotos']);

        // aqui automaticamente se filtra para tanta la huevonada
        if (!$request->boolean('incluir_desactivados')) {
            $query->where('desactivado', 0);
        }

        $barcos = $query->get();
        return BarcoResource::collection($barcos);
    }
    
    public function getById($id)
    {
        $barco = Barco::with(['habitaciones.detallesHabitacion', 'fotos'])->findOrFail($id);
        return new BarcoResource($barco);
    }

    public function getAllHabitaciones(Request $request)
    {
        $request->validate([
            'id' => 'sometimes|integer|min:1',
            'barco_id' => 'sometimes|integer|min:1'
        ]);

        if ($request->has('id')) {
            $habitacion = Habitacion::with(['barco', 'detallesHabitacion'])->find($request->id);
            return $habitacion ? new HabitacionResource($habitacion) : response()->json(['error' => 'No encontrado'], 404);
        }

        if ($request->has('barco_id')) {
            $habitaciones = Habitacion::with('detallesHabitacion')
                ->where('id_barco', $request->barco_id)
                ->get();
            return HabitacionResource::collection($habitaciones);
        }

        $habitaciones = Habitacion::with('detallesHabitacion')->get();
        return HabitacionResource::collection($habitaciones);
    }

    public function getDetalleHabitacion(Request $request)
    {
        $request->validate([
            'id' => 'sometimes|integer|min:1',
            'habitacion_id' => 'sometimes|integer|min:1'
        ]);

        if ($request->has('id')) {
            $detalle = DetalleHabitacion::with('habitacion')->find($request->id);
            return $detalle ? new DetalleHabitacionResource($detalle) : response()->json(['error' => 'No encontrado'], 404);
        }

        if ($request->has('habitacion_id')) {
            $detalle = DetalleHabitacion::with('habitacion')
                ->where('id_habitacion', $request->habitacion_id)
                ->first();
            return $detalle ? new DetalleHabitacionResource($detalle) : response()->json(['error' => 'No encontrado'], 404);
        }

        return DetalleHabitacionResource::collection(DetalleHabitacion::with('habitacion')->get());
    }

    

    //CRUD PRUEBAS --------

    //nuevo barco
    public function store(Request $request)
    {
        $validated = $request->validate([
            'nombre' => 'required|string|max:255',
            'capacidad_pasajeros' => 'required|integer|min:0',
            'capacidad_tripulantes' => 'required|integer|min:0',
            'total_habitaciones' => 'required|integer|min:0',
            'velocidad_maxima' => 'required|numeric|min:0',
            'tonelaje' => 'required|numeric|min:0',
            'altura' => 'required|numeric|min:0',
            'largo' => 'required|numeric|min:0',
            'ancho' => 'required|numeric|min:0',
            'año_construccion' => 'required|integer|min:1900|max:'.(date('Y')+1),
            'fotos' => 'sometimes|array',
            'fotos.*' => [
                'required',
                'string',
                function ($attribute, $value, $fail) {
                    if (!preg_match('/^data:image\/(\w+);base64,/', $value)) {
                        $fail('Formato base64 inválido para las fotos');
                    }
                }
            ]
        ]);
    
        return DB::transaction(function () use ($validated) {
            // Crear barco
            $barco = Barco::create([
                ...$validated,
                'desactivado' => 0
            ]);
    
            // Guardar fotos si existen
            if (isset($validated['fotos'])) {
                foreach ($validated['fotos'] as $base64) {
                    FotoBarco::create([
                        'Id_barco' => $barco->id_barco,
                        'foto' => $base64
                    ]);
                }
            }
    
            return new BarcoResource($barco->load('fotos'));
        });
    }

// actualizar barco
public function update(Request $request, $id)
{
    $validated = $request->validate([
        'nombre' => 'sometimes|string|max:255',
        'capacidad_pasajeros' => 'sometimes|integer|min:0',
        'capacidad_tripulantes' => 'sometimes|integer|min:0',
        'total_habitaciones' => 'sometimes|integer|min:0',
        'velocidad_maxima' => 'sometimes|numeric|min:0',
        'tonelaje' => 'sometimes|numeric|min:0',
        'altura' => 'sometimes|numeric|min:0',
        'largo' => 'sometimes|numeric|min:0',
        'ancho' => 'sometimes|numeric|min:0',
        'año_construccion' => 'sometimes|integer|min:1900|max:'.(date('Y')+1),
        'desactivado' => 'sometimes|boolean',
        'fotos' => 'sometimes|array',
        'fotos.*' => [
            'required',
            'string',
            function ($attribute, $value, $fail) {
                if (!preg_match('/^data:image\/(\w+);base64,/', $value)) {
                    $fail('Formato base64 inválido para las fotos');
                }
            }
        ],
        'fotos_eliminar' => 'sometimes|array',
        'fotos_eliminar.*' => 'integer|exists:fotos_barco,Id_fotos_Barco'
    ]);

    return DB::transaction(function () use ($validated, $id) {
        $barco = Barco::findOrFail($id);
        
        $barco->update($validated);

        if (isset($validated['fotos_eliminar'])) {
            FotoBarco::where('Id_barco', $barco->id_barco)
                ->whereIn('Id_fotos_Barco', $validated['fotos_eliminar'])
                ->delete();
        }

        if (isset($validated['fotos'])) {
            foreach ($validated['fotos'] as $base64) {
                FotoBarco::create([
                    'Id_barco' => $barco->id_barco,
                    'foto' => $base64
                ]);
            }
        }

        return new BarcoResource($barco->fresh()->load('fotos'));
    });
}

    // desactivar barco
    public function desactivate($id)
    {
        $barco = Barco::findOrFail($id);
        $barco->update(['desactivado' => 1]);
    
        return response()->json([
            'message' => 'Barco desactivado correctamente',
            'data' => new BarcoResource($barco->load('fotos'))
        ]);
    }
    // obtener fotillos
    public function getFotos($idBarco)
    {
        $fotos = FotoBarco::where('Id_barco', $idBarco)->get();
        return FotoBarcoResource::collection($fotos);
    }
}
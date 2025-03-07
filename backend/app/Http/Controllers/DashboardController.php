<?php
// app/Http/Controllers/DashboardController.php
namespace App\Http\Controllers;

use App\Models\Barco;
use App\Models\Reserva;
use Illuminate\Http\Request;
use App\Models\Reservation;
use App\Models\Ship;
use Carbon\Carbon;

class DashboardController extends Controller
{
    public function index(Request $request)
    {
        $filters = $request->validate([
            'start_date' => 'nullable|date',
            'end_date' => 'nullable|date|after_or_equal:start_date',
            'ship_id' => 'nullable|exists:ships,id_barco',
            'gender' => 'nullable|in:M,F'
        ]);

        return response()->json([
            'gender' => $this->genderDistribution($filters),
            'popularShips' => $this->popularShips($filters),
            'reservationTrend' => $this->reservationTrend($filters),
            'ageDistribution' => $this->ageDistribution($filters)
        ]);
    }

    private function genderDistribution($filters)
    {
        $query = Reserva::with('usuario')
            ->filter($filters)
            ->selectRaw('usuarios.genero as label, COUNT(*) as value')
            ->join('users', 'reservations.id_usuario', '=', 'users.id_usuario')
            ->groupBy('usuarios.genero');

        return $query->get();
    }

    private function popularShips($filters)
    {
        return Barco::withCount(['reservas' => function($q) use ($filters) {
                $q->filter($filters);
            }])
            ->orderByDesc('reservas_count')
            ->limit(5)
            ->get()
            ->map(fn($ship) => [
                'ship' => $ship->nombre,
                'reservations' => $ship->reservas_count
            ]);
    }

    private function reservationTrend($filters)
    {
        $query = Reserva::filter($filters)
            ->selectRaw("DATE_FORMAT(fecha_reserva, '%Y-%m') as month, COUNT(*) as count")
            ->groupBy('month')
            ->orderBy('month');

        return $query->get();
    }

    private function ageDistribution($filters)
    {
        return Reserva::with('usuario')
            ->filter($filters)
            ->selectRaw('FLOOR(DATEDIFF(CURDATE(), users.fecha_nacimiento)/365) as age_group, COUNT(*) as count')
            ->join('users', 'reservations.id_usuario', '=', 'users.id_usuario')
            ->groupBy('age_group')
            ->orderBy('age_group')
            ->get()
            ->map(fn($item) => [
                'age' => $item->age_group,
                'count' => $item->count
            ]);
    }
}

// app/Http/Requests/FilterRequest.php (Opcional para mejor validación)
// src/components/SignUp.tsx
import React, { useRef, useState, useEffect } from "react";
import {
  Drawer,
  DrawerContent,
  DrawerHeader,
  DrawerBody,
  Link,
  Form,
  Input,
  Select,
  SelectItem,
  Button,
  Divider,
  DatePicker,
  Autocomplete,
  AutocompleteItem,
} from "@heroui/react";

import { authService } from "../api/auth";
import { useAuth } from "../contexts/AuthContext";
import { paises } from "@/config/api";

interface SignUpProps {
  isOpen: boolean;
  onOpenChange: (isOpen: boolean) => void;
  onOpenLogin: () => void;
}

export default function SignUp({
  isOpen,
  onOpenChange,
  onOpenLogin,
}: SignUpProps) {
  const { login } = useAuth();
  const formRef = useRef<HTMLFormElement>(null);
  const [password, setPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const [error, setError] = useState<string | null>(null);
  const [isLoading, setIsLoading] = useState(false);
  const [edad, setEdad] = useState<number | null>(null);
  const [countries, setCountries] = useState([]);

  useEffect(() => {
    const getCountries = async () => {
      try {
        const data = await paises();
        setCountries(data);
      } catch (err) {
        setError(err.message);
      }
    };

    getCountries();
  }, []);

  const getPasswordError = (value: string): string | null => {
    if (value.length < 8) return "Mínimo 8 caracteres";
    if (!/[A-Z]/.test(value)) return "Al menos una mayúscula";
    if (!/[^A-Za-z0-9]/.test(value)) return "Al menos un símbolo";

    return null;
  };

  const calculateAge = (birthDate: Date) => {
    const today = new Date();
    const age = today.getFullYear() - birthDate.getFullYear();
    const m = today.getMonth() - birthDate.getMonth();

    if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
      return age - 1;
    }

    return age;
  };

  const onSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setIsLoading(true);
    setError(null);

    const formData = new FormData(e.currentTarget);
    const birthDate = new Date(formData.get("fecha") as string);
    const calculatedAge = calculateAge(birthDate);

    const userData = {
      nombre_completo: `${formData.get("nombre")} ${formData.get("apellidos")}`,
      email: formData.get("email") as string,
      password: formData.get("password") as string,
      password_confirmation: formData.get("confirmPassword") as string,
      fecha_nacimiento: formData.get("fecha") as string,
      edad: calculatedAge,
      genero:
        formData.get("genero") === "m"
          ? 1
          : formData.get("genero") === "f"
            ? 2
            : 3,
      nacionalidad: formData.get("pais") as string,
      telefono: formData.get("telefono") as string,
    };

    try {
      const data = await authService.register(userData);

      login(data.access_token); // Usa la función del contexto
      onOpenChange(false);
    } catch (err) {
      setError(err instanceof Error ? err.message : "Error en el registro");
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <Drawer backdrop="blur" isOpen={isOpen} onOpenChange={onOpenChange}>
      <DrawerContent>
        {(onClose) => (
          <>
            <DrawerHeader className="flex flex-col gap-1">
              Registro
            </DrawerHeader>
            <DrawerBody>
              <Form ref={formRef} onSubmit={onSubmit}>
                <div className="flex flex-col gap-2 w-full">
                  <Input
                    isRequired
                    label="Nombre"
                    name="nombre"
                    placeholder="Ingrese su nombre"
                    variant="bordered"
                  />
                  <Input
                    isRequired
                    label="Apellidos"
                    name="apellidos"
                    placeholder="Ingrese sus apellidos"
                    variant="bordered"
                  />
                  <Select
                    isRequired
                    label="Género"
                    name="genero"
                    placeholder="Seleccione su género"
                    variant="bordered"
                  >
                    <SelectItem key="m" value="m">
                      Masculino
                    </SelectItem>
                    <SelectItem key="f" value="f">
                      Femenino
                    </SelectItem>
                    <SelectItem key="o" value="o">
                      Otro
                    </SelectItem>
                  </Select>
                  <DatePicker
                    isRequired
                    label="Fecha de nacimiento"
                    name="fecha"
                    variant="bordered"
                    onChange={(date) => {
                      if (date) {
                        setEdad(calculateAge(date.toDate("UTC")));
                      }
                    }}
                  />

                  <Input
                    disabled
                    isRequired
                    label="Edad"
                    name="edad"
                    value={edad?.toString() ?? ""} // Convertir a string
                    variant="bordered"
                  />
                  <Autocomplete
                    isRequired
                    defaultItems={countries}
                    label="País"
                    name="pais"
                    placeholder="Seleccione país"
                    variant="bordered"
                  >
                    {(country) => (
                      <AutocompleteItem key={country.cca2}>
                        {country.translations.spa.common}
                      </AutocompleteItem>
                    )}
                  </Autocomplete>
                  <Input
                    isRequired
                    label="Teléfono"
                    name="telefono"
                    placeholder="Ingrese su teléfono"
                    type="tel"
                    variant="bordered"
                  />
                  <Input
                    isRequired
                    label="Correo"
                    name="email"
                    placeholder="Ingrese su correo"
                    type="email"
                    variant="bordered"
                  />
                  <Input
                    isRequired
                    errorMessage={getPasswordError(password)}
                    label="Contraseña"
                    name="password"
                    placeholder="Ingrese la contraseña"
                    type="password"
                    value={password}
                    variant="bordered"
                    onValueChange={setPassword}
                  />
                  <Input
                    isRequired
                    errorMessage={
                      password !== confirmPassword
                        ? "Las contraseñas no coinciden"
                        : null
                    }
                    label="Confirmar Contraseña"
                    name="confirmPassword"
                    placeholder="Confirme la contraseña"
                    type="password"
                    value={confirmPassword}
                    variant="bordered"
                    onValueChange={setConfirmPassword}
                  />
                  {error && <div className="text-red-500 text-sm">{error}</div>}
                  <div className="flex justify-between items-center">
                    <p>
                      {`¿Ya tienes cuenta? `}
                      <Link
                        color="primary"
                        href="#"
                        size="sm"
                        onPress={() => {
                          onClose();
                          onOpenLogin();
                        }}
                      >
                        Iniciar Sesión
                      </Link>
                    </p>
                  </div>
                  <Divider className="my-0" />
                  <div className="flex gap-4">
                    <Button color="danger" variant="flat" onPress={onClose}>
                      Cerrar
                    </Button>
                    <Button
                      className="w-full"
                      color="primary"
                      isLoading={isLoading}
                      type="submit"
                    >
                      Crear Cuenta
                    </Button>
                  </div>
                </div>
              </Form>
            </DrawerBody>
          </>
        )}
      </DrawerContent>
    </Drawer>
  );
}

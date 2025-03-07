import React, { useState } from "react";
import { useSearchParams, useNavigate } from "react-router-dom";
import { Button, Input, Form, Divider } from "@heroui/react";

import { authService } from "../api/auth";

import Logo from "/logo/Logo 2.png";

export default function ResetPassword() {
  const [searchParams] = useSearchParams();
  const navigate = useNavigate();
  const token = searchParams.get("token") || "";
  const email = searchParams.get("email") || "";
  const [password, setPassword] = useState("");
  const [passwordConfirmation, setPasswordConfirmation] = useState("");
  const [error, setError] = useState<string | null>(null);
  const [successMessage, setSuccessMessage] = useState<string | null>(null);

  const onSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();

    if (!token || !email) {
      setError("Token o correo electrónico no válido");

      return;
    }

    try {
      await authService.resetPassword(
        token,
        email,
        password,
        passwordConfirmation,
      );
      setSuccessMessage("Contraseña restablecida. Redirigiendo...");
      setTimeout(() => navigate("/"), 3000);
    } catch (err) {
      setError(
        err instanceof Error
          ? err.message
          : "Error al restablecer la contraseña",
      );
    }
  };

  return (
    <div className="flex flex-col items-center justify-center min-h-screen bg-white">
      <div className="w-full max-w-md px-4 flex flex-col items-center">
        {/* Logo */}
        <div className="mb-8 flex justify-center">
          <img
            alt="Logo"
            className="w-32 h-auto object-contain mb-12"
            src={Logo}
          />
        </div>

        {/* Contenedor del formulario */}
        <div className="w-full max-w-xs">
          {/* Título */}
          <div className="mb-8 text-center">
            <h1 className="text-2xl font-bold text-gray-900 mb-2">
              Restablecer Contraseña
            </h1>
            <p className="text-gray-500 text-sm">Ingresa tu nueva contraseña</p>
          </div>

          <Form onSubmit={onSubmit}>
            <div className="flex flex-col gap-4 items-center w-full">
              <div className="w-full max-w-64">
                <Input
                  disabled
                  fullWidth
                  isRequired
                  classNames={{
                    inputWrapper: "bg-gray-50 border-gray-200",
                  }}
                  label="Correo electrónico"
                  name="email"
                  placeholder="usuario@ejemplo.com"
                  type="email"
                  value={email}
                  variant="bordered"
                />
              </div>

              <div className="w-full max-w-64">
                <Input
                  fullWidth
                  isRequired
                  classNames={{
                    inputWrapper: "bg-gray-50 border-gray-200",
                  }}
                  label="Nueva Contraseña"
                  name="password"
                  placeholder="Ingrese su nueva contraseña"
                  type="password"
                  value={password}
                  variant="bordered"
                  onChange={(e) => setPassword(e.target.value)}
                />
              </div>

              <div className="w-full max-w-64">
                <Input
                  fullWidth
                  isRequired
                  classNames={{
                    inputWrapper: "bg-gray-50 border-gray-200",
                  }}
                  label="Confirmar Contraseña"
                  name="password_confirmation"
                  placeholder="Confirme su nueva contraseña"
                  type="password"
                  value={passwordConfirmation}
                  variant="bordered"
                  onChange={(e) => setPasswordConfirmation(e.target.value)}
                />
              </div>

              {/* Mensajes de estado */}
              {error && (
                <div className="w-full max-w-64 p-3 bg-red-50 text-red-700 rounded-lg text-sm text-center">
                  {error}
                </div>
              )}

              {successMessage && (
                <div className="w-full max-w-64 p-3 bg-green-50 text-green-700 rounded-lg text-sm text-center">
                  {successMessage}
                </div>
              )}

              <Divider className="my-4 w-full max-w-64" />

              <div className="w-full max-w-64">
                <Button
                  className="w-full h-10 text-base"
                  color="primary"
                  type="submit"
                >
                  Restablecer Contraseña
                </Button>
              </div>
            </div>
          </Form>
        </div>

        {/* Enlace de volver al inicio */}
        <div className="mt-8 text-center">
          <button
            className="text-gray-600 hover:text-gray-800 text-sm font-medium"
            onClick={() => navigate("/")}
          >
            ← Volver al inicio
          </button>
        </div>
      </div>
    </div>
  );
}

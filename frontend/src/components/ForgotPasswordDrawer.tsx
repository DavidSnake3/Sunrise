// src/components/ForgotPasswordDrawer.tsx

import React, { useState } from "react";
import {
  Drawer,
  DrawerContent,
  DrawerHeader,
  DrawerBody,
  Button,
  Input,
  Divider,
  Form,
} from "@heroui/react";

import { authService } from "../api/auth";

interface ForgotPasswordDrawerProps {
  isOpen: boolean;
  onOpenChange: (isOpen: boolean) => void;
}

export default function ForgotPasswordDrawer({
  isOpen,
  onOpenChange,
}: ForgotPasswordDrawerProps) {
  const [email, setEmail] = useState("");
  const [error, setError] = useState<string | null>(null);
  const [isLoading, setIsLoading] = useState(false);
  const [successMessage, setSuccessMessage] = useState<string | null>(null);

  const onSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setIsLoading(true);
    setError(null);
    setSuccessMessage(null);

    try {
      await authService.forgotPassword(email);
      setSuccessMessage(
        "Se ha enviado un correo con las instrucciones para recuperar tu contraseña.",
      );
    } catch (err) {
      setError(
        err instanceof Error
          ? err.message
          : "Error al solicitar recuperación de contraseña",
      );
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
              Recuperar Contraseña
            </DrawerHeader>
            <DrawerBody>
              <Form onSubmit={onSubmit}>
                <div className="flex flex-col gap-2 w-full">
                  <Input
                    isRequired
                    label="Correo"
                    name="email"
                    placeholder="Ingrese su correo"
                    type="email"
                    value={email}
                    variant="bordered"
                    onChange={(e) => setEmail(e.target.value)}
                  />
                  {error && <div className="text-red-500 text-sm">{error}</div>}
                  {successMessage && (
                    <div className="text-green-500 text-sm">
                      {successMessage}
                    </div>
                  )}
                  <Divider className="my-4" />
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
                      Enviar
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

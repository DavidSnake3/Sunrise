// src/components/Login.tsx

import React, { useState } from "react";
import {
  Drawer,
  DrawerContent,
  DrawerHeader,
  DrawerBody,
  Button,
  Input,
  Checkbox,
  Link,
  Divider,
  Form,
} from "@heroui/react";

import { authService } from "../api/auth";
import { useAuth } from "../contexts/AuthContext";

import ForgotPasswordDrawer from "./ForgotPasswordDrawer";

interface LoginProps {
  isOpen: boolean;
  onOpenChange: (isOpen: boolean) => void;
  onOpenSignUp: () => void;
}

export default function Login({
  isOpen,
  onOpenChange,
  onOpenSignUp,
}: LoginProps) {
  const { login } = useAuth();
  const [error, setError] = useState<string | null>(null);
  const [isLoading, setIsLoading] = useState(false);
  const [isForgotPasswordOpen, setIsForgotPasswordOpen] = useState(false);

  const onSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setIsLoading(true);
    setError(null);

    const formData = new FormData(e.currentTarget);
    const email = formData.get("email") as string;
    const password = formData.get("password") as string;

    try {
      const data = await authService.login(email, password);

      login(data.access_token);
      onOpenChange(false);
    } catch (err) {
      setError(err instanceof Error ? err.message : "Error al iniciar sesión");
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <>
      <Drawer backdrop="blur" isOpen={isOpen} onOpenChange={onOpenChange}>
        <DrawerContent>
          {(onClose) => (
            <>
              <DrawerHeader className="flex flex-col gap-1">
                Inicio de Sesión
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
                      variant="bordered"
                    />
                    <Input
                      isRequired
                      label="Contraseña"
                      name="password"
                      placeholder="Ingrese la contraseña"
                      type="password"
                      variant="bordered"
                    />
                    {error && (
                      <div className="text-red-500 text-sm">{error}</div>
                    )}
                    <div className="flex py-2 px-1 justify-between">
                      <Checkbox aria-label="Recordarme">Recordarme</Checkbox>
                      <Link
                        color="primary"
                        href="#"
                        size="sm"
                        onPress={() => {
                          onClose();
                          setIsForgotPasswordOpen(true);
                        }}
                      >
                        Recuperar contraseña
                      </Link>
                    </div>
                    <p>
                      {`¿No tienes cuenta? `}
                      <Link
                        color="primary"
                        href="#"
                        size="sm"
                        onPress={() => {
                          onClose();
                          onOpenSignUp();
                        }}
                      >
                        Registrarme
                      </Link>
                    </p>
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
                        Iniciar
                      </Button>
                    </div>
                  </div>
                </Form>
              </DrawerBody>
            </>
          )}
        </DrawerContent>
      </Drawer>

      <ForgotPasswordDrawer
        isOpen={isForgotPasswordOpen}
        onOpenChange={setIsForgotPasswordOpen}
      />
    </>
  );
}

import type { NavigateOptions } from "react-router-dom";

import { useNavigate } from "react-router-dom";
import { HeroUIProvider } from "@heroui/react";
import { ToastContainer } from "react-toastify";
//https://www.npmjs.com/package/react-toastify

declare module "@react-types/shared" {
  interface RouterConfig {
    routerOptions: NavigateOptions;
  }
}

export function Provider({ children }: { children: React.ReactNode }) {
  const navigate = useNavigate();

  return (
    <HeroUIProvider>
      <ToastContainer
        draggable
        pauseOnFocusLoss
        autoClose={3000}
        closeOnClick={false}
        hideProgressBar={false}
        newestOnTop={false}
        position="top-right"
        rtl={false}
        theme="light"
      />
      {children}
    </HeroUIProvider>
  );
}

import { Navbar } from "@/components/navbar";

export default function DefaultLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <div className="">
      <Navbar />
      <main className="">{children}</main>
      <footer className="w-full flex items-center justify-center py-3 bg-gray-300">
        <p className="text-default-600">© 2025 <span className="text-primary">Sunrise</span>. Todos los derechos reservados.</p>
      </footer>
    </div>
  );
}

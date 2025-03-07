export type SiteConfig = typeof siteConfig;
export const siteConfig = {
  name: "Sunrise",
  description: "Make beautiful websites regardless of your design experience.",
  navItems: [
    {
      label: "Inicio",
      href: "/",
    },
    {
      label: "Cruceros",
      href: "/cruceros",
    },
    {
      label: "Destinos",
      href: "/destinos",
    },
    {
      label: "Barcos",
      href: "/barcos",
    },
    {
      label: "Sobre Nosotros",
      href: "/nosotros",
    },
    {
      label: "Administrativo",
      href: "/admin",
    },
  ],
  navAdmin: [
    {
      label: "Dashboard",
      href: "/admin/dashboard",
    },
    {
      label: "Gestion de Destinos",
      href: "/admin/destinos",
    },
    {
      label: "Gestion de Barcos",
      href: "/admin/barcos",
    },
    {
      label: "Gestion de Cruceros",
      href: "/admin/cruceros",
    },
    {
      label: "Gestion de Reservas",
      href: "/admin/reservas",
    },
    {
      label: "Gestion de Usuarios",
      href: "/admin/usuarios",
    },
    {
      label: "Pruebas",
      href: "/admin/prueba",
    },
  ],
  links: {
    github: "https://github.com/frontio-ai/heroui",
    twitter: "https://twitter.com/hero_ui",
    docs: "https://heroui.com",
    discord: "https://discord.gg/9b6yyZKmH4",
    sponsor: "https://patreon.com/jrgarciadev",
  },
};

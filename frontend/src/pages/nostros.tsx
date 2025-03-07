import { useNavigate } from "react-router-dom";

import DefaultLayout from "@/layouts/default";
import "../styles/nosotros.css";

export default function DocsPage() {
  const navigate = useNavigate();

  return (
    <DefaultLayout>
      <section className="about-us">
        <div className="container">
          {/* Sección: ¿Quiénes Somos? */}
          <div className="section fade-in">
            <h2 className="section-title">¿Quiénes Somos?</h2>
            <p className="section-text">
              En <strong>Sunrise</strong>, no solo organizamos cruceros; creamos
              experiencias que perduran en la memoria. Desde nuestra fundación
              en 2025, nos hemos dedicado a ofrecer viajes de lujo que combinan
              elegancia, aventura y comodidad. Nuestra misión es simple pero
              poderosa: transformar el concepto de viajes en algo más que un
              simple desplazamiento, convirtiéndolo en una oportunidad para
              descubrir, relajarse y conectar con el mundo.
            </p>
            <p className="section-text">
              Con una visión clara de ser líderes en el turismo de cruceros en
              América Latina, nos esforzamos por innovar constantemente,
              ofreciendo itinerarios únicos y servicios personalizados que
              superan las expectativas de nuestros pasajeros. En Sunrise, no
              solo viajas; vives una historia que contarás una y otra vez.
            </p>
          </div>

          {/* Sección: ¿Qué Nos Hace Únicos? */}
          <div className="section fade-in">
            <h2 className="section-title">¿Qué Nos Hace Únicos?</h2>
            <p className="section-text">
              En un mundo lleno de opciones, en <strong>Sunrise</strong> nos
              destacamos por nuestra capacidad para ofrecer algo verdaderamente
              especial. No se trata solo de llegar a un destino, sino de cómo
              llegas allí. Nuestros itinerarios están diseñados para sorprender,
              llevándote a lugares exóticos y paradisíacos que pocos tienen la
              oportunidad de explorar.
            </p>
            <p className="section-text">
              Además, nos enorgullece ofrecer un servicio personalizado que se
              adapta a tus necesidades. Desde el momento en que reservas hasta
              que regresas a casa, nuestro equipo está contigo para asegurarse
              de que cada detalle esté cuidado. Y no olvidamos nuestro
              compromiso con el planeta: todos nuestros cruceros operan con
              prácticas sostenibles, porque creemos que el lujo y la
              responsabilidad ambiental pueden ir de la mano.
            </p>
          </div>

          {/* Sección: Nuestro Compromiso */}
          <div className="section fade-in">
            <h2 className="section-title">Nuestro Compromiso</h2>
            <p className="section-text">
              En <strong>Sunrise</strong>, no solo nos comprometemos con
              nuestros clientes, sino también con el mundo que nos rodea.
              Creemos que el turismo debe ser una fuerza positiva, y por eso nos
              esforzamos por minimizar nuestro impacto ambiental. Desde la
              reducción de emisiones hasta el apoyo a comunidades locales, cada
              decisión que tomamos está guiada por nuestros valores de
              sostenibilidad y responsabilidad social.
            </p>
            <p className="section-text">
              También nos comprometemos a ofrecer la más alta calidad en cada
              aspecto de tu viaje. Desde la gastronomía gourmet hasta las
              actividades a bordo, cada detalle está pensado para brindarte una
              experiencia inigualable. Para nosotros, tu satisfacción no es solo
              un objetivo; es nuestra razón de ser.
            </p>
          </div>

          {/* Sección: Nuestros Clientes */}
          <div className="section fade-in">
            <h2 className="section-title">Nuestros Clientes</h2>
            <p className="section-text">
              Nuestros clientes son el corazón de todo lo que hacemos. Son
              viajeros que buscan más que unas vacaciones; buscan experiencias
              que los inspiren, los relajen y los transformen. Aquí hay algunas
              de las cosas que dicen sobre nosotros:
            </p>
            <div className="testimonials">
              <blockquote className="testimonial">
                "Viajar con Sunrise fue como entrar en un sueño. Cada detalle
                estaba cuidado, y el destino era simplemente mágico. ¡No puedo
                esperar para repetir la experiencia!"
                <cite className="testimonial-author">– Ana López</cite>
              </blockquote>
              <blockquote className="testimonial">
                "El servicio fue impecable, y los destinos fueron más allá de
                mis expectativas. Definitivamente, Sunrise sabe cómo hacer que
                un viaje sea inolvidable."
                <cite className="testimonial-author">– Carlos Martínez</cite>
              </blockquote>
            </div>
          </div>

          {/* Sección: Nuestro Futuro */}
          <div className="section fade-in">
            <h2 className="section-title">Nuestro Futuro</h2>
            <p className="section-text">
              El futuro de <strong>Sunrise</strong> está lleno de emocionantes
              posibilidades. Estamos trabajando en expandir nuestros horizontes,
              llevándote a destinos aún más increíbles y exclusivos. Además,
              estamos incorporando tecnología de vanguardia para hacer que tu
              experiencia sea aún más personalizada y cómoda.
            </p>
            <p className="section-text">
              Nuestro objetivo es seguir siendo líderes en la industria, no solo
              por la calidad de nuestros servicios, sino también por nuestra
              capacidad para innovar y adaptarnos a las necesidades de nuestros
              pasajeros. El futuro es brillante, y queremos que seas parte de
              él.
            </p>
          </div>

          {/* Llamado a la Acción */}
          <div className="cta fade-in">
            <h2 className="cta-title">
              ¿Listo para vivir una experiencia única?
            </h2>
            <p className="cta-text">
              En <strong>Sunrise</strong>, te invitamos a descubrir un mundo de
              posibilidades. Explora nuestros cruceros, elige tu destino soñado
              y déjanos encargarnos de todo. ¡Tu próxima gran aventura comienza
              aquí!
            </p>
            <button
              className="cta-button"
              onClick={() => navigate(`/cruceros`)}
            >
              Explorar Cruceros
            </button>
          </div>
        </div>
      </section>
    </DefaultLayout>
  );
}

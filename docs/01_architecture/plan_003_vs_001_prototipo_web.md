# PLAN-003 - Prototipo web VS-001

## 1. Identificacion

- Codigo: `PLAN-003`.
- Nombre: plan tecnico del prototipo web `VS-001 - El Despertar de Lumea`.
- Repositorio: `Vinsagh-cpu/Vinsagh-eco`.
- Rama obligatoria: `planning/vs-001-web-prototype`.
- Archivo autorizado: `docs/01_architecture/plan_003_vs_001_prototipo_web.md`.
- Naturaleza de esta ejecucion: exclusivamente documental.
- Implementacion autorizada por este documento: solo Sprint tecnico 01 interno, bajo los limites de este plan.

Este plan prepara una primera implementacion web controlada de `VS-001`. Esta ejecucion documental no crea pantallas, no modifica codigo Dart, no modifica tests, no modifica `pubspec.yaml`, no agrega dependencias, no crea assets y no modifica `docs/00_canon`.

El plan actualizado autoriza unicamente el Sprint tecnico 01 interno. No autoriza diseno creativo provisional, prototipo visual revisable, Sprint tecnico 02 ni cambios sobre `Mi Sendero`.

## 2. Dependencias

Dependencias documentales revisadas:

- `PLAN-001 - Auditoria de reestructuracion arquitectonica Lumea`.
- `PLAN-002 - Reorganizacion no funcional de la base Flutter`.
- `VS-001 - El Despertar de Lumea`.
- Commit `a5ef9c5 docs(vs-001): define implementation gates`.

Resoluciones heredadas:

- La app conserva `APP-009` como experiencia visual aprobada de `Mi Sendero`.
- `PLAN-002` creo `LumeaAppEntry` como punto de entrada temporal hacia `MiSenderoScreen`.
- `VS-001` no crea Portal, no implementa Realidad Aumentada y termina en `Portal pendiente de creacion`.
- La web usara simulacion controlada; no afirmara que existe biometria real.
- Lumi permanece completamente ausente dentro del flujo `VS-001`.

## 3. Objetivo

Definir el plan tecnico para iniciar el Sprint tecnico 01 interno del prototipo web `VS-001 - El Despertar de Lumea`.

El prototipo futuro debe validar:

- Ritmo narrativo de apertura, invitacion, autorizacion simulada, despertar, Compi, Primer Vinculo y cierre.
- Transicion entre escenas sin convertir la entrada en login, splash, home o formulario administrativo.
- Ausencia de biometria real en web.
- Alternativa accesible completa para continuar.
- Estado final `Portal pendiente de creacion`.

Este documento autoriza unicamente el Sprint tecnico 01 interno. No autoriza el Sprint tecnico 02 ni ningun prototipo visual revisable mientras no se apruebe el tratamiento visual de la Huella.

## 4. Principios tecnicos

- Web primero, sin Android ni iOS en esta fase.
- Sin biometria real, sin plugins biometricos, sin camara y sin permisos de dispositivo.
- La autorizacion web, cuando se implemente despues de Sprint tecnico 01, sera una simulacion local, determinista y explicita para desarrollo y QA.
- La experiencia narrativa solo recibe resultados de autorizacion, no detalles de plataforma.
- No se almacena informacion sensible ni credenciales.
- No se implementa persistencia definitiva.
- No se implementa Portal ni Realidad Aumentada.
- No se modifica `Mi Sendero` ni la experiencia `APP-009`.
- No se introducen dependencias nuevas.
- No se crean `data/` ni `domain/` vacios.
- Las decisiones visuales de Huella y cualquier Compi corporal requieren aprobacion de Direccion Creativa antes del codigo visible.

## 5. Alcance

El prototipo web futuro prepara un flujo cerrado con estas escenas:

1. Apertura en oscuridad.
2. Aparicion de la Huella de Lumea.
3. Invitacion a despertar.
4. Simulacion web de autorizacion.
5. Despertar visual base.
6. Presencia provisional y autorizada de Compi.
7. Primer Vinculo minimo.
8. Afinidad inicial.
9. Estado final `Portal pendiente de creacion`.
10. Fade a negro.

El alcance tecnico se limita a una experiencia web de validacion narrativa y accesible. No debe presentarse como flujo productivo de identidad, registro, autenticacion real ni perfil definitivo.

Para Sprint tecnico 01, este flujo existe solo como shell interno de estados, transiciones, semantica y navegacion. La Huella solo puede existir como concepto de estado y accion accesible interna; Compi solo puede existir como secuencia textual sin representacion corporal.

## 6. Fuera de alcance

Queda fuera de alcance:

- Biometria real.
- Plugins biometricos.
- Camara.
- Permisos del dispositivo.
- Android.
- iOS.
- Portal real.
- Realidad Aumentada.
- Anclajes espaciales.
- Persistencia definitiva.
- Firebase.
- Backend.
- Registro o autenticacion real.
- `Mi Sendero` dentro de este flujo.
- Lumi.
- Economia.
- V.S. Coins.
- Galeria de Samara.
- Atelier.
- Reconexion.
- Sonido o musica oficial.
- Assets definitivos.
- Diseno definitivo de Compi.
- Diseno definitivo de la Huella.
- Monograma.

## 7. Estado actual de la app

Estado actual despues de `PLAN-002`:

```text
main.dart
  -> VinsaghEcoApp
    -> MaterialApp
      -> LumeaAppEntry
        -> MiSenderoScreen
```

`LumeaAppEntry` ya concentra la decision temporal de entrada, pero actualmente devuelve `MiSenderoScreen`. La app no tiene router, feature flags, Portal, onboarding, persistencia, servicios de autorizacion, Firebase ni backend conectado.

La experiencia `APP-009` sigue siendo `Mi Sendero` y no debe alterarse por el prototipo `VS-001`. La ausencia de Lumi aplica al flujo `VS-001`; no autoriza modificar el contenido actual de `Mi Sendero`, donde Lumi todavia existe como parte de `APP-009`.

## 8. Flujo del prototipo

Flujo propuesto:

```text
initialDarkness
  -> footprintVisible
  -> invitationVisible
  -> authorizationRequested
  -> authorizationAuthorized
  -> awakeningInProgress
  -> compiArrival
  -> firstBondInProgress
  -> initialAffinity
  -> firstBondCompleted
  -> portalPending
  -> completed
```

Para Sprint tecnico 01, `footprintVisible` es solo el nombre conceptual del estado y de la accion interna accesible. No implica dibujar Huella, simbolo, monograma ni placeholder visual reconocible.

Ramas recuperables:

```text
authorizationRequested
  -> authorizationCancelled
  -> invitationVisible

authorizationRequested
  -> authorizationUnavailable
  -> accessibleAlternative
  -> awakeningInProgress

authorizationRequested
  -> authorizationRecoverableError
  -> invitationVisible

invitationVisible
  -> accessibleAlternative
  -> awakeningInProgress
```

El flujo debe sostener el ritmo narrativo sin depender de temporizadores bloqueantes. Las pausas pueden sugerir respiracion y presencia, pero siempre deben permitir continuar mediante accion accesible.

## 9. Estados y transiciones

Estados conceptuales minimos:

| Estado | Responsabilidad | Transiciones validas |
| --- | --- | --- |
| `initialDarkness` | Oscuridad intencional de apertura. | `footprintVisible` |
| `footprintVisible` | Reserva el estado conceptual de Huella; en Sprint 01 solo habilita accion interna accesible, sin dibujo ni placeholder visual. | `invitationVisible` |
| `invitationVisible` | Presenta invitacion y accion principal. | `authorizationRequested`, `accessibleAlternative` |
| `authorizationRequested` | Solicita resultado al servicio conceptual. | `authorizationAuthorized`, `authorizationCancelled`, `authorizationUnavailable`, `authorizationRecoverableError` |
| `authorizationAuthorized` | Confirma que la simulacion permitio continuar. | `awakeningInProgress` |
| `authorizationCancelled` | Respeta cancelacion del Guardian. | `invitationVisible`, `accessibleAlternative` |
| `authorizationUnavailable` | Indica que la via simulada no esta disponible. | `accessibleAlternative`, `invitationVisible` |
| `authorizationRecoverableError` | Permite reintento o via alternativa. | `invitationVisible`, `accessibleAlternative` |
| `accessibleAlternative` | Confirma intencion por una ruta accesible. | `awakeningInProgress`, `invitationVisible` |
| `awakeningInProgress` | Ejecuta despertar visual base. | `compiArrival` |
| `compiArrival` | Ejecuta la secuencia textual aprobada de Compi, sin representacion corporal. | `firstBondInProgress` |
| `firstBondInProgress` | Solicita datos minimos del Primer Vinculo. | `initialAffinity`, `invitationVisible` solo si se cancela antes de confirmar |
| `initialAffinity` | Solicita una afinidad inicial. | `firstBondCompleted` |
| `firstBondCompleted` | Resume datos minimos y consentimiento de prototipo. | `portalPending` |
| `portalPending` | Declara que el Portal no existe todavia. | `completed` |
| `completed` | Fade a negro y cierre del vertical slice. | Sin avance adicional dentro de VS-001 |

Acciones del Guardian:

- Observar apertura y, solo despues de aprobacion visual futura, Huella.
- Activar `Despertar Lumea` desde una accion accesible interna, boton o accion equivalente de teclado/lector.
- Cancelar la simulacion sin castigo.
- Elegir la accion alternativa `Continuar de otra forma`.
- Reintentar ante error recuperable.
- Ingresar nombre elegido.
- Elegir idioma.
- Ajustar preferencias basicas de accesibilidad.
- Aceptar consentimiento de prototipo claramente identificado mediante `Comprendo y deseo continuar`.
- Elegir afinidad inicial.
- Revisar y confirmar el Primer Vinculo minimo.

Estados recuperables:

- `authorizationCancelled`.
- `authorizationUnavailable`.
- `authorizationRecoverableError`.
- `accessibleAlternative`.
- `firstBondInProgress`, antes de confirmar consentimiento de prototipo.
- `initialAffinity`, antes de completar el Primer Vinculo.

Estados que no pueden saltarse:

- `initialDarkness`.
- `footprintVisible`, como estado conceptual sin Huella visible en Sprint 01.
- `invitationVisible`.
- `authorizationRequested` o `accessibleAlternative`.
- `awakeningInProgress`.
- `compiArrival`, con la secuencia textual aprobada y sin cuerpo visible.
- `firstBondInProgress`.
- `initialAffinity`.
- `portalPending`.
- `completed`.

Comportamiento al recargar la web, RESUELTO para Sprint tecnico 01:

- Estado solo en memoria.
- Reinicio completo desde `initialDarkness` al recargar.
- Sin `localStorage`.
- Sin `shared_preferences`.
- Sin Firebase.
- Sin backend.
- Sin recuperacion de sesion.
- Sin simulacion de sesion persistente.

Comportamiento de desarrollo:

- El servicio simulado puede devolver resultados deterministas configurados para QA.
- La configuracion debe vivir dentro del alcance del prototipo, no como sistema global de feature flags.
- Debe poder iniciar desde el flujo normal para validar ritmo completo.
- Cualquier inicio directo a un estado intermedio debe ser utilitario de desarrollo y no parte de la experiencia final.

Retorno seguro a la invitacion:

- Cancelacion, no disponibilidad y error recuperable deben volver a `invitationVisible` o a `accessibleAlternative`.
- No debe haber pantallas de error terminal.
- No se debe usar lenguaje de fallo, bloqueo, perdida de magia o castigo.

## 10. Autorizacion simulada

La web no realiza biometria.

Debe existir una abstraccion conceptual futura equivalente a:

```text
AwakeningAuthorizationService
```

Responsabilidad conceptual:

- Solicitar autorizacion para continuar.
- Devolver un resultado controlado.
- No acceder a hardware.
- No abrir camara.
- No solicitar permisos del dispositivo.
- No almacenar credenciales.
- No almacenar datos personales.
- No afirmar que se ejecuto biometria.

Resultados conceptuales:

- `authorized`.
- `cancelled`.
- `unavailable`.
- `recoverableError`.

Implementacion web futura:

- Puede usar una simulacion local y determinista.
- Debe ser explicita internamente para desarrollo y QA.
- No debe decir al Guardian que se ejecuto biometria.
- Debe presentar el acto como confirmacion para continuar, no como verificacion de identidad real.
- Debe permitir alternativa accesible desde la invitacion o desde estados de fallo recuperable.

Microcopy aprobado para alternativa y estados recuperables:

- Accion alternativa: "Continuar de otra forma".
- Cancelado: "Está bien. Puedes intentarlo de nuevo o continuar de otra forma."
- No disponible: "La confirmación no está disponible en este dispositivo. Puedes continuar de otra forma."
- Error recuperable: "No pudimos completar la confirmación. Puedes intentarlo nuevamente o continuar de otra forma."

Sustitucion posterior por adaptador nativo:

- La experiencia narrativa debe depender solo de resultados conceptuales.
- Un adaptador nativo futuro podria implementar la misma responsabilidad en Android o iOS.
- El adaptador nativo podria delegar en el sistema operativo y devolver solo `authorized`, `cancelled`, `unavailable` o `recoverableError`.
- La pantalla, el controlador y las transiciones no deben conocer detalles de biometria, permisos, sensores ni plataforma.
- La sustitucion no debe reescribir el ritmo narrativo; solo cambia el proveedor de resultado.

Este plan no crea la interfaz Dart, no crea el servicio y no autoriza paquetes biometricos.

## 11. Primer Vinculo minimo

Cuando se implemente el Primer Vinculo, la experiencia web debe pedir unicamente:

- Nombre elegido.
- Idioma.
- Preferencias basicas de accesibilidad.
- Consentimiento de prototipo claramente identificado.
- Afinidad inicial.

Consentimiento de prototipo aprobado:

> Esta es una prueba web de El Despertar de Lumea. No utiliza biometría real y tus respuestas no se conservarán al recargar la página. Al continuar, aceptas participar en esta validación de experiencia.

Accion aprobada:

> Comprendo y deseo continuar

Este consentimiento de prototipo no sustituye futuros consentimientos legales productivos.

En Sprint tecnico 01, estos datos y este consentimiento pueden existir solo como concepto de estado. No se implementa Primer Vinculo completo.

Datos excluidos:

- Rango de edad.
- Fecha de nacimiento.
- Region.
- Ubicacion.
- Correo.
- Contrasena.
- Telefono.
- Cuenta real.
- Perfil social.

Condiciones:

- El Primer Vinculo no debe parecer registro administrativo.
- Cada dato solicitado debe indicar proposito.
- El consentimiento del prototipo no equivale al consentimiento legal final del producto.
- El consentimiento de prototipo debe decir que la experiencia es una validacion web controlada y que no hay biometria real.
- La afinidad inicial no define clase, nivel, personalidad permanente ni bloqueo de contenido.
- El idioma y accesibilidad deben tener salida clara sin depender de animacion, color o sonido.

Afinidad inicial:

```text
Pregunta conceptual: Que lugar te gustaria descubrir primero?
Opciones conceptuales: Bosque, Agua, Montana, Vida silvestre, Jardines.
```

La pregunta puede cambiar de microcopy antes del codigo, pero no puede ampliar la captura de datos.

## 12. Persistencia temporal

Opciones evaluadas:

| Estrategia | Privacidad | Facilidad de prueba | Riesgo de volverse definitiva | Recuperacion de sesion | Limpieza de datos |
| --- | --- | --- | --- | --- | --- |
| Estado solo en memoria | Alta: no deja datos en navegador. | Alta para flujo completo; menor para recargas. | Bajo. | No recupera al recargar. | Automatica al cerrar o recargar. |
| Almacenamiento local provisional | Media: deja datos en navegador. | Alta para retomar estados. | Alto: puede consolidarse como arquitectura por accidente. | Recupera sesion parcial. | Requiere UI o rutina clara de limpieza. |
| Reinicio completo al recargar | Alta: no conserva datos. | Media: obliga repetir flujo. | Bajo. | Ninguna. | Automatica. |

Decision aprobada por Direccion Creativa, RESUELTA para Sprint tecnico 01:

- Usar estado solo en memoria.
- Aceptar reinicio completo al recargar como comportamiento intencional de la primera version.
- No autorizar `localStorage`, `shared_preferences`, base local, Firebase ni backend.
- No implementar recuperacion de sesion.
- No guardar nombre, idioma, accesibilidad, consentimiento ni afinidad inicial en esta fase.

Justificacion:

- Reduce riesgo de privacidad.
- Evita que un placeholder se convierta en arquitectura definitiva.
- Fuerza a validar el ritmo completo del despertar.
- Permite limpiar datos sin controles adicionales.
- Mantiene clara la diferencia entre prototipo web y producto final.

## 13. Huella de Lumea

Decision de Direccion Creativa: el diseno de la Huella permanece BLOQUEANTE para Sprint tecnico 02.

Para Sprint tecnico 01 la Huella solo puede existir como:

- Concepto de estado dentro del controlador o mecanismo equivalente.
- Accion accesible interna para avanzar el flujo.
- Transicion logica hacia la invitacion.

No dibujar en Sprint tecnico 01:

- Huella.
- Simbolo.
- Monograma.
- Placeholder visual reconocible.
- Forma abstracta que pueda interpretarse como tratamiento oficial.
- Asset, imagen generada o `CustomPainter` dedicado a representar la Huella.

Separacion tecnica para la decision futura:

| Parte | Sprint tecnico 01 | Sprint tecnico 02 o posterior |
| --- | --- | --- |
| Estado | Permitido como concepto interno. | Puede conectarse a la representacion aprobada. |
| Accion accesible | Permitida sin simbolo visual de Huella. | Debe conservar teclado, tacto y lector de pantalla. |
| Representacion visual | No autorizada. | Requiere aprobacion visual previa. |
| Animacion de Huella | No autorizada. | Requiere aprobacion de gesto, duracion y lenguaje visual. |
| Recurso grafico | No autorizado. | Requiere asset o tratamiento aprobado. |

Lineas permitidas para Sprint tecnico 01:

- Validar orden de estados.
- Validar foco, semantica y navegacion por teclado.
- Validar accion alternativa sin depender de un simbolo.
- Validar que no exista captura biometrica real ni apariencia de huella digital.

Lineas bloqueadas hasta aprobacion visual:

- Forma oficial.
- Linework definitivo.
- Monograma.
- Placeholder visual.
- Simbolo que pueda interpretarse como huella digital real capturada.
- Cualquier prototipo visual revisable basado en la Huella.

## 14. Compi

Decision de Direccion Creativa: el tratamiento provisional de Compi queda RESUELTO para Sprint tecnico 01 como secuencia textual sin representacion corporal.

Tratamiento autorizado:

- Secuencia textual.
- Sin cuerpo visible.
- Sin representacion corporal.
- Sin inferir especie, silueta, escala, rostro, gesto ni materialidad.

No usar:

- Emoji.
- Silueta.
- Avatar.
- Mascota.
- Imagen generada.
- Icono de Flutter.
- Personaje generico.
- Placeholder que sugiera diseno oficial.
- Ilustracion provisional tratada como oficial.

La secuencia textual no aprueba el diseno definitivo de Compi. No se debe afirmar que Compi conoce identidad, biometria o datos privados del Guardian.

## 15. Ausencia de Lumi

Lumi permanece completamente ausente en `VS-001`.

No crear:

- Componente.
- Placeholder.
- Referencia visual.
- Voz.
- Particulas vinculadas a ella.
- Codigo preparado especificamente para su aparicion.
- Copy que sugiera su presencia.
- Sombra, reflejo, silueta o senal indirecta.

La ausencia de Lumi se valida dentro del prototipo `VS-001`. No autoriza cambios sobre `Mi Sendero` ni sobre `APP-009`, donde Lumi pertenece a la experiencia existente.

## 16. Accesibilidad

La accesibilidad debe entrar desde el primer sprint de implementacion futura.

Requisitos:

- Navegacion por teclado.
- Compatibilidad con lectores de pantalla.
- Orden de foco predecible.
- Accion alternativa a la accion principal; cuando exista Huella aprobada, esa alternativa no debe depender de verla.
- Reduccion de movimiento.
- Contraste suficiente.
- Texto escalable.
- Ausencia de temporizadores bloqueantes.
- Control de pausas narrativas.
- Equivalentes textuales.
- Simulacion accesible de autorizacion.
- No depender exclusivamente de color, sonido o animacion.

Decisiones tecnicas futuras:

- La accion principal debe ser alcanzable como boton o control semantico. Si en una fase futura la Huella tiene tratamiento visual no convencional, la accion debe conservar equivalencia accesible.
- Cada escena debe tener un titulo o descripcion accesible suficiente.
- Las pausas narrativas deben poder avanzarse sin esperar animaciones largas.
- Los estados `cancelled`, `unavailable` y `recoverableError` deben ofrecer salida clara y accesible.
- La alternativa accesible debe llegar al mismo estado final que la via autorizada.
- El Primer Vinculo debe poder completarse con teclado y lector de pantalla.
- El consentimiento de prototipo debe ser claro, no poetico y no escondido.

## 17. Movimiento

La estrategia de movimiento debe basarse unicamente en capacidades nativas de Flutter. No agregar paquetes de animacion.

Widgets y APIs nativas posibles:

- `AnimatedOpacity`.
- `AnimatedScale`.
- `AnimatedSwitcher`.
- `AnimatedContainer`.
- `TweenAnimationBuilder`.
- `AnimationController`.
- `FadeTransition`.
- `ScaleTransition`.
- `SlideTransition`.
- `CustomPainter`, solo si una Huella visual aprobada lo requiere en Sprint tecnico 02 o posterior.

Duraciones provisionales para fases visuales futuras. Estos rangos no autorizan Huella visible ni Compi corporal en Sprint tecnico 01:

| Transicion | Duracion sugerida | Nota |
| --- | ---: | --- |
| Oscuridad inicial | 1500 a 2000 ms | No debe bloquear accesibilidad. |
| Aparicion de Huella | 700 a 1000 ms | Pulso suave, sin neones. |
| Invitacion | 400 a 700 ms | Texto legible antes de pedir accion. |
| Espera narrativa | 600 a 1200 ms | No usar spinner tecnico. |
| Despertar visual base | 1200 a 1800 ms | Luz organica y sobria. |
| Llegada de Compi | 600 a 1000 ms | Solo secuencia textual en Sprint 01; cualquier cuerpo requiere aprobacion posterior. |
| Fade final | 600 a 900 ms | Cierra `Portal pendiente`. |

Reduccion de movimiento:

- Sustituir desplazamientos, pulsos y escalas por cambios de opacidad o estado estatico.
- Reducir duraciones a 0 a 150 ms.
- Mantener significado mediante texto, orden de foco y cambios de contenido.
- No bloquear avance por animaciones.

Limites de rendimiento web:

- Evitar filtros costosos, sombras multiples animadas y particulas densas.
- Evitar repintados globales continuos.
- No animar grandes arboles de widgets cuando baste animar opacidad o escala de contenedores pequenos.
- Mantener cambios aislados a `features/awakening` para no alterar visualmente `APP-009`.

## 18. Sonido

No implementar sonido en la primera iteracion salvo autorizacion posterior.

Preparacion conceptual:

- Sonido desactivado por defecto durante desarrollo.
- Control visible cuando se incorpore.
- Alternativa textual para informacion transmitida por sonido.
- Respeto por preferencias del dispositivo cuando la plataforma lo permita.
- Ningun sonido debe ser necesario para completar el flujo.

No autorizar en esta fase:

- Assets de audio.
- Paquetes de reproduccion.
- Musica oficial.
- Efectos temporales.
- Sonidos de exito, error, sistema o biometria.

## 19. Arquitectura propuesta

Estructura autorizada para Sprint tecnico 01 interno, sin implementacion durante esta ejecucion documental:

```text
features/
  awakening/
    presentation/
      awakening_screen.dart
      controller/
      widgets/
```

No crear en Sprint tecnico 01:

- `data/`.
- `domain/`.
- Servicios Dart de autorizacion funcional.
- Repositorios.
- Assets.
- Persistencia.
- Integraciones de plataforma.
- Dependencias nuevas.

Responsabilidades del shell tecnico interno:

| Elemento | Responsabilidad |
| --- | --- |
| Shell de experiencia | Componer estados sin diseno final y exponer semantica accesible. |
| Controlador de experiencia | Coordinar maquina de estados, transiciones y acciones del Guardian. |
| Estado | Representar la escena actual y datos efimeros del Primer Vinculo en memoria. |
| Autorizacion | Representar estados conceptuales, sin autorizacion simulada funcional en Sprint 01. |
| Primer Vinculo | Mantener concepto de estados; no implementar Primer Vinculo completo en Sprint 01. |
| Accesibilidad | Incluir reduccion de movimiento, foco, textos alternativos y ruta alternativa desde el inicio. |
| Transiciones | Encapsular duraciones, reduccion de movimiento y cambios visuales nativos. |

La arquitectura debe aislar `VS-001` de `journey`. `Mi Sendero` no se mueve y no se convierte en dependencia del despertar.

## 20. Integracion con LumeaAppEntry

`LumeaAppEntry` no se modifica durante esta ejecucion documental ni durante Sprint tecnico 01.

Sprint tecnico 01 debe mantener `Mi Sendero` protegido mediante guardia de regresion. Cualquier cambio futuro de entrada hacia `AwakeningScreen` requiere aprobacion posterior y no forma parte del GO actual.

Opciones evaluadas:

| Opcion | Ventaja | Riesgo | Evaluacion |
| --- | --- | --- | --- |
| Constante de desarrollo local | Simple, reversible y sin dependencia. | Puede quedarse como feature flag informal. | No autorizada para Sprint tecnico 01; evaluar despues. |
| Configuracion de compilacion | Permite builds separados. | Puede introducir pseudo feature flags antes de tiempo. | No recomendada para el primer sprint. |
| Punto temporal de entrada en `LumeaAppEntry` | Aprovecha `PLAN-002` y evita router. | Debe proteger acceso a `Mi Sendero`. | No autorizada para Sprint tecnico 01; evaluar despues. |
| Router | Escala a flujos futuros. | Agrega arquitectura no necesaria. | No autorizada. |

Recomendacion:

- En Sprint tecnico 01, `LumeaAppEntry` debe seguir apuntando a la experiencia actual.
- En una fase futura, `LumeaAppEntry` podria apuntar temporalmente al prototipo `AwakeningScreen` solo con aprobacion explicita.
- La restauracion a `MiSenderoScreen` debe ser un cambio pequeno y obvio si esa fase futura se autoriza.
- No implementar feature flags.
- No agregar router.
- No destruir ni ocultar irreversiblemente el acceso actual a `Mi Sendero`.
- Documentar en el commit futuro que el cambio de entrada es temporal para validacion de `VS-001`.

## 21. Estrategia de pruebas

Pruebas futuras propuestas:

- Secuencia feliz completa.
- Cancelacion de autorizacion.
- Autorizacion no disponible.
- Error recuperable.
- Alternativa accesible.
- Reduccion de movimiento.
- Foco y semantica.
- Primer Vinculo minimo.
- Afinidad inicial.
- Estado final `Portal pendiente`.
- Ausencia de Lumi dentro del prototipo `VS-001`.
- Ausencia de biometria real.
- Ausencia de cambios en `Mi Sendero`.

Sprint tecnico 01 debe incluir como minimo:

- Pruebas de estados.
- Guardia de regresion para confirmar que `Mi Sendero` permanece protegido.

Enfoque:

- Tests de widget para maquina de estados visible y acciones principales.
- Tests de controlador si la logica queda suficientemente separada.
- Tests de semantica para labels, roles y foco.
- Tests de regresion para confirmar que `APP-009` sigue renderizando `Mi Sendero`.
- Tests especificos que verifiquen que el servicio web simulado no accede a hardware, permisos ni almacenamiento.

No crear tests durante esta ejecucion documental.

## 22. Riesgos

| Riesgo | Impacto | Mitigacion |
| --- | --- | --- |
| La simulacion se percibe como biometria real. | Riesgo de privacidad y confianza. | Copy claro: web usa confirmacion controlada, no biometria. |
| La Huella abstracta se vuelve canonica por accidente. | Riesgo creativo. | No dibujar Huella ni placeholder en Sprint 01; Sprint 02 queda en NO-GO hasta aprobacion visual. |
| Compi provisional fija un diseno no aprobado. | Riesgo creativo alto. | Usar solo secuencia textual sin representacion corporal; no emoji, avatar, mascota ni imagen generada. |
| Persistencia local se vuelve arquitectura definitiva. | Riesgo tecnico y privacidad. | Estado solo en memoria, sin `localStorage`, `shared_preferences`, Firebase ni recuperacion de sesion. |
| El prototipo rompe `APP-009`. | Regresion visual. | Aislar `features/awakening` y probar `Mi Sendero`. |
| El flujo parece login. | Falla narrativa. | Evitar copy tecnico y formularios administrativos. |
| Temporizadores bloquean accesibilidad. | Falla de uso. | Permitir avance por accion y reduccion de movimiento. |
| Lumi se insinua por particulas o luz. | Contradiccion canonica. | Tratar luz y particulas como Lumea/universo, no Lumi. |
| Portal parece creado. | Falla de alcance. | Cerrar con `Portal pendiente de creacion` y fade a negro. |
| Microcopy legal se mezcla con poesia. | Riesgo legal/producto. | Separar consentimiento de prototipo en texto claro. |

## 23. Puertas de implementacion

Clasificacion:

| Puerta | Estado | Lectura |
| --- | --- | --- |
| Alcance web | RESUELTO | Prototipo web controlado, sin Android/iOS. |
| Simulacion de autorizacion | RESUELTO | Concepto y resultados definidos; no biometria real. |
| Metodo alternativo | RESUELTO | Accion aprobada: `Continuar de otra forma`. |
| Diseno de Huella | BLOQUEANTE PARA SPRINT 02 | No hay diseno oficial ni placeholder aprobado; Sprint 01 solo puede usar concepto de estado y accion accesible interna. |
| Tratamiento provisional de Compi | RESUELTO | Secuencia textual sin representacion corporal; sin emoji, silueta, avatar, mascota, imagen generada ni placeholder oficial. |
| Copy de consentimiento | RESUELTO | Texto y accion aprobados; no sustituye consentimientos legales productivos futuros. |
| Estrategia temporal de estado | RESUELTO | Estado solo en memoria; reinicio completo al recargar; sin `localStorage`, `shared_preferences`, Firebase ni recuperacion de sesion. |
| Reduccion de movimiento | RESUELTO PARA SPRINT 01 | Debe existir desde el inicio del shell tecnico. |
| Sonido | RESUELTO | No se implementa en primera iteracion. |
| Microcopy final | RESUELTO PARA SPRINT 01 | Alternativa, cancelacion, no disponibilidad y error recuperable quedan aprobados. |
| Duracion de escenas | PARCIALMENTE RESUELTO | Hay rangos provisionales; falta validacion narrativa. |
| Validacion de accesibilidad | RESUELTO PARA SPRINT 01 | Semantica, teclado y reduccion de movimiento entran desde el inicio; validacion final sigue antes de prototipo revisable. |

Decision de puertas:

- GO para Sprint tecnico 01 interno.
- NO-GO para Sprint tecnico 02 hasta aprobar el tratamiento visual de la Huella.
- NO-GO para cualquier prototipo visual revisable hasta aprobar el tratamiento visual de la Huella.
- Sin diseno creativo provisional.

## 24. Fases y commits recomendados

Decision vigente:

- Sprint tecnico 01: GO interno.
- Sprint tecnico 02: NO-GO hasta aprobacion visual de la Huella.
- Cualquier prototipo visual revisable: NO-GO hasta aprobacion visual de la Huella.

Sprint tecnico 01 incluira unicamente:

- Estructura de `features/awakening/presentation`.
- Shell de experiencia.
- Controlador o mecanismo equivalente de estados en memoria.
- Transiciones validas sin diseno final.
- Reduccion de movimiento desde el inicio.
- Semantica y navegacion por teclado.
- Pruebas de estados.
- Guardia de regresion para `Mi Sendero`.

Sprint tecnico 01 no incluira:

- Huella visible.
- Compi corporal.
- Primer Vinculo completo.
- Autorizacion simulada funcional.
- Animaciones creativas definitivas.
- Sonido.
- Persistencia.
- Portal.
- Realidad Aumentada.
- Lumi.

Secuencia recomendada despues de esta decision:

1. Sprint tecnico 01: shell interno de escenas y estados en memoria.
   - Commit sugerido: `feat(awakening): add in-memory scene shell`.
   - Condicion: solo alcance tecnico interno listado arriba.

2. Sprint tecnico 02: Huella autorizada e invitacion.
   - Commit sugerido: `feat(awakening): add approved footprint invitation`.
   - Condicion: NO-GO hasta aprobacion visual de la Huella.

3. Sprint tecnico 03: simulacion de autorizacion y casos alternativos.
   - Commit sugerido: `feat(awakening): add simulated authorization outcomes`.
   - Condicion: no biometria real, no hardware, no permisos.

4. Sprint tecnico 04: despertar visual base.
   - Commit sugerido: `feat(awakening): add base awakening transition`.
   - Condicion: movimiento nativo, reduccion de movimiento desde el inicio.

5. Sprint tecnico 05: presencia autorizada de Compi.
   - Commit sugerido: `feat(awakening): add approved compi presence`.
   - Condicion: tratamiento visual aprobado si se pretende representacion no textual; sin diseno inventado.

6. Sprint tecnico 06: Primer Vinculo minimo.
   - Commit sugerido: `feat(awakening): add minimal first bond`.
   - Condicion: copy de consentimiento de prototipo aprobado.

7. Sprint tecnico 07: afinidad y cierre Portal pendiente.
   - Commit sugerido: `feat(awakening): add initial affinity and portal pending close`.
   - Condicion: no Portal real, no AR, no persistencia definitiva.

8. Sprint tecnico 08: accesibilidad, pruebas y validacion narrativa.
   - Commit sugerido: `test(awakening): cover accessibility and narrative states`.
   - Condicion: foco, semantica, reduccion de movimiento, rutas alternativas y ausencia de Lumi validadas.

Correccion recomendada:

- La accesibilidad no debe esperar al sprint 08 para existir. El sprint 08 debe ser endurecimiento y validacion final, no primera incorporacion.
- La reduccion de movimiento debe entrar desde el sprint 01.
- La aprobacion de Huella debe preceder al sprint 02.
- La representacion visual de Compi debe preceder cualquier Compi corporal.
- El consentimiento de prototipo ya esta aprobado para el shell y no sustituye consentimientos legales productivos.

## 25. Criterios de aceptacion

Criterios para este plan:

- Documento unico actualizado en `docs/01_architecture/plan_003_vs_001_prototipo_web.md`.
- Sin cambios de codigo, tests, dependencias, assets ni `docs/00_canon`.
- Alcance web, simulacion de autorizacion, estados, accesibilidad, persistencia temporal, Huella, Compi, copy aprobado, ausencia de Lumi, pruebas futuras y puertas documentadas.
- GO de Sprint tecnico 01 interno registrado.
- NO-GO de Sprint tecnico 02 y de prototipo visual revisable registrado.

Criterios para Sprint tecnico 01 interno:

- Existe shell de experiencia dentro de `features/awakening/presentation`.
- La web no afirma ni ejecuta biometria real.
- El estado vive solo en memoria.
- Recargar reinicia completamente el flujo.
- No se usa `localStorage`, `shared_preferences`, Firebase ni recuperacion de sesion.
- Cancelacion, no disponibilidad y error recuperable tienen retorno seguro.
- La alternativa accesible llega al mismo cierre.
- No hay Huella visible ni placeholder reconocible.
- Compi no tiene cuerpo, avatar, silueta, emoji, mascota ni imagen generada.
- No hay Primer Vinculo completo.
- No hay autorizacion simulada funcional.
- No hay sonido, Portal, AR, persistencia ni assets.
- Lumi esta ausente dentro de `VS-001`.
- `APP-009` permanece sin regresiones.

## 26. Fuera de alcance tecnico

No autorizado durante esta ejecucion documental:

- Modificar codigo.
- Modificar tests.
- Modificar `pubspec.yaml`.
- Agregar dependencias.
- Crear assets.
- Crear `features/awakening`.
- Modificar `LumeaAppEntry`.
- Modificar `MiSenderoScreen`.
- Modificar `Mi Sendero`.
- Modificar `docs/00_canon`.

No autorizado para Sprint tecnico 01:

- Huella visible.
- Simbolo, monograma o placeholder visual reconocible.
- Compi corporal.
- Emoji, silueta, avatar, mascota o imagen generada para Compi.
- Primer Vinculo completo.
- Autorizacion simulada funcional.
- Crear `data/` o `domain/`.
- Modificar `LumeaAppEntry`.
- Modificar `MiSenderoScreen`.
- Modificar `pubspec.yaml`.
- Agregar dependencias.
- Crear assets.
- Implementar biometria.
- Implementar persistencia.
- Implementar Portal.
- Implementar Realidad Aumentada.
- Implementar sonido.
- Modificar `docs/00_canon`.

## 27. Recomendacion GO / GO CON CONDICIONES / NO-GO

Recomendacion actualizada:

- **GO** para Sprint tecnico 01 interno.
- **NO-GO** para Sprint tecnico 02 hasta aprobar el tratamiento visual de la Huella.
- **NO-GO** para cualquier prototipo visual revisable hasta aprobar el tratamiento visual de la Huella.

El Sprint tecnico 01 puede avanzar solo como shell tecnico interno, sin diseno creativo provisional, sin Huella visible, sin Compi corporal, sin persistencia, sin Portal, sin AR, sin Lumi y sin afirmar capacidades que la web no ejecuta.

# GAME-001 - Flame Boundaries

## Proposito

Definir limites claros entre UX, Storyboard, Flame, ART-001, DS-001 y Firebase para evitar implementaciones prematuras.

## Principio

Flame amplifica la experiencia, no la reemplaza.

## Responsabilidades por capa

| Capa | Responsabilidad | No debe hacer |
| --- | --- | --- |
| UX-001 | Definir objetivo emocional, copy, estados y flujo. | Resolver escenas Flame o persistencia. |
| SB-001 | Ordenar beats, ritmo e intencion de cada momento. | Definir layout final, assets o clases. |
| GAME-001 | Reservar escenas, eventos interactivos y limites tecnicos. | Implementar codigo, assets o Firebase. |
| ART-001 | Controlar entrada y aprobacion de assets. | Permitir assets sin identificador VE y manifiesto. |
| DS-001 | Definir tokens, componentes base y direccion visual aprobada. | Ser reemplazado por estilos aislados de Flame. |
| FIRE-001 | Persistir progreso en una fase posterior. | Controlar ritmo, copy, escena o interaccion. |

## Limites de Flame

Flame puede, en una fase futura:

- Renderizar escenas interactivas.
- Responder a toques simples.
- Acompanhar elecciones.
- Mostrar transiciones tecnicas.
- Revelar una recompensa conceptual.

Flame no puede, dentro de PACKAGE-001:

- Crear pantallas finales.
- Crear onboarding generico.
- Definir canon.
- Agregar assets reales.
- Agregar audio real.
- Crear animaciones finales.
- Implementar login.
- Implementar tienda.
- Implementar closet.
- Implementar Founder Club.
- Implementar Firebase.
- Presentar personajes completos.

## Limites de assets

Todo asset futuro debe cumplir ART-001:

- Identificador `VE`.
- Version.
- Estado.
- Ruta.
- Registro en manifiesto.
- Aprobacion humana.

Si no hay asset aprobado, Flame debera usar placeholders tecnicos futuros.

## Limites de diseno

La implementacion interactiva futura debera respetar DS-001. Flame no debe introducir colores, estilos, iconos, botones, tipografias o comportamiento visual no aprobados.

## Limites de Firebase

Firebase podra almacenar progreso en FIRE-001 o una fase posterior, pero no debe controlar la experiencia interactiva.

La experiencia debe poder ejecutar su ritmo localmente antes de persistir:

- `agentStatus`
- `firstSessionCompleted`
- `firstChoice`
- `firstIntention`
- `firstRewardUnlocked`

## Limites de Vin y Sagh

Vin y Sagh permanecen como presencias reservadas.

GAME-001 no aprueba:

- Apariencia final.
- Dialogos.
- Biografia.
- Rol mecanico.
- Estados de personaje.
- Animaciones.
- Assets.

## Checklist antes de implementar Flame

- UX-001 aprobado para implementacion.
- SB-001 aprobado para implementacion.
- DS-001 con tokens visuales suficientes.
- ART-001 con assets aprobados o autorizacion de placeholders tecnicos.
- INIT-001 completado con Flutter disponible.
- Dependencia Flame autorizada.
- Limites de Firebase definidos en FIRE-001.
- Revision humana antes de crear pantallas o escenas reales.

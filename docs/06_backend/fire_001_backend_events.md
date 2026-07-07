# FIRE-001 - Backend Events

## Proposito

Reservar los eventos de backend que Firebase podra almacenar o sincronizar en una fase posterior.

Estos eventos no se implementan todavia. No reemplazan UX-001, SB-001 ni GAME-001.

## Eventos reservados

| Evento | Origen | Proposito |
| --- | --- | --- |
| `VE_EVENT_FIRST_SESSION_STARTED` | UX | Marcar el inicio de la primera sesion. |
| `VE_EVENT_AGENT_WELCOME_VIEWED` | UX | Registrar que la bienvenida fue vista. |
| `VE_EVENT_AGENT_ACTIVATION_STARTED` | UX | Registrar el comienzo de la activacion. |
| `VE_EVENT_FIRST_CHOICE_SELECTED` | UX | Guardar la primera eleccion del Agente. |
| `VE_EVENT_FIRST_INTENTION_SELECTED` | UX | Guardar la intencion declarada. |
| `VE_EVENT_FIRST_REWARD_UNLOCKED` | UX | Guardar el desbloqueo de la primera recompensa. |
| `VE_EVENT_FIRST_SESSION_COMPLETED` | UX | Cerrar la primera sesion. |
| `VE_GAME_EVENT_SCENE_STARTED` | GAME | Registrar inicio de escena interactiva. |
| `VE_GAME_EVENT_AGENT_TAP` | GAME | Registrar toque o accion primaria. |
| `VE_GAME_EVENT_CHOICE_SELECTED` | GAME | Registrar seleccion interactiva. |
| `VE_GAME_EVENT_REWARD_ANIMATION_STARTED` | GAME | Registrar inicio de animacion de recompensa. |
| `VE_GAME_EVENT_REWARD_ANIMATION_COMPLETED` | GAME | Registrar fin de animacion de recompensa. |
| `VE_GAME_EVENT_SCENE_COMPLETED` | GAME | Registrar cierre de escena interactiva. |

## Agrupacion por fase

### Primera sesion

- `VE_EVENT_FIRST_SESSION_STARTED`
- `VE_EVENT_AGENT_WELCOME_VIEWED`
- `VE_EVENT_AGENT_ACTIVATION_STARTED`
- `VE_EVENT_FIRST_CHOICE_SELECTED`
- `VE_EVENT_FIRST_INTENTION_SELECTED`
- `VE_EVENT_FIRST_REWARD_UNLOCKED`
- `VE_EVENT_FIRST_SESSION_COMPLETED`

### Interaccion Flame

- `VE_GAME_EVENT_SCENE_STARTED`
- `VE_GAME_EVENT_AGENT_TAP`
- `VE_GAME_EVENT_CHOICE_SELECTED`
- `VE_GAME_EVENT_REWARD_ANIMATION_STARTED`
- `VE_GAME_EVENT_REWARD_ANIMATION_COMPLETED`
- `VE_GAME_EVENT_SCENE_COMPLETED`

## Carga minima reservada

Los eventos pueden transportar una carga futura con:

- `agentId`
- `sessionId`
- `eventId`
- `sceneId`
- `choiceId`
- `rewardId`
- `createdAt`

## Relacion con UX-001

Firebase podra guardar el estado de la primera sesion, pero no decidira el flujo emocional.

## Relacion con GAME-001

Firebase podra guardar eventos y progreso, pero no controla escenas Flame.

## Relacion con ART-001

Los eventos que apunten a `ve_assets` solo podran referenciar assets aprobados en `assets_manifest.json`.

## Relacion con DS-001

Firebase no guarda tokens visuales. Si se necesitara una referencia visual, solo podria ser una referencia tecnica y no un token de diseno.

## Regla de uso

Los eventos sirven para trazabilidad, progreso y sincronizacion futura. No deben convertirse en un motor de experiencia.

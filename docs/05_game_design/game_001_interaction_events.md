# GAME-001 - Interaction Events

## Proposito

Reservar los eventos interactivos que Flame podra emitir o consumir en una implementacion futura de la primera sesion del Agente.

Estos eventos son tecnicos y conceptuales. No implican tracking productivo, Firebase activo ni codigo en PACKAGE-001.

## Eventos interactivos

| Evento | Momento | Uso futuro |
| --- | --- | --- |
| `VE_GAME_EVENT_SCENE_STARTED` | Inicio de una escena Flame | Marcar que una escena interactiva comenzo. |
| `VE_GAME_EVENT_AGENT_TAP` | Toque o seleccion primaria del Agente | Responder a una accion simple y consciente. |
| `VE_GAME_EVENT_CHOICE_HOVERED` | Foco o preseleccion de una opcion | Dar retroalimentacion ligera antes de elegir. |
| `VE_GAME_EVENT_CHOICE_SELECTED` | Eleccion confirmada | Conectar la decision con UX-001 y SB-001. |
| `VE_GAME_EVENT_REWARD_ANIMATION_STARTED` | Inicio de revelacion de recompensa | Preparar la aparicion del primer desbloqueo. |
| `VE_GAME_EVENT_REWARD_ANIMATION_COMPLETED` | Fin de revelacion de recompensa | Permitir avanzar a continuidad. |
| `VE_GAME_EVENT_SCENE_COMPLETED` | Cierre de escena Flame | Habilitar transicion al siguiente beat. |

## Relacion con eventos UX

| Evento interactivo | Evento UX relacionado |
| --- | --- |
| `VE_GAME_EVENT_SCENE_STARTED` | `VE_EVENT_FIRST_SESSION_STARTED` |
| `VE_GAME_EVENT_AGENT_TAP` | `VE_EVENT_AGENT_ACTIVATION_STARTED` |
| `VE_GAME_EVENT_CHOICE_HOVERED` | Sin evento UX obligatorio. |
| `VE_GAME_EVENT_CHOICE_SELECTED` | `VE_EVENT_FIRST_CHOICE_SELECTED` |
| `VE_GAME_EVENT_REWARD_ANIMATION_STARTED` | `VE_EVENT_FIRST_REWARD_UNLOCKED` |
| `VE_GAME_EVENT_REWARD_ANIMATION_COMPLETED` | `VE_EVENT_FIRST_REWARD_UNLOCKED` |
| `VE_GAME_EVENT_SCENE_COMPLETED` | `VE_EVENT_FIRST_SESSION_COMPLETED` cuando aplique. |

## Carga minima reservada

Los eventos podran usar una carga tecnica minima en el futuro:

| Campo | Descripcion |
| --- | --- |
| `agentId` | Identificador reservado del Agente. |
| `sceneId` | Escena Flame reservada. |
| `agentStatus` | Estado del Agente durante la escena. |
| `choiceId` | Eleccion seleccionada cuando aplique. |
| `rewardId` | Recompensa reservada cuando aplique. |
| `createdAt` | Fecha tecnica futura del evento. |

## Reglas

- Los eventos no deben sustituir el flujo UX.
- Los eventos no deben crear progresion paralela a SB-001.
- Ningun evento activa Firebase en PACKAGE-001.
- Ningun evento declara assets reales.
- Ningun evento desbloquea recompensas reales fuera de `VE_REWARD_BADGE_FIRST_STEP_LEVEL_01` como reserva conceptual.

## Primera eleccion

Las elecciones conectadas a `VE_GAME_EVENT_CHOICE_SELECTED` son:

- `VE_CHOICE_FIRST_HOME`
- `VE_CHOICE_FIRST_MIND`
- `VE_CHOICE_FIRST_CONSUMPTION`

## Recompensa reservada

- Recompensa: `VE_REWARD_BADGE_FIRST_STEP_LEVEL_01`
- Asset reservado: `VE_ASSET_BADGE_FIRST_AGENT_IVORY_V01`

El asset reservado no autoriza archivo visual, animacion final ni registro de asset real.

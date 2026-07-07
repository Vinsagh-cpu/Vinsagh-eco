# FIRE-001 - Agent Data Model

## Proposito

Definir el modelo base del Agente para Firebase como backend futuro.

Este modelo no se implementa todavia. Solo reserva campos y relaciones para persistencia posterior.

## Modelo base del Agente

| Campo | Tipo conceptual | Uso |
| --- | --- | --- |
| `agentId` | string | Identificador principal del Agente. |
| `displayName` | string | Nombre visible del Agente. |
| `agentStatus` | enum | Estado actual de la primera sesion y del progreso. |
| `firstSessionCompleted` | boolean | Marca de cierre de la primera sesion. |
| `firstChoice` | string | Primera eleccion seleccionada por el Agente. |
| `firstIntention` | string | Intencion declarada en la microaccion. |
| `firstRewardUnlocked` | string | Recompensa conceptual desbloqueada. |
| `currentLevel` | number | Nivel actual del Agente. |
| `impactScore` | number | Puntuacion conceptual de impacto. |
| `createdAt` | timestamp conceptual | Fecha de creacion reservada. |
| `updatedAt` | timestamp conceptual | Fecha de ultima actualizacion reservada. |

## Estados del Agente

- `VE_AGENT_STATUS_NEW`
- `VE_AGENT_STATUS_ACTIVATING`
- `VE_AGENT_STATUS_ACTIVE`
- `VE_AGENT_STATUS_FIRST_SESSION_COMPLETE`

## Relaciones del modelo

| Campo | Relacion |
| --- | --- |
| `agentId` | Llave de referencia en `ve_agents`, `ve_sessions`, `ve_events`, `ve_progress` y `ve_rewards`. |
| `displayName` | Puede mostrarse en perfil o continuidad futura. |
| `agentStatus` | Debe reflejar la fase actual del recorrido del Agente. |
| `firstSessionCompleted` | Se alinea con UX-001, SB-001 y GAME-001. |
| `firstChoice` | Se vincula con `VE_CHOICE_FIRST_HOME`, `VE_CHOICE_FIRST_MIND` o `VE_CHOICE_FIRST_CONSUMPTION`. |
| `firstIntention` | Guarda la declaracion elegida en la microaccion. |
| `firstRewardUnlocked` | Guarda `VE_REWARD_BADGE_FIRST_STEP_LEVEL_01` o una recompensa futura aprobada. |
| `currentLevel` | Puede crecer despues de futuras misiones o sesiones. |
| `impactScore` | Resume progreso conceptual sin definir economia ni monetizacion. |

## Regla de lectura

El modelo del Agente es descriptivo y no controla la experiencia.

La sesion primero se siente, luego se registra.

## Campos reservados adicionales

La implementacion futura podra extender este modelo, pero cualquier campo nuevo debera respetar SYS-001 y no inventar narrativa, personajes ni estados no aprobados.

# First Session Events

## Experiencia

`VE_EXPERIENCE_AGENT_FIRST_SESSION`

## Eventos UX

| Evento | Momento | Datos minimos reservados |
| --- | --- | --- |
| `VE_EVENT_FIRST_SESSION_STARTED` | Inicio tecnico o umbral de entrada | `agentId`, `createdAt` |
| `VE_EVENT_AGENT_WELCOME_VIEWED` | Bienvenida vista | `agentId`, `agentStatus`, `updatedAt` |
| `VE_EVENT_AGENT_ACTIVATION_STARTED` | Activacion iniciada | `agentId`, `agentStatus`, `updatedAt` |
| `VE_EVENT_FIRST_CHOICE_SELECTED` | Primera eleccion seleccionada | `agentId`, `firstChoice`, `updatedAt` |
| `VE_EVENT_FIRST_INTENTION_SELECTED` | Intencion confirmada | `agentId`, `firstIntention`, `updatedAt` |
| `VE_EVENT_FIRST_REWARD_UNLOCKED` | Primer desbloqueo mostrado | `agentId`, `firstRewardUnlocked`, `updatedAt` |
| `VE_EVENT_FIRST_SESSION_COMPLETED` | Continuidad confirmada | `agentId`, `firstSessionCompleted`, `agentStatus`, `updatedAt` |

## Datos reservados del Agente

- `agentId`
- `agentStatus`
- `firstSessionCompleted`
- `firstChoice`
- `firstIntention`
- `firstRewardUnlocked`
- `createdAt`
- `updatedAt`

## Reglas

- Los eventos son una reserva conceptual para UX-001.
- No se implementa Firebase en PACKAGE-001.
- No se crea tracking productivo.
- No se agregan colecciones, indices activos ni servicios.

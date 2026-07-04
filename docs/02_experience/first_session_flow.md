# First Session Flow

## Experiencia

`VE_EXPERIENCE_AGENT_FIRST_SESSION`

## Mapa de flujo

| Orden | Momento | Pantalla conceptual | Estado del Agente | Evento principal |
| --- | --- | --- | --- | --- |
| 1 | Inicio tecnico | `VE_SCREEN_BOOT_TECHNICAL` | `VE_AGENT_STATUS_NEW` | `VE_EVENT_FIRST_SESSION_STARTED` |
| 2 | Umbral de entrada | `VE_SCREEN_AGENT_THRESHOLD` | `VE_AGENT_STATUS_NEW` | `VE_EVENT_FIRST_SESSION_STARTED` |
| 3 | Bienvenida | `VE_SCREEN_AGENT_WELCOME` | `VE_AGENT_STATUS_ACTIVATING` | `VE_EVENT_AGENT_WELCOME_VIEWED` |
| 4 | Activacion | `VE_SCREEN_AGENT_ACTIVATION` | `VE_AGENT_STATUS_ACTIVATING` | `VE_EVENT_AGENT_ACTIVATION_STARTED` |
| 5 | Primera eleccion | `VE_SCREEN_AGENT_FIRST_CHOICE` | `VE_AGENT_STATUS_ACTIVE` | `VE_EVENT_FIRST_CHOICE_SELECTED` |
| 6 | Microaccion | `VE_SCREEN_AGENT_FIRST_ACTION` | `VE_AGENT_STATUS_ACTIVE` | `VE_EVENT_FIRST_INTENTION_SELECTED` |
| 7 | Primer desbloqueo | `VE_SCREEN_AGENT_FIRST_REWARD` | `VE_AGENT_STATUS_ACTIVE` | `VE_EVENT_FIRST_REWARD_UNLOCKED` |
| 8 | Continuidad | `VE_SCREEN_AGENT_CONTINUE` | `VE_AGENT_STATUS_FIRST_SESSION_COMPLETE` | `VE_EVENT_FIRST_SESSION_COMPLETED` |

## Secuencia

1. El sistema muestra un inicio tecnico minimo y no final.
2. El Agente cruza el umbral de entrada con un mensaje breve y sensorial.
3. La bienvenida explica pertenencia antes de pedir accion.
4. La activacion cambia el estado a un modo intencional.
5. El Agente elige el primer territorio de transformacion.
6. La microaccion convierte la eleccion en intencion declarada.
7. El sistema desbloquea la Primera Semilla de Impacto.
8. La sesion cierra con continuidad, no con cierre definitivo.

## Regla de ritmo

Cada paso debe sentirse ligero. La primera sesion no busca explicar todo el universo; busca abrir una puerta.

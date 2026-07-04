# First Session Agent States

## Estados

| Estado | Descripcion | Entrada | Salida |
| --- | --- | --- | --- |
| `VE_AGENT_STATUS_NEW` | El Agente aun no ha iniciado su activacion emocional. | Primera apertura de la experiencia. | Cruza el umbral y ve bienvenida. |
| `VE_AGENT_STATUS_ACTIVATING` | El Agente esta entrando al universo con una decision consciente. | Bienvenida vista. | Confirma activacion del camino. |
| `VE_AGENT_STATUS_ACTIVE` | El Agente ya puede elegir su primer foco de transformacion. | Activacion confirmada. | Recibe el primer desbloqueo. |
| `VE_AGENT_STATUS_FIRST_SESSION_COMPLETE` | La primera sesion queda completa y lista para continuidad futura. | Primer desbloqueo visto y continuidad confirmada. | Proxima experiencia aprobada. |

## Transiciones

```text
VE_AGENT_STATUS_NEW
  -> VE_AGENT_STATUS_ACTIVATING
  -> VE_AGENT_STATUS_ACTIVE
  -> VE_AGENT_STATUS_FIRST_SESSION_COMPLETE
```

## Relacion con elecciones

- `VE_CHOICE_FIRST_HOME`: enfoca la primera intencion en hogar.
- `VE_CHOICE_FIRST_MIND`: enfoca la primera intencion en calma y claridad.
- `VE_CHOICE_FIRST_CONSUMPTION`: enfoca la primera intencion en consumo consciente.

## Relacion con recompensa

El estado `VE_AGENT_STATUS_FIRST_SESSION_COMPLETE` puede reservar la recompensa `VE_REWARD_BADGE_FIRST_STEP_LEVEL_01`.

El identificador `VE_ASSET_BADGE_FIRST_AGENT_IVORY_V01` queda reservado para ART-001, sin asset real en este package.

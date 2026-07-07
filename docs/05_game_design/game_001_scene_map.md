# GAME-001 - Scene Map

## Proposito

Mapear las escenas Flame reservadas contra pantallas conceptuales de UX-001 y beats de SB-001.

Este documento no crea escenas reales. Solo define la relacion tecnica futura.

## Mapa principal

| Escena Flame reservada | Pantalla UX relacionada | Beat SB-001 | Funcion futura |
| --- | --- | --- | --- |
| `VE_SCENE_BOOT_INIT` | `VE_SCREEN_BOOT_TECHNICAL` | Inicio tecnico | Preparar el arranque minimo antes del umbral. |
| `VE_SCENE_EP01_FOREST_ENTRY` | `VE_SCREEN_AGENT_THRESHOLD` | Umbral de entrada | Amplificar la pausa inicial y entrada al universo. |
| `VE_SCENE_EP01_AGENT_AWAKENING` | `VE_SCREEN_AGENT_ACTIVATION` | Bienvenida y activacion | Acompanhar el reconocimiento del Agente. |
| `VE_SCENE_EP01_FIRST_CHOICE` | `VE_SCREEN_AGENT_FIRST_CHOICE` | Primera eleccion y microaccion | Responder a la eleccion inicial del Agente. |
| `VE_SCENE_EP01_REWARD_REVEAL` | `VE_SCREEN_AGENT_FIRST_REWARD` | Primer desbloqueo | Revelar la Primera Semilla de Impacto. |

## Relaciones explicitamente aprobadas

- `VE_SCREEN_AGENT_THRESHOLD` puede conectar con `VE_SCENE_EP01_FOREST_ENTRY`.
- `VE_SCREEN_AGENT_ACTIVATION` puede conectar con `VE_SCENE_EP01_AGENT_AWAKENING`.
- `VE_SCREEN_AGENT_FIRST_CHOICE` puede conectar con `VE_SCENE_EP01_FIRST_CHOICE`.
- `VE_SCREEN_AGENT_FIRST_REWARD` puede conectar con `VE_SCENE_EP01_REWARD_REVEAL`.

## Secuencia propuesta

```text
VE_SCENE_BOOT_INIT
  -> VE_SCENE_EP01_FOREST_ENTRY
  -> VE_SCENE_EP01_AGENT_AWAKENING
  -> VE_SCENE_EP01_FIRST_CHOICE
  -> VE_SCENE_EP01_REWARD_REVEAL
```

## Estados del Agente asociados

| Estado | Escenas relacionadas |
| --- | --- |
| `VE_AGENT_STATUS_NEW` | `VE_SCENE_BOOT_INIT`, `VE_SCENE_EP01_FOREST_ENTRY` |
| `VE_AGENT_STATUS_ACTIVATING` | `VE_SCENE_EP01_AGENT_AWAKENING` |
| `VE_AGENT_STATUS_ACTIVE` | `VE_SCENE_EP01_FIRST_CHOICE`, `VE_SCENE_EP01_REWARD_REVEAL` |
| `VE_AGENT_STATUS_FIRST_SESSION_COMPLETE` | Cierre posterior a `VE_SCENE_EP01_REWARD_REVEAL` |

## Reglas de transicion

- Cada escena debe tener una entrada clara y una salida clara.
- Ninguna escena debe retener al Agente con interacciones extensas durante la primera sesion.
- Las transiciones deben apoyar calma, curiosidad y pertenencia.
- La escena de recompensa no debe abrir un sistema de inventario, tienda o recompensas reales.

## Placeholders futuros

Si no hay assets aprobados en ART-001, la futura implementacion podra usar placeholders tecnicos.

Los placeholders deberan ser evidentes como recursos temporales y no podran publicarse como arte final.

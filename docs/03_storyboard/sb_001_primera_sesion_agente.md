# SB-001 - Primera Sesion del Agente

## Estado

Base inicial de storyboard. Sin diseno visual final.

## Relacion

- Experiencia: `VE_EXPERIENCE_AGENT_FIRST_SESSION`
- Documento base: UX-001 - Primera Sesion del Agente
- Package activo: PACKAGE-001

## Objetivo

Preparar una base narrativa y funcional para storyboard sin crear pantallas finales, assets reales ni escenas Flame implementadas.

## Beats de storyboard

| Beat | Momento | Pantalla conceptual | Intencion |
| --- | --- | --- | --- |
| 1 | Inicio tecnico | `VE_SCREEN_BOOT_TECHNICAL` | Confirmar que la experiencia esta iniciando. |
| 2 | Umbral | `VE_SCREEN_AGENT_THRESHOLD` | Bajar el ritmo y abrir pertenencia. |
| 3 | Bienvenida | `VE_SCREEN_AGENT_WELCOME` | Nombrar al Agente sin explicar todo el universo. |
| 4 | Activacion | `VE_SCREEN_AGENT_ACTIVATION` | Cambiar de visitante a Agente. |
| 5 | Eleccion | `VE_SCREEN_AGENT_FIRST_CHOICE` | Elegir el primer foco de transformacion. |
| 6 | Intencion | `VE_SCREEN_AGENT_FIRST_ACTION` | Convertir eleccion en frase consciente. |
| 7 | Desbloqueo | `VE_SCREEN_AGENT_FIRST_REWARD` | Entregar Primera Semilla de Impacto. |
| 8 | Continuidad | `VE_SCREEN_AGENT_CONTINUE` | Dejar abierto el deseo de volver. |

## Escenas Flame reservadas

- `VE_SCENE_BOOT_INIT`
- `VE_SCENE_EP01_FOREST_ENTRY`
- `VE_SCENE_EP01_AGENT_AWAKENING`
- `VE_SCENE_EP01_FIRST_CHOICE`
- `VE_SCENE_EP01_REWARD_REVEAL`

## Restricciones

- No usar arte final.
- No definir layout final.
- No crear componentes Flutter.
- No crear animaciones.
- No presentar a Vin y Sagh como personajes completos.
- No convertir esta base en UX final de produccion sin aprobacion humana.

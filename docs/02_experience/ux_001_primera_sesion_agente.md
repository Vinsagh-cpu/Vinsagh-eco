# UX-001 - Primera Sesion del Agente

## Estado

Aprobado conceptualmente para documentacion. No implementado como pantalla final.

## Identificacion

- Nombre interno: `VE_EXPERIENCE_AGENT_FIRST_SESSION`
- Nombre narrativo: El Despertar del Agente
- Entregable: UX-001
- Package activo: PACKAGE-001

## Proposito

Definir la primera sesion del usuario dentro de Vinsagh Eco, llamado Agente.

La experiencia debe hacer sentir que la persona entra a un universo con proposito, no solo a una aplicacion. Esta primera sesion funciona como activacion emocional: abre pertenencia, curiosidad y deseo de volver antes de pedir acciones complejas.

## Principio rector

Primero pertenencia.

Despues exploracion.

Despues accion.

Despues recompensa.

## Objetivo emocional

Al terminar la primera sesion, el Agente debe sentir:

- Curiosidad.
- Calma.
- Pertenencia.
- Proposito.
- Deseo de volver.
- Sensacion de haber desbloqueado algo.

## Duracion

- Ideal: 3 a 5 minutos.
- Maxima: 7 minutos.

## Limites de implementacion

UX-001 no autoriza:

- Pantallas Flutter finales.
- Firebase activo.
- Assets reales.
- Login.
- Tienda.
- Founder Club.
- Closet.
- Presentacion completa de Vin y Sagh.

## Estados del Agente

- `VE_AGENT_STATUS_NEW`
- `VE_AGENT_STATUS_ACTIVATING`
- `VE_AGENT_STATUS_ACTIVE`
- `VE_AGENT_STATUS_FIRST_SESSION_COMPLETE`

## Pantallas conceptuales

Estas pantallas son nombres conceptuales para ordenar la experiencia. No representan implementacion visual final.

- `VE_SCREEN_BOOT_TECHNICAL`
- `VE_SCREEN_AGENT_THRESHOLD`
- `VE_SCREEN_AGENT_WELCOME`
- `VE_SCREEN_AGENT_ACTIVATION`
- `VE_SCREEN_AGENT_FIRST_CHOICE`
- `VE_SCREEN_AGENT_FIRST_ACTION`
- `VE_SCREEN_AGENT_FIRST_REWARD`
- `VE_SCREEN_AGENT_CONTINUE`

## Flujo resumido

1. Inicio tecnico.
2. Umbral de entrada.
3. Bienvenida.
4. Activacion del Agente.
5. Primera eleccion.
6. Microaccion de impacto.
7. Primer desbloqueo.
8. Vista de continuidad.

## Primera eleccion

- `VE_CHOICE_FIRST_HOME`
- `VE_CHOICE_FIRST_MIND`
- `VE_CHOICE_FIRST_CONSUMPTION`

## Primer desbloqueo

- Recompensa: `VE_REWARD_BADGE_FIRST_STEP_LEVEL_01`
- Asset reservado: `VE_ASSET_BADGE_FIRST_AGENT_IVORY_V01`

El asset queda reservado solo como identificador. No debe implementarse ni agregarse un archivo real durante PACKAGE-001.

## Relacion con Flame

Escenas reservadas conceptualmente, sin implementacion:

- `VE_SCENE_BOOT_INIT`
- `VE_SCENE_EP01_FOREST_ENTRY`
- `VE_SCENE_EP01_AGENT_AWAKENING`
- `VE_SCENE_EP01_FIRST_CHOICE`
- `VE_SCENE_EP01_REWARD_REVEAL`

## Criterio de exito

UX-001 esta listo cuando el equipo puede entender el primer recorrido emocional del Agente, sus estados, sus eventos y su copy base sin necesitar aun diseno visual final ni codigo.

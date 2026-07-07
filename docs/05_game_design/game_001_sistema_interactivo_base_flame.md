# GAME-001 - Sistema interactivo base con Flame

## Estado

Documento tecnico inicial. No implementado en codigo.

## Identificacion

- Entregable: GAME-001
- Orden de trabajo: CODEX-RUN-004
- Experiencia base: `VE_EXPERIENCE_AGENT_FIRST_SESSION`
- UX relacionada: UX-001 - Primera Sesion del Agente
- Storyboard relacionado: SB-001 - Primera Sesion del Agente
- Package activo: PACKAGE-001

## Proposito

Definir el sistema interactivo base que convertira la primera sesion del Agente en una experiencia progresivamente jugable usando Flame.

GAME-001 no crea la experiencia jugable todavia. Define los limites, escenas, eventos y relaciones tecnicas necesarias para que una implementacion futura pueda hacerse de forma segura cuando Flutter y Flame entren al alcance operativo.

## Principio rector

Flame no debe reemplazar la experiencia; debe amplificarla.

UX-001 define el recorrido emocional.

SB-001 ordena la secuencia narrativa y funcional.

GAME-001 reserva como esa secuencia puede ganar interaccion, respuesta y movimiento sin cambiar su proposito.

## Experiencia que se amplifica

La primera sesion sigue siendo una activacion emocional:

1. Pertenencia.
2. Exploracion.
3. Accion.
4. Recompensa.

Flame podra apoyar estos momentos con transiciones, respuesta a toques, estados interactivos y revelaciones controladas. No debe convertir la sesion en un juego completo, tutorial extenso ni sistema de recompensas final.

## Escenas Flame reservadas

- `VE_SCENE_BOOT_INIT`
- `VE_SCENE_EP01_FOREST_ENTRY`
- `VE_SCENE_EP01_AGENT_AWAKENING`
- `VE_SCENE_EP01_FIRST_CHOICE`
- `VE_SCENE_EP01_REWARD_REVEAL`

Estas escenas son reservas conceptuales. No existen clases, archivos Dart, componentes Flame ni assets asociados en PACKAGE-001.

## Relacion con UX-001

UX-001 conserva autoridad sobre:

- Objetivo emocional.
- Copy base.
- Estados del Agente.
- Pantallas conceptuales.
- Primera eleccion.
- Primer desbloqueo.

GAME-001 no puede modificar el tono, el orden emocional ni el significado de los momentos definidos en UX-001.

## Relacion con SB-001

SB-001 conserva autoridad sobre:

- Beats.
- Ritmo narrativo.
- Intencion por momento.
- Secuencia de entrada, eleccion, microaccion y continuidad.

GAME-001 traduce esos beats a posibles escenas interactivas futuras, sin definir layout final ni arte.

## Relacion con ART-001

Los assets solo podran usarse si estan aprobados en el manifiesto visual.

Si un asset no existe o no esta aprobado, la implementacion futura de Flame debera usar placeholders tecnicos, no arte improvisado.

El asset `VE_ASSET_BADGE_FIRST_AGENT_IVORY_V01` sigue reservado como identificador. No se agrega archivo real en GAME-001.

## Relacion con DS-001

La experiencia interactiva futura debera respetar:

- Tokens visuales aprobados.
- Criterios de componentes base.
- Jerarquia de color y estilo definidos por el sistema de diseno.
- Restricciones de accesibilidad y legibilidad que se aprueben en fases posteriores.

Flame no debe introducir una identidad visual paralela al sistema de diseno.

## Relacion con FIRE-001

Firebase almacenara progreso en una fase posterior, pero no controlara la experiencia interactiva.

La sesion debe poder entenderse como flujo local antes de persistir progreso. FIRE-001 podra guardar estados como `agentStatus`, `firstChoice`, `firstIntention` y `firstRewardUnlocked`, pero no debe decidir ritmo, copy, escenas ni interacciones.

## Presencias reservadas

Vin y Sagh permanecen como presencia reservada del universo.

GAME-001 no define personajes completos, visuales finales, dialogos, mecanicas propias, estadisticas ni apariciones cerradas para ellos.

## Fuera de alcance

GAME-001 no implementa:

- Login.
- Firebase.
- Tienda.
- Closet.
- Founder Club.
- Personajes completos.
- Recompensas reales.
- Audio real.
- Animaciones finales.
- Pantallas Flutter.
- Clases Flame.
- Dependencias nuevas.
- Assets reales.

## Resultado esperado

La documentacion GAME-001 queda lista para que posteriormente se pueda implementar Flame de forma segura, respetando UX-001, SB-001, ART-001, DS-001 y los limites tecnicos de PACKAGE-001.

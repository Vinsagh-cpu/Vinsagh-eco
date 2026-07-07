# FIRE-001 - Diseno base de Firebase

## Estado

Documento tecnico inicial. No implementado en Firebase.

## Identificacion

- Entregable: FIRE-001
- Orden de trabajo: CODEX-RUN-005
- Package activo: PACKAGE-001
- Universo: Vinsagh Eco Studios

## Proposito

Definir el diseno base de Firebase para Vinsagh Eco Studios como backend futuro del universo narrativo interactivo.

En esta etapa Firebase no se implementa. Solo se documenta como capa de datos para almacenar perfiles, progreso, misiones, recompensas, sesiones, eventos y configuracion.

## Principio rector

Firebase no gobierna la experiencia. Firebase almacena, sincroniza y protege datos.

La experiencia emocional y la secuencia de la sesion siguen viviendo en UX-001, SB-001 y GAME-001.

## Contexto funcional

Firebase debera servir como soporte posterior para:

- Identidad del Agente.
- Progreso de sesion.
- Progreso de misiones.
- Registro de eventos.
- Referencias a assets aprobados.
- Configuracion del universo.

## Colecciones reservadas

- `ve_agents`
- `ve_profiles`
- `ve_progress`
- `ve_sessions`
- `ve_events`
- `ve_missions`
- `ve_rewards`
- `ve_assets`
- `ve_settings`

## Relacion con UX-001

Firebase podra guardar el estado de la primera sesion, pero no decidira el flujo emocional.

La secuencia de bienvenida, activacion, eleccion, recompensa y continuidad sigue definida por UX-001.

## Relacion con GAME-001

Firebase podra guardar eventos y progreso, pero no controla escenas Flame.

Los eventos interactivos y las escenas reservadas siguen definidos en GAME-001 y se consumiran en una fase posterior.

## Relacion con ART-001

La coleccion `ve_assets` solo podra referenciar assets aprobados en `assets_manifest.json`.

Si un asset no esta aprobado, Firebase no debe inventar ni registrar una representacion final.

## Relacion con DS-001

Firebase no guarda tokens visuales.

Solo puede guardar referencias operativas si fueran necesarias para un futuro consumo tecnico.

## Resultado esperado

FIRE-001 queda preparado como documento de arquitectura de datos para una futura implementacion tecnica segura, sin crear colecciones activas, reglas reales, dependencias ni codigo Flutter.

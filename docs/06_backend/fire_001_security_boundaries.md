# FIRE-001 - Security Boundaries

## Proposito

Documentar limites conceptuales de seguridad para el backend Firebase de Vinsagh Eco Studios.

No define reglas reales, no modifica `firebase/firestore.rules`, `firebase/storage.rules` ni `firebase/indexes.json`.

## Principio

La seguridad protege datos. No gobierna el recorrido emocional ni las escenas del universo.

## Categorias de datos

### Datos publicos

Datos que podrian mostrarse sin riesgo sensible.

Ejemplos conceptuales:

- Nombre visible del Agente si se aprobara.
- Estado general de progreso.
- Recompensas ya desbloqueadas.

### Datos privados del Agente

Datos vinculados a identidad o continuidad personal.

Ejemplos conceptuales:

- `agentId`
- `displayName`
- Preferencias personales
- Historial de primera sesion

### Datos de progreso

Datos que describen avance y sesion.

Ejemplos conceptuales:

- `firstSessionCompleted`
- `currentLevel`
- `impactScore`
- Hitos de misiones

### Datos de eventos

Datos cronologicos emitidos por UX o GAME.

Ejemplos conceptuales:

- `VE_EVENT_FIRST_SESSION_STARTED`
- `VE_GAME_EVENT_CHOICE_SELECTED`
- `VE_GAME_EVENT_SCENE_COMPLETED`

### Datos de assets

Referencias a recursos aprobados, nunca archivos improvisados.

Ejemplos conceptuales:

- `assetId`
- `version`
- `status`
- `manifestPath`

### Datos administrativos

Configuracion reservada para operacion futura.

Ejemplos conceptuales:

- flags globales
- parametros de sesion
- ajustes de misiones
- estados de release

## Limites de acceso conceptuales

| Categoria | Acceso conceptual |
| --- | --- |
| Publicos | Lectura restringida a vistas seguras o resumenes aprobados. |
| Privados del Agente | Acceso protegido y ligado al Agente correcto. |
| Progreso | Lectura y escritura controlada por el backend futuro. |
| Eventos | Escritura controlada por la capa de experiencia o juego. |
| Assets | Solo referencias aprobadas por ART-001. |
| Administrativos | Acceso limitado a operadores autorizados. |

## Reglas de diseno

- No se diseña login en FIRE-001.
- No se diseña autenticacion real en FIRE-001.
- No se diseña economia de recompensas.
- No se diseña lectura publica indiscriminada.
- No se diseña control de escenas desde Firebase.

## Relacion con UX-001 y GAME-001

UX-001 y GAME-001 pueden producir datos, pero Firebase no decide el tono ni la secuencia.

La seguridad futura debe aceptar que la experiencia existe primero en el universo narrativo y luego se sincroniza.

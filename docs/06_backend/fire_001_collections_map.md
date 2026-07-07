# FIRE-001 - Collections Map

## Proposito

Mapear las colecciones reservadas de Firebase para Vinsagh Eco Studios.

Este documento describe intencion y responsabilidad de datos, no crea colecciones reales ni indices activos.

## Mapa de colecciones

| Coleccion | Proposito | Contenido conceptual |
| --- | --- | --- |
| `ve_agents` | Identidad principal del Agente. | Estado, nivel, impacto y marcas de progreso. |
| `ve_profiles` | Datos de perfil del Agente. | Nombre visible, preferencias, referencias de acceso. |
| `ve_progress` | Progreso acumulado. | Sesiones completas, hitos, desbloqueos y avance. |
| `ve_sessions` | Sesiones del Agente. | Inicio, cierre, estado de primera sesion y continuidad. |
| `ve_events` | Registro cronologico. | Eventos de UX, GAME y cambios de estado. |
| `ve_missions` | Misiones del universo. | Objetivos, estado y metadatos operativos. |
| `ve_rewards` | Recompensas conceptuales. | Identificadores, estado y vinculacion con progreso. |
| `ve_assets` | Referencias a assets aprobados. | IDs, version, estado y ruta registrada en ART-001. |
| `ve_settings` | Configuracion del universo. | Flags, parametros y valores globales permitidos. |

## Colecciones por fase

### `ve_agents`

Identifica al Agente como entidad central del universo.

### `ve_profiles`

Resguarda datos de perfil que no controlan la experiencia emocional.

### `ve_progress`

Agrupa hitos de avance y lectura rapida del recorrido.

### `ve_sessions`

Guarda la estructura de cada sesion, incluida la primera sesion.

### `ve_events`

Conserva el historial de eventos reservados desde UX-001, SB-001 y GAME-001.

### `ve_missions`

Servira para misiones futuras del universo.

### `ve_rewards`

Relaciona progreso con recompensas conceptuales y futuras.

### `ve_assets`

Solo puede hacer referencia a assets aprobados por ART-001.

### `ve_settings`

Contendra configuraciones globales y flags conceptuales del universo.

## Convenciones de identificacion

- Los documentos internos y campos reservados deben usar prefijo `VE` cuando apliquen.
- Las colecciones usan `ve_` en minusculas para alinearse con la capa de datos.
- Los registros deben conservar trazabilidad entre `agentId`, `sessionId`, `eventId` y `rewardId`.

## Criterio de uso

La coleccion existe primero como contrato documental. Solo despues de aprobacion tecnica podra convertirse en una coleccion activa.

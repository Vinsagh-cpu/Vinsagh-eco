# SB-001 - Primera Sesion del Agente

## Estado

Storyboard documental integrado para PACKAGE-001.

Este documento no define diseno visual final, no crea pantallas Flutter, no agrega assets reales y no implementa escenas Flame.

## Relacion

- Experiencia: `VE_EXPERIENCE_AGENT_FIRST_SESSION`
- Documento base: UX-001 - Primera Sesion del Agente
- Nombre narrativo: El Despertar del Agente
- Package activo: PACKAGE-001
- Orden de trabajo: CODEX-RUN-003

## Proposito

Traducir UX-001 a una secuencia de storyboard clara para que el equipo pueda revisar ritmo, intencion, copy, estados, eventos y continuidad antes de cualquier implementacion visual o tecnica.

La primera sesion debe sentirse como activacion emocional. No es onboarding generico, registro, tienda ni tutorial de app.

## Principio rector

Primero pertenencia.

Despues exploracion.

Despues accion.

Despues recompensa.

## Duracion objetivo

- Ideal: 3 a 5 minutos.
- Maxima: 7 minutos.

## Estados del Agente

| Orden | Estado | Funcion narrativa |
| --- | --- | --- |
| 1 | `VE_AGENT_STATUS_NEW` | El Agente aun esta en el umbral. |
| 2 | `VE_AGENT_STATUS_ACTIVATING` | El Agente empieza a reconocerse dentro del universo. |
| 3 | `VE_AGENT_STATUS_ACTIVE` | El Agente puede elegir y declarar intencion. |
| 4 | `VE_AGENT_STATUS_FIRST_SESSION_COMPLETE` | La primera sesion queda cerrada con continuidad futura. |

## Beats maestros

| Beat | Momento | Pantalla conceptual | Estado | Evento |
| --- | --- | --- | --- | --- |
| 1 | Inicio tecnico | `VE_SCREEN_BOOT_TECHNICAL` | `VE_AGENT_STATUS_NEW` | `VE_EVENT_FIRST_SESSION_STARTED` |
| 2 | Umbral de entrada | `VE_SCREEN_AGENT_THRESHOLD` | `VE_AGENT_STATUS_NEW` | `VE_EVENT_FIRST_SESSION_STARTED` |
| 3 | Bienvenida | `VE_SCREEN_AGENT_WELCOME` | `VE_AGENT_STATUS_ACTIVATING` | `VE_EVENT_AGENT_WELCOME_VIEWED` |
| 4 | Activacion del Agente | `VE_SCREEN_AGENT_ACTIVATION` | `VE_AGENT_STATUS_ACTIVATING` | `VE_EVENT_AGENT_ACTIVATION_STARTED` |
| 5 | Primera eleccion | `VE_SCREEN_AGENT_FIRST_CHOICE` | `VE_AGENT_STATUS_ACTIVE` | `VE_EVENT_FIRST_CHOICE_SELECTED` |
| 6 | Microaccion de impacto | `VE_SCREEN_AGENT_FIRST_ACTION` | `VE_AGENT_STATUS_ACTIVE` | `VE_EVENT_FIRST_INTENTION_SELECTED` |
| 7 | Primer desbloqueo | `VE_SCREEN_AGENT_FIRST_REWARD` | `VE_AGENT_STATUS_ACTIVE` | `VE_EVENT_FIRST_REWARD_UNLOCKED` |
| 8 | Vista de continuidad | `VE_SCREEN_AGENT_CONTINUE` | `VE_AGENT_STATUS_FIRST_SESSION_COMPLETE` | `VE_EVENT_FIRST_SESSION_COMPLETED` |

## Beat 1 - Inicio tecnico

- Pantalla conceptual: `VE_SCREEN_BOOT_TECHNICAL`
- Escena Flame reservada: `VE_SCENE_BOOT_INIT`
- Estado inicial: `VE_AGENT_STATUS_NEW`
- Evento: `VE_EVENT_FIRST_SESSION_STARTED`

Intencion:

Confirmar que el sistema inicia sin convertir esta entrada en una pantalla final. El arranque debe ser sobrio, tecnico y breve.

Contenido permitido:

```text
Vinsagh Eco Studios · INIT-001
```

Salida:

El flujo avanza al umbral de entrada.

## Beat 2 - Umbral de entrada

- Pantalla conceptual: `VE_SCREEN_AGENT_THRESHOLD`
- Escena Flame reservada: `VE_SCENE_EP01_FOREST_ENTRY`
- Estado: `VE_AGENT_STATUS_NEW`
- Evento: `VE_EVENT_FIRST_SESSION_STARTED`

Intencion:

Bajar el ritmo. Antes de explicar, pedir una pausa. El Agente debe sentir que entra a un espacio con proposito.

Copy:

```text
Antes de avanzar, respira.

Vinsagh Eco no comienza con una compra.
Comienza con una decision.
```

CTA:

```text
Entrar al universo
```

Salida:

El Agente cruza hacia la bienvenida.

## Beat 3 - Bienvenida

- Pantalla conceptual: `VE_SCREEN_AGENT_WELCOME`
- Escena Flame reservada: `VE_SCENE_EP01_AGENT_AWAKENING`
- Estado de entrada: `VE_AGENT_STATUS_NEW`
- Estado de salida: `VE_AGENT_STATUS_ACTIVATING`
- Evento: `VE_EVENT_AGENT_WELCOME_VIEWED`

Intencion:

Nombrar al Agente y abrir pertenencia sin explicar todo el universo. La bienvenida debe sentirse humana, consciente y breve.

Copy:

```text
Bienvenida, Agente.

Aqui cada eleccion puede convertirse en impacto.
Cada objeto puede tener historia.
Y cada accion puede acercarte a una forma mas consciente de habitar el mundo.
```

CTA:

```text
Activar mi camino
```

Salida:

El Agente acepta iniciar su activacion.

## Beat 4 - Activacion del Agente

- Pantalla conceptual: `VE_SCREEN_AGENT_ACTIVATION`
- Escena Flame reservada: `VE_SCENE_EP01_AGENT_AWAKENING`
- Estado: `VE_AGENT_STATUS_ACTIVATING`
- Evento: `VE_EVENT_AGENT_ACTIVATION_STARTED`

Intencion:

Convertir a la persona de visitante a Agente. El texto debe sentirse como reconocimiento, no como instruccion.

Copy:

```text
A partir de ahora, no eres visitante.

Eres Agente Vinsagh Eco:
una persona que observa, elige y transforma.
```

CTA:

```text
Continuar
```

Salida:

El estado puede avanzar a `VE_AGENT_STATUS_ACTIVE`.

## Beat 5 - Primera eleccion

- Pantalla conceptual: `VE_SCREEN_AGENT_FIRST_CHOICE`
- Escena Flame reservada: `VE_SCENE_EP01_FIRST_CHOICE`
- Estado: `VE_AGENT_STATUS_ACTIVE`
- Evento: `VE_EVENT_FIRST_CHOICE_SELECTED`

Intencion:

Dar una decision pequena y significativa. La eleccion no debe abrir una configuracion compleja ni una pantalla de perfil.

Pregunta:

```text
Que quieres empezar a transformar primero?
```

Opciones:

| Opcion visible | Identificador |
| --- | --- |
| Mi hogar | `VE_CHOICE_FIRST_HOME` |
| Mi mente | `VE_CHOICE_FIRST_MIND` |
| Mi forma de consumir | `VE_CHOICE_FIRST_CONSUMPTION` |

Salida:

El flujo muestra la microaccion correspondiente a la eleccion.

## Beat 6 - Microaccion de impacto

- Pantalla conceptual: `VE_SCREEN_AGENT_FIRST_ACTION`
- Escena Flame reservada: `VE_SCENE_EP01_FIRST_CHOICE`
- Estado: `VE_AGENT_STATUS_ACTIVE`
- Evento: `VE_EVENT_FIRST_INTENTION_SELECTED`

Intencion:

Convertir la primera eleccion en una frase de intencion. El Agente no completa una tarea operativa; declara una direccion.

Microacciones:

| Eleccion | Intencion |
| --- | --- |
| `VE_CHOICE_FIRST_HOME` | Quiero crear un espacio mas consciente. |
| `VE_CHOICE_FIRST_MIND` | Quiero decidir con mas calma y claridad. |
| `VE_CHOICE_FIRST_CONSUMPTION` | Quiero comprar con intencion, no por impulso. |

Confirmacion:

```text
Elijo comenzar con intencion.
```

CTA:

```text
Confirmar intencion
```

Salida:

El flujo desbloquea la primera recompensa.

## Beat 7 - Primer desbloqueo

- Pantalla conceptual: `VE_SCREEN_AGENT_FIRST_REWARD`
- Escena Flame reservada: `VE_SCENE_EP01_REWARD_REVEAL`
- Estado: `VE_AGENT_STATUS_ACTIVE`
- Evento: `VE_EVENT_FIRST_REWARD_UNLOCKED`
- Recompensa: `VE_REWARD_BADGE_FIRST_STEP_LEVEL_01`
- Asset reservado: `VE_ASSET_BADGE_FIRST_AGENT_IVORY_V01`

Intencion:

Dar una recompensa emocional ligera. La recompensa debe sentirse como inicio de camino, no como sistema de gamificacion completo.

Copy:

```text
Has dado tu primer paso.

No parece grande.
Pero todo universo comienza con una primera decision.

Desbloqueaste:
Primera Semilla de Impacto
```

CTA:

```text
Ver mi camino
```

Regla de asset:

`VE_ASSET_BADGE_FIRST_AGENT_IVORY_V01` queda reservado solo como identificador. No se agrega imagen ni archivo real en PACKAGE-001.

Salida:

El flujo presenta continuidad.

## Beat 8 - Vista de continuidad

- Pantalla conceptual: `VE_SCREEN_AGENT_CONTINUE`
- Estado de entrada: `VE_AGENT_STATUS_ACTIVE`
- Estado de salida: `VE_AGENT_STATUS_FIRST_SESSION_COMPLETE`
- Evento: `VE_EVENT_FIRST_SESSION_COMPLETED`

Intencion:

Cerrar la primera sesion sin clausurar el universo. El Agente debe sentir que algo empezo y que puede volver.

Copy:

```text
Tu camino ya comenzo.

Pronto conoceras a quienes custodian este universo.
Por ahora, conserva tu primera semilla.
```

CTA:

```text
Continuar al inicio
```

Salida:

La primera sesion queda marcada conceptualmente como completada.

## Datos reservados

| Campo | Uso conceptual |
| --- | --- |
| `agentId` | Identificador reservado del Agente. |
| `agentStatus` | Estado actual dentro de la primera sesion. |
| `firstSessionCompleted` | Marca conceptual de cierre de primera sesion. |
| `firstChoice` | Eleccion inicial seleccionada. |
| `firstIntention` | Intencion confirmada desde la microaccion. |
| `firstRewardUnlocked` | Recompensa conceptual desbloqueada. |
| `createdAt` | Fecha de creacion reservada. |
| `updatedAt` | Fecha de actualizacion reservada. |

Estos datos no implican Firebase activo, base de datos, tracking productivo ni implementacion tecnica en PACKAGE-001.

## Mapa de transiciones

```text
VE_SCREEN_BOOT_TECHNICAL
  -> VE_SCREEN_AGENT_THRESHOLD
  -> VE_SCREEN_AGENT_WELCOME
  -> VE_SCREEN_AGENT_ACTIVATION
  -> VE_SCREEN_AGENT_FIRST_CHOICE
  -> VE_SCREEN_AGENT_FIRST_ACTION
  -> VE_SCREEN_AGENT_FIRST_REWARD
  -> VE_SCREEN_AGENT_CONTINUE
```

## Mapa de estados

```text
VE_AGENT_STATUS_NEW
  -> VE_AGENT_STATUS_ACTIVATING
  -> VE_AGENT_STATUS_ACTIVE
  -> VE_AGENT_STATUS_FIRST_SESSION_COMPLETE
```

## Direccion de ritmo

- Frases cortas.
- Pausas visibles entre ideas.
- Una decision por momento.
- Recompensa sobria.
- Continuidad abierta.

## Restricciones

- No usar arte final.
- No definir layout final.
- No crear componentes Flutter.
- No crear pantallas.
- No crear animaciones.
- No agregar imagenes, audio ni assets reales.
- No implementar Firebase.
- No crear login.
- No crear tienda.
- No crear Founder Club.
- No crear closet.
- No presentar a Vin y Sagh como personajes completos.
- No modificar `docs/00_canon/`.

## Criterios de revision

SB-001 esta documentalmente completo cuando permite revisar:

- Secuencia emocional de inicio a continuidad.
- Copy por beat.
- Estados del Agente.
- Eventos UX.
- Primera eleccion y microacciones.
- Primer desbloqueo.
- Escenas Flame reservadas sin implementacion.
- Limites claros para evitar pantallas finales o assets no aprobados.

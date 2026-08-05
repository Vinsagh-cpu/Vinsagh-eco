# Guardian Domain Charter

## Dominio

Guardian

## Pregunta principal

¿Cuál es el estado de despertar del usuario dentro de Lumea?

## Propósito

El dominio Guardian representa el vínculo inicial entre el usuario y Lumea. Su responsabilidad es modelar el estado interno del proceso de awakening sin depender de interfaces, almacenamiento, Firebase, Flutter ni servicios externos.

Este dominio no decide cómo se ve la experiencia. Solo define el significado del estado del usuario durante el primer contacto con el guardián.

## Fuente de verdad

La fuente de verdad del dominio es `AwakeningStatus`.

## Entidades y value objects propios

- `AwakeningStatus`

## Estados iniciales definidos

- `dormant`: el usuario aún no ha iniciado el despertar.
- `firstSignalReceived`: el sistema ya recibió la primera señal de inicio.
- `thresholdCrossed`: el usuario cruzó el umbral inicial.
- `guardianContacted`: el primer contacto con el guardián ya ocurrió.
- `awakened`: el despertar inicial quedó completado.

## Dependencias permitidas

Permitido:

- Dart puro.
- Value objects del mismo dominio.
- Identificadores de otros dominios, si fueran necesarios.

Prohibido dentro del dominio:

- Flutter
- Firebase
- HTTP
- SQLite
- SharedPreferences
- BuildContext
- IconData
- Widgets
- Infraestructura
- UI

## Decisión operativa

El dominio Guardian inicia con una base mínima y controlada. Su primera responsabilidad será sostener el estado de awakening antes de construir pantallas, animaciones, Firebase, Flame o persistencia.

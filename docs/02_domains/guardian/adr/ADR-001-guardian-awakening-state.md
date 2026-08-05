# ADR-001 · Guardian Awakening State

## Estado

Aceptado

## Fecha

2026-08-05

## Contexto

Lumea necesita representar el primer estado interno del usuario durante la entrada a la experiencia. Antes de diseñar pantallas finales, animaciones o persistencia, se requiere una base de dominio que indique si el usuario aún no despierta, si ya recibió una primera señal, si cruzó el umbral, si tuvo contacto con el guardián o si el despertar inicial quedó completo.

Este estado pertenece al dominio Guardian porque describe la relación inicial entre el usuario y su guardián dentro de Lumea.

## Decisión

Crear `AwakeningStatus` como value object base del dominio Guardian.

El estado se define inicialmente como un enum de Dart puro, sin dependencias de Flutter, Firebase ni infraestructura.

Estados aprobados:

- `dormant`
- `firstSignalReceived`
- `thresholdCrossed`
- `guardianContacted`
- `awakened`

## Consecuencias positivas

- El dominio Guardian puede evolucionar sin depender de UI.
- El primer encuentro puede modelarse antes de construir pantallas finales.
- La persistencia puede implementarse después sin contaminar el dominio.
- El equipo puede razonar sobre el awakening con una fuente de verdad clara.

## Consecuencias negativas

- La experiencia visual todavía no existe.
- El flujo completo de transición entre estados queda pendiente.
- Aún no existen eventos de dominio implementados.
- Aún no existe persistencia real del estado.

## Límites

Este ADR no implementa:

- Firebase.
- Flame.
- Pantallas finales.
- Login.
- Tienda.
- Founder Club.
- Persistencia.
- Animaciones.
- Eventos de dominio.

## Validación

La implementación debe cumplir:

- Dart puro.
- Sin imports de Flutter.
- Sin imports de Firebase.
- Sin dependencias externas.
- Compatible con `dart format`.
- Compatible con `flutter analyze`.

## Próximo paso recomendado

Crear una capa mínima de aplicación para orquestar el cambio de estados del awakening sin construir todavía la experiencia visual final.

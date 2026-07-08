# APP-001 - Pantalla tecnica controlada

## Proposito

Sustituir la app demo inicial de Flutter por una pantalla tecnica controlada de Vinsagh Eco Studios para Web, manteniendo el proyecto minimo, limpio y validable.

## Alcance

- Flutter web como base principal.
- UI tecnica minima.
- Sin Firebase.
- Sin Flame.
- Sin assets reales.
- Sin navegacion compleja.
- Sin pantallas finales.

## Archivos modificados

- `apps/mobile_flutter/lib/main.dart`
- `apps/mobile_flutter/test/widget_test.dart`
- `docs/01_architecture/app_001_pantalla_tecnica_controlada.md`

## Decision tecnica

Se reemplazo la demo de contador por una pantalla tecnica nativa con `MaterialApp` y `Scaffold`, pensada como base para validar Flutter Web antes de avanzar a capas de producto o juego.

## Que se implemento

- Pantalla de arranque tecnica.
- Texto visible de estado para Vinsagh Eco Studios.
- Indicacion explicita de que la base web esta activa.
- Declaraciones claras de que no hay Firebase, Flame ni assets reales.
- Prueba minima que valida el render de la pantalla.

## Que no se implemento

- Login.
- Tienda.
- Founder Club.
- Personajes completos.
- Firebase.
- Flame.
- Assets reales.
- Navegacion.
- Animaciones complejas.
- Pantallas finales.

## Validaciones ejecutadas

- `flutter pub get`
- `flutter analyze`
- `flutter test`
- `flutter build web`

## Proximo paso recomendado

- `APP-002` o la siguiente tarea tecnica controlada, usando esta pantalla como base estable para continuar con una evolucion minima y validada paso a paso.

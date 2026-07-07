# TRAIN-004C - Comandos Flutter basicos

## Proposito

Dar una rutina minima de comandos para trabajar Flutter con orden dentro de Vinsagh Eco.

## Comandos basicos

### `flutter doctor`

Revisa si el entorno Flutter esta listo.

Sirve para saber si el SDK, dispositivos y dependencias estan bien configurados.

### `flutter pub get`

Descarga las dependencias declaradas en el proyecto.

Se usa despues de cambios en `pubspec.yaml` o al preparar una base ya existente.

### `flutter analyze`

Busca errores y advertencias de analisis estatico.

Es uno de los primeros filtros antes de correr la app.

### `flutter run`

Arranca la app en un dispositivo o emulador.

Es la prueba real de la experiencia.

### `flutter clean`

Limpia artefactos generados.

Solo debe usarse con supervision porque borra cache de compilacion y obliga a regenerar.

### `git status`

Debe revisarse antes y despues de cualquier cambio.

Es la forma rapida de saber que se movio realmente.

## Secuencia minima recomendada

1. `git status`
2. `flutter doctor`
3. `flutter pub get`
4. `flutter analyze`
5. `flutter run`
6. `git status`

## Lectura operativa

Si `flutter doctor` falla, no se salta el diagnostico.

Si `flutter analyze` falla, no se ignora.

Si `flutter run` falla, se corrige la causa antes de avanzar.

## Regla Vinsagh Eco

Los comandos no se usan para impresionar. Se usan para proteger claridad, estabilidad y control tecnico.

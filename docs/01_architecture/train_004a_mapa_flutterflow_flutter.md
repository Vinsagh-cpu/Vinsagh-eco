# TRAIN-004A - Mapa FlutterFlow -> Flutter

## Proposito

Traducir el lenguaje mental de FlutterFlow a la estructura real de Flutter dentro de Vinsagh Eco.

## Mapa de equivalencias

### Page -> Screen

En FlutterFlow, una Page suele sentirse como una pantalla completa.

En Flutter, esa misma idea vive mejor como una `Screen` dentro de `presentation/screens/` o de la estructura que se autorice despues.

### Component -> Widget

Un Component de FlutterFlow se parece a un Widget reutilizable en Flutter.

La diferencia es que Flutter exige mas claridad sobre props, estado y composicion.

### App State -> Estado global

El App State de FlutterFlow se traduce a estado global en Flutter, normalmente con una solucion guiada por la arquitectura del proyecto.

### Page State -> Estado local

El Page State se convierte en estado local de una pantalla o widget.

### Action -> Function / metodo

Una Action visual se vuelve una funcion o metodo en Dart.

La regla es simple: cada accion debe tener una intencion clara.

### Custom Code -> Dart

Lo que en FlutterFlow se siente como Custom Code, en Flutter ya es codigo Dart real.

Eso requiere mas control, mas orden y menos improvisacion.

### Assets -> assets/ + pubspec.yaml

FlutterFlow puede ocultar parte de la carga de assets.

En Flutter, los assets se declaran, se organizan y se registran de forma explicita.

### Theme -> Design System / tokens

El Theme de FlutterFlow debe leerse como una capa de tokens y decisiones visuales.

En Vinsagh Eco esa capa ya esta guiada por DS-001.

### Backend Query -> Service / Repository

Una consulta visual a backend en FlutterFlow debe traducirse a una capa de servicio o repositorio en Flutter.

Eso evita que la UI se convierta en logica de datos.

### Preview -> flutter run

La vista previa de FlutterFlow equivale a correr la app con `flutter run`.

Eso no es solo ver algo en pantalla; es validar la app real.

## Lectura practica para Vinsagh Eco

- FlutterFlow sirve como puente conceptual.
- Flutter exige estructura real.
- La documentacion ya define que debe aparecer primero.
- La implementacion solo debe seguir lo ya aprobado.

## Regla de oro

Si una idea aun no puede explicarse como Screen, Widget, State, Function o Service, todavia no esta lista para implementarse en Flutter.

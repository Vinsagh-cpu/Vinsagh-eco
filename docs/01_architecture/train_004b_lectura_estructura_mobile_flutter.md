# TRAIN-004B - Lectura de estructura mobile_flutter

## Proposito

Ensenar a leer la estructura esperada de `apps/mobile_flutter/` sin asumir que ya existe implementacion final.

## Estado actual esperado

En PACKAGE-002, la app puede comenzar vacia o con una base guiada.

Lo importante no es que tenga mucho contenido desde el primer dia. Lo importante es que cada carpeta tenga sentido.

## Estructura esperada

```text
apps/mobile_flutter/
  lib/
    main.dart
    app/
    bootstrap/
    game/
    presentation/
    config/
```

## Como leerla

### `main.dart`

Punto de entrada de la app.

Debe quedarse pequeno y legible.

### `app/`

Contiene la composicion principal de la aplicacion.

Piensalo como la capa que conecta pantallas, navegacion y configuracion general.

### `bootstrap/`

Contiene el arranque tecnico.

Aqui vive la preparacion inicial antes de mostrar la primera experiencia.

### `game/`

Contiene la futura capa Flame.

No es un lugar para codigo de interfaz normal ni para logica general de app.

### `presentation/`

Contiene pantallas y widgets de experiencia.

Es donde viven las piezas visibles de la app.

### `config/`

Contiene configuraciones tecnicas y valores de apoyo.

## Que debe buscar la fundadora

- Donde empieza la app.
- Donde se arma la primera pantalla.
- Donde se separa UI de logica.
- Donde se preparan las capas de juego.
- Donde se alojan configuraciones simples.

## Que no debe asumir

- Que todo tiene que vivir en una sola carpeta.
- Que FlutterFlow y Flutter son lo mismo.
- Que el backend controla la experiencia.
- Que `game/` significa "crear un videojuego completo".

## Lectura segura

Si la carpeta no existe todavia, no se inventa estructura real fuera de la documentacion.

Primero se entiende el mapa. Luego se construye.

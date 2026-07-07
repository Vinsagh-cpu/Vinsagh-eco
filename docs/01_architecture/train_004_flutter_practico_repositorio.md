# TRAIN-004 - Flutter practico aplicado al repositorio Vinsagh Eco

## Proposito

Capacitar a la fundadora para entender, revisar y operar Flutter dentro del repositorio Vinsagh Eco sin perder control tecnico.

## Principio rector

No aprender Flutter en abstracto. Aprender Flutter desde el repositorio real.

## Enfoque de trabajo

Este entrenamiento no busca memorizar Flutter como teoria general. Busca que la fundadora pueda leer la estructura real del proyecto, entender donde vive cada responsabilidad y pedir cambios pequenos con criterio.

La referencia siempre es Vinsagh Eco:

- UX-001 define la entrada emocional.
- SB-001 define el ritmo narrativo.
- GAME-001 reserva la capa interactiva.
- FIRE-001 reserva la capa de datos.
- MVP-001 fija el alcance minimo.

## Equivalencias FlutterFlow -> Flutter

| FlutterFlow | Flutter |
| --- | --- |
| Page | Screen |
| Component | Widget |
| App State | Estado global |
| Page State | Estado local |
| Action | Function / metodo |
| Custom Code | Dart |
| Assets | `assets/` + `pubspec.yaml` |
| Theme | Design System / tokens |
| Backend Query | Service / Repository |
| Preview | `flutter run` |

## Estructura esperada

Cuando la implementacion tecnica sea autorizada, la app principal debera vivir en:

- `apps/mobile_flutter/`
- `apps/mobile_flutter/lib/`
- `apps/mobile_flutter/lib/main.dart`
- `apps/mobile_flutter/lib/app/`
- `apps/mobile_flutter/lib/bootstrap/`
- `apps/mobile_flutter/lib/game/`
- `apps/mobile_flutter/lib/presentation/`
- `apps/mobile_flutter/lib/config/`

## Que debe aprender la fundadora

- Leer carpetas antes de escribir UI.
- Distinguir pantalla, widget, estado y servicio.
- Reconocer donde vive la experiencia inicial del Agente.
- Evitar tocar areas fuera de alcance.
- Pedir tareas limitadas y verificables.

## Que no debe intentar sola todavia

- Modificar `android/` o `ios/` sin instruccion.
- Activar Firebase.
- Agregar assets finales.
- Cambiar `pubspec.yaml` sin guia.
- Tocar `build/` o `.dart_tool/`.
- Entrar a `docs/00_canon/`.

## Ruta de uso

1. Leer este entrenamiento.
2. Revisar la estructura documental del repo.
3. Entender la equivalencia FlutterFlow -> Flutter.
4. Aprender a validar cambios con `git status`.
5. Pedir implementaciones pequenas, no paquetes completos.

## Resultado esperado

La fundadora puede iniciar implementacion minima en PACKAGE-002 con seguridad, entendiendo que Flutter es una herramienta concreta para materializar la documentacion ya aprobada.

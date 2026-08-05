# INIT-002 · Definitive Flutter Bootstrap

## Estado

Cerrado para Pull Request.

## Objetivo

Completar la inicialización real y controlada de Flutter Web/Mobile para disponer de un bootstrap definitivo sobre el cual construir las experiencias futuras de Lumea.

## Decisión

El proyecto Flutter existente en `apps/mobile_flutter` se conserva y se limpia para quedar como punto de entrada definitivo.

No se ejecuta `flutter create` porque la estructura Flutter ya existe.

## Bootstrap definitivo

El punto único de entrada queda definido por:

- `apps/mobile_flutter/lib/main.dart`
- `apps/mobile_flutter/lib/src/core/app/vinsagh_eco_app.dart`
- `apps/mobile_flutter/lib/src/core/app/lumea_app_entry.dart`

## Limpieza realizada

Se elimina la pantalla técnica provisional y el panel vertical con placeholders.

Archivos eliminados:

- `apps/mobile_flutter/lib/src/technical_dashboard_screen.dart`
- `apps/mobile_flutter/lib/src/widgets/vertical_001_panel.dart`

## Restricciones cumplidas

Durante INIT-002 no se implementó:

- Primer Encuentro.
- Animaciones.
- Partículas.
- Audio.
- Guardianes.
- Logo animado.
- Escenas del bosque.
- Timeline.
- Motor cinematográfico.
- Splash tradicional.
- Firebase.
- Flame.

## Validación

Validaciones requeridas:

- `flutter analyze`
- `flutter test`
- `flutter run -d chrome`

Resultado esperado:

- Sin errores de análisis.
- Tests en verde.
- Aplicación inicia correctamente en Chrome.

## Próximo paso

Después de fusionar INIT-002 en `main`, iniciar la siguiente épica:

VS-001 · Motor del Primer Encuentro

El objetivo de VS-001 no será una pantalla de inicio tradicional, sino una máquina de estados cinematográfica reutilizable para Lumea.

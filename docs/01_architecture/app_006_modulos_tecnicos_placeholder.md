# APP-006 - Módulos técnicos placeholder

## Propósito
Preparar una estructura mínima de módulos técnicos placeholder para la app Flutter Web de Vinsagh Eco Studios, sin convertirlos todavía en funcionalidades reales.

## Alcance
- `apps/mobile_flutter/lib/main.dart`
- `apps/mobile_flutter/lib/src/`
- `apps/mobile_flutter/test/widget_test.dart`
- `docs/01_architecture/app_006_modulos_tecnicos_placeholder.md`

## Archivos modificados o creados
- `apps/mobile_flutter/lib/src/technical_dashboard_screen.dart`
- `apps/mobile_flutter/lib/src/modules/technical_module.dart`
- `apps/mobile_flutter/lib/src/widgets/technical_modules_panel.dart`
- `apps/mobile_flutter/test/widget_test.dart`
- `docs/01_architecture/app_006_modulos_tecnicos_placeholder.md`

## Decisión técnica
Se agregó una estructura simple compuesta por un modelo de lectura y un widget de panel. Los módulos se representan como tarjetas visuales dentro de la pantalla técnica existente, reutilizando el tema y los espaciados de APP-004.

## Qué significa módulo técnico placeholder
Un módulo técnico placeholder es una representación visual de una capacidad futura. No abre rutas, no ejecuta lógica de producto, no guarda datos, no llama servicios externos y no define una pantalla final.

## Módulos preparados
- `Umbral inicial`
- `Perfil del Guardián`
- `Primera Travesía`
- `Estado ambiental`
- `Validaciones`
- `Módulos futuros`

## Qué se implementó
- Modelo `TechnicalModule` para describir placeholders.
- Panel `TechnicalModulesPanel` con tarjetas de módulos futuros.
- Actualización del encabezado a `APP-006 · Módulos técnicos placeholder`.
- Conservación del panel de navegación técnica no funcional.
- Conservación del panel de estado.
- Conservación del panel de alcance.
- Conservación del pie técnico.
- Prueba mínima actualizada para validar el contenido principal de APP-006.

## Qué no se implementó
- Navegación funcional real.
- Rutas reales.
- Guardado de datos.
- Firebase.
- `firebase_core`.
- Flame.
- Assets reales.
- Imágenes.
- Fuentes externas.
- Login.
- Tienda.
- Founder Club.
- Personajes completos.
- Pantallas finales.
- Modificaciones a `pubspec.yaml`.

## Validaciones ejecutadas
- `flutter pub get`
- `flutter analyze`
- `flutter test`
- `flutter build web`

## Próximo paso recomendado
`APP-007 · Preparación del Vertical 001 técnico no funcional`

# APP-007 - Vertical 001 técnico no funcional

## Propósito
Preparar una representación técnica no funcional del `Vertical 001 · Primera Travesía` dentro de la app Flutter Web de Vinsagh Eco Studios.

## Alcance
- `apps/mobile_flutter/lib/main.dart`
- `apps/mobile_flutter/lib/src/`
- `apps/mobile_flutter/test/widget_test.dart`
- `docs/01_architecture/app_007_vertical_001_placeholder.md`

## Archivos modificados o creados
- `apps/mobile_flutter/lib/src/technical_dashboard_screen.dart`
- `apps/mobile_flutter/lib/src/verticals/vertical_001_stage.dart`
- `apps/mobile_flutter/lib/src/widgets/vertical_001_panel.dart`
- `apps/mobile_flutter/test/widget_test.dart`
- `docs/01_architecture/app_007_vertical_001_placeholder.md`

## Decisión técnica
Se agregó un modelo simple de etapas placeholder y un panel visual dedicado al Vertical 001. La integración es aditiva: conserva el panel de navegación técnica de APP-005 y el panel de módulos técnicos placeholder de APP-006.

## Qué significa Vertical 001 técnico no funcional
Significa que el vertical se muestra como una estructura técnica de referencia. No ejecuta lógica real, no abre rutas, no guarda datos, no usa servicios externos y no representa una experiencia final.

## Relación con Primera Travesía
`Primera Travesía` queda identificada como el centro conceptual del Vertical 001, pero solo en modo placeholder técnico. Su objetivo actual es validar orden, lectura y crecimiento futuro antes de implementar componentes reales.

## Etapas placeholder preparadas
- `Umbral de entrada`
- `Reconocimiento del Guardián`
- `Primera Travesía`
- `Registro de intención`
- `Validación inicial`
- `Cierre técnico`

## Qué se implementó
- Modelo `Vertical001Stage` para describir etapas no funcionales.
- Panel `Vertical001Panel` con la representación visual del Vertical 001.
- Actualización del encabezado a `APP-007 · Vertical 001 técnico no funcional`.
- Conservación del panel de navegación técnica no funcional.
- Conservación del panel de módulos técnicos placeholder.
- Conservación del panel de estado.
- Conservación del panel de alcance.
- Conservación del pie técnico.
- Prueba mínima actualizada para validar el contenido principal de APP-007.

## Qué no se implementó
- Experiencia real.
- Lógica de juego.
- Navegación funcional real.
- Rutas reales.
- Guardado de datos.
- Servicios externos.
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
`APP-008 · Preparación de componentes técnicos del flujo inicial`

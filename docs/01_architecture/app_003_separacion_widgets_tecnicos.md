# APP-003 - Separacion minima de widgets tecnicos

## Proposito
Refactorizar la pantalla tecnica de APP-002 para separar widgets minimos y mejorar la mantenibilidad sin cambiar de forma significativa la experiencia visual ni el alcance tecnico.

## Alcance
- Entrada limpia de Flutter en `apps/mobile_flutter/lib/main.dart`.
- App base y tema en `apps/mobile_flutter/lib/src/vinsagh_eco_app.dart`.
- Pantalla tecnica compuesta en `apps/mobile_flutter/lib/src/technical_dashboard_screen.dart`.
- Widgets reutilizables minimos en `apps/mobile_flutter/lib/src/widgets/`.
- Prueba widget actualizada en `apps/mobile_flutter/test/widget_test.dart`.

## Archivos modificados o creados
- `apps/mobile_flutter/lib/main.dart`
- `apps/mobile_flutter/lib/src/vinsagh_eco_app.dart`
- `apps/mobile_flutter/lib/src/technical_dashboard_screen.dart`
- `apps/mobile_flutter/lib/src/widgets/footer_badge.dart`
- `apps/mobile_flutter/lib/src/widgets/scope_panel.dart`
- `apps/mobile_flutter/lib/src/widgets/technical_status_card.dart`
- `apps/mobile_flutter/test/widget_test.dart`
- `docs/01_architecture/app_003_separacion_widgets_tecnicos.md`

## Decision tecnica
Se paso de una pantalla tecnica concentrada en un solo archivo a una composicion por piezas pequenas, manteniendo Flutter Web como unico objetivo y sin introducir dependencias, assets ni servicios nuevos.

## Estructura de widgets
- `VinsaghEcoApp`: configura `MaterialApp` y el tema base.
- `TechnicalDashboardScreen`: compone encabezado, panel de estado, panel de alcance y pie tecnico.
- `TechnicalStatusCard`: presenta el estado tecnico visible.
- `ScopePanel`: presenta el alcance tecnico visible.
- `FooterBadge`: muestra chips tecnicos del pie.

## Que se implemento
- Separacion del punto de entrada.
- Pantalla tecnica responsive con la misma linea visual base.
- Encabezado con `Vinsagh Eco Studios` y `APP-003 · Widgets técnicos separados`.
- Panel de estado con:
  - `Flutter Web base activo`
  - `Sin Firebase`
  - `Sin Flame`
  - `Sin assets reales`
- Panel de alcance con:
  - `PACKAGE-002`
  - `Entorno controlado`
  - `Widgets técnicos separados`
- Pie tecnico con badges reutilizables.
- Prueba minima para verificar el render.

## Que no se implemento
- Firebase.
- Flame.
- Login.
- Tienda.
- Founder Club.
- Personajes completos.
- Assets reales.
- Imagenes.
- Navegacion funcional.
- Pubspec changes.

## Validaciones ejecutadas
- `flutter pub get`
- `flutter analyze`
- `flutter test`
- `flutter build web`

## Proximo paso recomendado
`APP-004 · Preparacion de tema visual tecnico controlado`

# APP-005 - Navegacion tecnica no funcional

## Proposito
Preparar una representacion visual minima de navegacion tecnica para Vinsagh Eco Studios en Flutter Web, sin crear rutas reales ni cambios de pantalla, para ordenar el crecimiento futuro de la app.

## Alcance
- `apps/mobile_flutter/lib/main.dart`
- `apps/mobile_flutter/lib/src/`
- `apps/mobile_flutter/test/widget_test.dart`
- `docs/01_architecture/app_005_navegacion_tecnica_no_funcional.md`

## Archivos modificados o creados
- `apps/mobile_flutter/lib/main.dart`
- `apps/mobile_flutter/lib/src/vinsagh_eco_app.dart`
- `apps/mobile_flutter/lib/src/technical_dashboard_screen.dart`
- `apps/mobile_flutter/lib/src/widgets/footer_badge.dart`
- `apps/mobile_flutter/lib/src/widgets/scope_panel.dart`
- `apps/mobile_flutter/lib/src/widgets/technical_navigation_panel.dart`
- `apps/mobile_flutter/lib/src/widgets/technical_status_card.dart`
- `apps/mobile_flutter/lib/src/navigation/technical_navigation_item.dart`
- `apps/mobile_flutter/lib/src/theme/vinsagh_colors.dart`
- `apps/mobile_flutter/lib/src/theme/vinsagh_spacing.dart`
- `apps/mobile_flutter/lib/src/theme/vinsagh_theme.dart`
- `apps/mobile_flutter/test/widget_test.dart`
- `docs/01_architecture/app_005_navegacion_tecnica_no_funcional.md`

## Decision tecnica
Se agrego un panel visual de navegacion tecnica como placeholder de arquitectura. El panel organiza futuras secciones del producto, pero no activa rutas, no mueve pantallas y no introduce comportamiento interactivo real.

## Que significa navegacion tecnica no funcional
Significa que la interfaz muestra la estructura prevista de secciones futuras, pero solo como referencia visual. Los elementos sirven para preparar el crecimiento del sistema, no para navegar de verdad.

## Elementos de navegacion preparados
- `Inicio tecnico`
- `Estado del entorno`
- `Modulos futuros`
- `Experiencia`
- `Validaciones`

## Que se implemento
- Panel de navegacion tecnica visible dentro de la pantalla principal.
- Items tecnicos compuestos con icono, etiqueta y descripcion.
- Estado activo solo como indicador visual del primer modulo.
- Encabezado con:
  - `Vinsagh Eco Studios`
  - `APP-005 · Navegación técnica no funcional`
- Conservacion del panel de estado.
- Conservacion del panel de alcance.
- Conservacion del pie tecnico.
- Uso del tema y espaciados creados en APP-004.
- Prueba minima actualizada para validar el nuevo contenido.

## Que no se implemento
- Navegacion funcional real.
- Rutas reales.
- Cambio de pantalla.
- `go_router`.
- `auto_route`.
- Login.
- Firebase.
- Flame.
- Assets reales.
- Imagenes.
- Fuentes externas.
- Pantallas finales.
- Modificaciones a `pubspec.yaml`.

## Validaciones ejecutadas
- `flutter pub get`
- `flutter analyze`
- `flutter test`
- `flutter build web`

## Proximo paso recomendado
`APP-006 · Preparacion de modulos tecnicos placeholder`

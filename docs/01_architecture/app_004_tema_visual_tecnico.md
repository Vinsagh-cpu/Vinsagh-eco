# APP-004 - Tema visual técnico

## Propósito
Preparar una base mínima de tema visual técnico para la app Flutter Web de Vinsagh Eco Studios, con colores, espaciados y `ThemeData` controlados para que los siguientes entregables crezcan de forma ordenada.

## Alcance
- `apps/mobile_flutter/lib/main.dart`
- `apps/mobile_flutter/lib/src/`
- `apps/mobile_flutter/test/widget_test.dart`
- esta documentación en `docs/01_architecture/`

## Archivos modificados o creados
- `apps/mobile_flutter/lib/main.dart`
- `apps/mobile_flutter/lib/src/vinsagh_eco_app.dart`
- `apps/mobile_flutter/lib/src/technical_dashboard_screen.dart`
- `apps/mobile_flutter/lib/src/widgets/footer_badge.dart`
- `apps/mobile_flutter/lib/src/widgets/scope_panel.dart`
- `apps/mobile_flutter/lib/src/widgets/technical_status_card.dart`
- `apps/mobile_flutter/lib/src/theme/vinsagh_colors.dart`
- `apps/mobile_flutter/lib/src/theme/vinsagh_spacing.dart`
- `apps/mobile_flutter/lib/src/theme/vinsagh_theme.dart`
- `apps/mobile_flutter/test/widget_test.dart`
- `docs/01_architecture/app_004_tema_visual_tecnico.md`

## Decisión técnica
Se dejó la pantalla técnica con la misma estructura base de APP-003, pero ahora alimentada por una capa de tema explícita. La intención es ordenar la base visual sin convertirla todavía en un diseño final.

## Estructura de tema
- `VinsaghColors`: paleta técnica interna.
- `VinsaghSpacing`: escala simple de espaciado.
- `VinsaghTheme`: constructor central de `ThemeData`.

## Colores técnicos definidos
- `background`
- `surface`
- `surfaceContainer`
- `surfaceContainerHighest`
- `primary`
- `primaryContainer`
- `secondary`
- `secondaryContainer`
- `accent`
- `accentContainer`
- `textPrimary`
- `textSecondary`
- `success`
- `pending`
- `outline`
- `outlineVariant`
- `inverseSurface`
- `inverseOnSurface`

## Espaciados técnicos definidos
- `xs`
- `sm`
- `md`
- `lg`
- `xl`

## Qué se implementó
- `ThemeData` central para Flutter Web.
- `ColorScheme` controlado y coherente con la marca.
- `scaffoldBackgroundColor` definido.
- Estilos base de texto ajustados.
- La pantalla técnica sigue mostrando:
  - `Vinsagh Eco Studios`
  - `APP-004 · Tema visual técnico`
  - `Flutter Web base activo`
  - `Sin Firebase`
  - `Sin Flame`
  - `Sin assets reales`
  - `PACKAGE-002`
  - `Entorno controlado`
- Estructura visual mantenida en cuatro bloques:
  - encabezado
  - panel de estado
  - panel de alcance
  - pie técnico

## Qué no se implementó
- Diseño final.
- Firebase.
- Flame.
- Login.
- Tienda.
- Founder Club.
- Personajes completos.
- Navegación funcional.
- Assets reales.
- Imágenes.
- Fuentes externas.
- Modificaciones a `pubspec.yaml`.

## Validaciones ejecutadas
- `flutter pub get`
- `flutter analyze`
- `flutter test`
- `flutter build web`

## Próximo paso recomendado
`APP-005 · Preparación de navegación técnica no funcional`

# PLAN-002 - Reorganizacion no funcional de la base Flutter

Fecha: 2026-07-15

Rama: `refactor/lumea-architecture-foundation`

Dependencia documental: `0e113a0 docs(plan-001): resolve creative architecture decisions`

## Proposito

Realizar la primera reorganizacion mecanica de la app Flutter para alinear la base con Lumea sin cambiar funcionalidad, diseno, textos, dependencias ni experiencia visual APP-009.

Esta fase prepara un app shell sustituible por Portal en una fase futura, pero no implementa Portal, Primer Vinculo, Realidad Aumentada, rutas, modelos, `data/`, `domain`, repositorios ni servicios.

## Estructura anterior

```text
apps/mobile_flutter/lib/
  main.dart
  src/
    vinsagh_eco_app.dart
    theme/
      vinsagh_colors.dart
      vinsagh_spacing.dart
      vinsagh_theme.dart
    features/
      home/
        home_screen.dart
        widgets/
          atelier_card.dart
          companion_panel.dart
          guardian_header.dart
          impact_card.dart
          lumea_sidebar.dart
          reconnection_available_card.dart
          samara_collections_card.dart
          wallet_card.dart
```

## Estructura nueva

```text
apps/mobile_flutter/lib/
  main.dart
  src/
    core/
      app/
        vinsagh_eco_app.dart
        lumea_app_entry.dart
    shared/
      theme/
        vinsagh_colors.dart
        vinsagh_spacing.dart
        vinsagh_theme.dart
    features/
      journey/
        presentation/
          mi_sendero_screen.dart
          widgets/
            atelier_card.dart
            companion_panel.dart
            guardian_header.dart
            impact_card.dart
            lumea_sidebar.dart
            reconnection_available_card.dart
            samara_collections_card.dart
            wallet_card.dart
```

## Movimientos realizados

- `src/vinsagh_eco_app.dart` se movio a `src/core/app/vinsagh_eco_app.dart`.
- Se creo `src/core/app/lumea_app_entry.dart` como punto de entrada intermedio.
- `src/theme/*` se movio a `src/shared/theme/*`.
- `src/features/home/home_screen.dart` se movio a `src/features/journey/presentation/mi_sendero_screen.dart`.
- `HomeScreen` se renombro a `MiSenderoScreen`.
- Los widgets visuales de APP-009 se movieron de `features/home/widgets/` a `features/journey/presentation/widgets/`.
- Se actualizaron imports de app, theme, widgets legacy y test.

## Elementos no modificados

- No se modifico `pubspec.yaml`.
- No se agregaron dependencias.
- No se modifico `docs/00_canon`.
- No se crearon modelos.
- No se crearon carpetas `data/` ni `domain/`.
- No se crearon repositorios ni servicios.
- No se implemento Portal.
- No se implemento Realidad Aumentada.
- No se implemento Primer Vinculo.
- No se agregaron rutas ni router.
- No se separaron todavia Galeria, Atelier, Reconexion, Wallet, Impacto ni Characters en features independientes.

## Ausencia de cambios funcionales

La reorganizacion es mecanica. `LumeaAppEntry` muestra actualmente `MiSenderoScreen`, por lo que el flujo visible sigue entrando a Mi Sendero igual que en APP-009.

No se agrego estado, autenticacion, onboarding, persistencia, navegacion funcional, economia, personajes ni modelos.

## Ausencia de cambios visuales

Los valores de `VinsaghColors`, `VinsaghSpacing`, `VinsaghRadii` y `VinsaghTheme` se conservaron sin cambios intencionales. Los widgets de Mi Sendero conservan los mismos textos, layout, cards, colores y composicion visual de APP-009.

## Tratamiento temporal del legacy

Permanecen sin mover, sin refactorizar y sin conectar al flujo:

- `technical_dashboard_screen.dart`.
- `widgets/technical_*`.
- `modules/technical_module.dart`.
- `navigation/technical_navigation_item.dart`.
- `verticals/vertical_001_stage.dart`.

Estos elementos siguen como legacy no conectado para retiro posterior.

## Flujo actual de entrada

```text
main.dart
  -> VinsaghEcoApp
    -> LumeaAppEntry
      -> MiSenderoScreen
```

`VinsaghEcoApp` ya no apunta directamente a Mi Sendero. La responsabilidad de decidir la experiencia inicial queda concentrada temporalmente en `LumeaAppEntry`.

## Punto de extension futuro para Portal

`LumeaAppEntry` es el punto futuro para sustituir la entrada temporal por Primer Vinculo, Portal o una decision de estado inicial. En PLAN-002 no se crean estados ficticios, rutas, pantallas Portal ni contratos de acceso.

## Fuera de alcance

- Implementar Portal.
- Implementar AR.
- Implementar Primer Vinculo.
- Agregar router.
- Agregar dependencias.
- Cambiar `pubspec.yaml`.
- Cambiar `docs/00_canon`.
- Crear `data/`, `domain`, modelos, repositorios o servicios.
- Cambiar textos, microcopy o diseno.
- Cambiar V.S. Coins o logica economica.
- Separar cards por dominio.
- Eliminar codigo legacy.

## Validaciones ejecutadas

Desde `apps/mobile_flutter`:

- `flutter pub get`: OK. No se agregaron dependencias.
- `dart format lib test`: OK. Formateo aplicado a archivos Dart movidos y sus imports.
- `flutter analyze`: OK, sin issues.
- `flutter test`: OK, test APP-009 aprobado.
- `flutter build web`: OK, build generado en `build/web`.

Desde la raiz del repositorio:

- `git diff --check`: OK, sin errores de whitespace.
- `git status --short`: OK, cambios limitados a `apps/mobile_flutter/lib`, `apps/mobile_flutter/test` y este documento.
- `git diff --stat`: OK, usado para revisar el alcance de movimientos mecanicos e imports.

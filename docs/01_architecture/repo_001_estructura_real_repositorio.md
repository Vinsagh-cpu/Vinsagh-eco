# REPO-001 - Estructura real del repositorio

## Estado auditado

Fecha: 2026-07-03

- `apps/mobile_flutter/` no existia al inicio de CODEX-RUN-001.
- Flutter no estaba disponible en el `PATH` al momento de la auditoria.
- `packages/ve_ui_kit/` no existia al inicio.
- `packages/ve_assets_manifest/` no existia al inicio.
- Git reporto archivos no trackeados pendientes de revision humana.
- Se detecto contenido heredado no relacionado con Vinsagh Eco fuera del alcance de PACKAGE-001. No se elimino.

## Estructura base PACKAGE-001

```text
docs/
  00_canon/
  01_architecture/
    ADR/
  02_experience/
  03_storyboard/
  04_design_system/
    assets/
  05_game_design/
  06_backend/
  07_release/
  99_archive/
apps/
  mobile_flutter/
packages/
  ve_core/
  ve_agent_experience/
  ve_game_flame/
  ve_ui_kit/
  ve_assets_manifest/
  ve_content_engine/
  ve_services_firebase/
assets/
firebase/
tools/
```

## Politica

La estructura puede existir vacia durante PACKAGE-001. Los assets reales, pantallas finales e integraciones activas requieren aprobacion posterior.

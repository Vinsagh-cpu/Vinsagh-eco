# ARCH-001 - Arquitectura base

## Proposito

Definir una base tecnica inicial para Vinsagh Eco Studios sin construir pantallas finales ni introducir contenido narrativo no aprobado.

## Principios

- Tratar Vinsagh Eco como universo narrativo interactivo.
- Separar experiencia, juego, UI, contenido, servicios y assets en packages internos.
- Mantener `docs/00_canon/` reservado para canon fundacional.
- Usar identificadores con prefijo `VE` cuando corresponda.
- Evitar dependencias nuevas salvo que esten justificadas por el package activo.

## Capas previstas

- `apps/mobile_flutter/`: aplicacion Flutter principal.
- `packages/ve_core/`: tipos, contratos y utilidades compartidas.
- `packages/ve_agent_experience/`: reglas de experiencia del agente sin pantallas finales.
- `packages/ve_game_flame/`: capa de juego Flame.
- `packages/ve_ui_kit/`: componentes visuales reutilizables cuando DS-001 avance.
- `packages/ve_assets_manifest/`: manifiesto y reglas de assets.
- `packages/ve_content_engine/`: contenido estructurado aprobado.
- `packages/ve_services_firebase/`: integracion futura de Firebase, sin activacion en PACKAGE-001.

## Limites de PACKAGE-001

- No login.
- No tienda.
- No Founder Club completo.
- No closet completo.
- No Firebase activo.
- No assets reales.
- No pantallas finales.

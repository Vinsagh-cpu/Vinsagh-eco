# ART-001 - Biblioteca minima de assets y manifiesto visual

## Objetivo

Preparar la biblioteca de carpetas y el manifiesto visual sin agregar assets reales.

## Reglas de entrada

Ningun asset entra a produccion sin:

- Identificador `VE`.
- Version.
- Estado.
- Ruta.
- Registro en `packages/ve_assets_manifest/assets_manifest.json`.
- Aprobacion humana.

## Estado inicial

El manifiesto inicia con `assets: []`.

Las carpetas bajo `assets/` son espacios reservados. No contienen imagenes, audio ni animaciones reales en PACKAGE-001.

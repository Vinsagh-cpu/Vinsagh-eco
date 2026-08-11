# DEV-008 · Registro de validación visual interna del Light Preview

## Estado

En implementación.

## Fecha de validación

11/08/2026.

## Objetivo

Registrar la validación manual del acceso interno al Light Preview Harness después de integrar DEV-007.

## Contexto

El Light Preview Harness fue creado para revisar y ajustar perfiles de luz procedural sin convertirlos en experiencia pública final.

Este registro confirma que el acceso interno funciona con la compuerta de desarrollo habilitada.

## Comando usado

flutter run -d chrome --dart-define=LUMEA_ENABLE_INTERNAL_PREVIEW=true

## Resultado observado

- La app abrió correctamente en Chrome.
- La experiencia inicial normal permaneció visible.
- El botón interno/debug de tuning apareció al habilitar LUMEA_ENABLE_INTERNAL_PREVIEW.
- El botón abrió Light Preview / Tuning Harness.
- Los perfiles de luz estuvieron disponibles.
- Los controles de modificación respondieron correctamente.
- Los sliders permitieron ajustar valores del preview.

## Validación funcional

Confirmado:

- Acceso interno funcional.
- Harness visible.
- Harness ajustable.
- Perfiles inspeccionables.
- Experiencia pública no contaminada cuando el acceso interno no está habilitado.

## Restricciones protegidas

No se modificó ni implementó:

- Custodio final.
- Huella visual final.
- Biometría.
- Audio.
- Assets.
- Video.
- GIF.
- Flame.
- Firebase.
- Cámara.
- Animación esquelética.
- Compi.
- Lumi.
- Textos o tutoriales finales.

## Decisión

DEV-008 registra evidencia técnica de validación visual interna.

No introduce cambios de código. No altera LightLayer, FirstEncounterPresentation ni el flujo público de Lumea.

## Criterio de cierre

El bloque puede cerrarse si el documento se integra en main y el repositorio permanece limpio.

# DEV-016 · Canonical Visual Presentation Sync

## Estado

En implementación.

## Autoridad

- DC-005 v1.2 · autoridad visual de Solanf.
- ANIM-001 v1.0 · actuación de Solanf.
- FX-002 v1.2 · evolución visual del vínculo.
- ID-001 v1.0 · identidad y presentación canónica de Lumea.
- ACC-001 v1.0 · referencia transversal de accesibilidad.

## Objetivo

Definir el contrato de handoff entre el final del Primer Encuentro y la futura presentación de identidad de Lumea.

## Decisión principal

HANDOFF_COMPLETE significa que el Primer Encuentro terminó.

No significa que Programación pueda mostrar automáticamente LUMEA, animar el icono, ejecutar el destello heredado o iniciar la interfaz funcional.

El estado posterior queda expresado como identityPresentationPending.

## Reglas protegidas

- Hoja + A incompleta permanece como identidad canónica de Lumea.
- La A completa es una respuesta temporal, no el logotipo permanente.
- HANDOFF_COMPLETE no auto-presenta LUMEA.
- HANDOFF_COMPLETE no anima automáticamente la hoja.
- HANDOFF_COMPLETE no ejecuta automáticamente el destello heredado.
- HANDOFF_COMPLETE no inicia menú, registro, tutorial o UI funcional.
- No se implementan timings de identidad.
- No se implementa audio.
- No se implementa háptica.
- No se implementan assets finales.
- No se incorpora todavía DC-006.
- No se incorporan Compi ni Lumi.

## Implementación

- FirstEncounterPresentationHandoffStage.
- FirstEncounterPresentationHandoff.
- firstEncounterInProgress.
- identityPresentationPending.

## Tests

- Antes de HANDOFF_COMPLETE permanece firstEncounterInProgress.
- WAITING_FOR_GUARDIAN no habilita presentación de identidad.
- HANDOFF_COMPLETE produce identityPresentationPending.
- No se presenta automáticamente LUMEA.
- No se animan automáticamente hoja, destello ni A canónica.
- No se inicia automáticamente UI funcional.
- DC-006, Compi y Lumi permanecen fuera de alcance.

## Criterio de cierre

flutter analyze y flutter test deben pasar en verde desde apps/mobile_flutter.

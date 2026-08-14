# DEV-015 · Integración del Estado Visual Canónico en el Adapter

## Estado

En implementación.

## Autoridad y alcance

- DC-005 v1.2 permanece como autoridad visual de Solanf.
- ANIM-001 v1.0 define los estados de actuación.
- FX-002 v1.2 define la evolución visual del vínculo.
- ACC-001 v1.0 permanece como referencia transversal de accesibilidad.

## Objetivo

Integrar FirstEncounterCanonicalVisualState dentro de FirstEncounterOrchestratorPresentationAdapter para que la presentación pueda leer la intención visual canónica sin implementar todavía render final.

## Alcance implementado

- El adapter calcula FirstEncounterCanonicalVisualState desde FirstEncounterOrchestrationState.
- El panel debug expone el momento visual canónico.
- El panel debug expone ubicación y visibilidad de Huella.
- El panel debug expone estado visual de la A.
- El panel debug expone política biométrica abstracta.
- El panel debug expone soporte de reducción de movimiento.
- El panel debug expone exclusión de DC-006, Compi y Lumi.
- El flujo visual placeholder permanece sincronizado por DEV-013.

## Reglas protegidas

- La Huella permanece exclusivamente en almohadillas.
- La A permanece incompleta antes de A_COMPLETION.
- La A solo se completa como resultado del vínculo.
- guardianRecognitionAccepted sigue siendo trigger abstracto.
- No se representa biometría real.
- No se requiere audio para comprender el flujo.
- Se conserva compatibilidad conceptual con reducción de movimiento.
- No se incorpora DC-006.
- No se incorpora Compi.
- No se incorpora Lumi.

## Tests agregados o reforzados

- El estado visual canónico permanece oculto en modo público.
- El debug panel expone el estado visual canónico.
- Presencia de Solanf expone Huella oculta, A oculta y política biométrica abstracta.
- WAITING_FOR_GUARDIAN expone Huella presentada incompleta y A incompleta.
- CONTACT_PENDING mantiene A incompleta.
- A_COMPLETION expone A completándose por vínculo.
- FOOTPRINT_AWAKENED expone Huella despertada en almohadillas.

## Fuera de alcance

No se implementa todavía:

- Render final de Solanf.
- Assets finales.
- Audio.
- Biometría real.
- Flame.
- Firebase.
- Cámara.
- Animación esquelética.
- Portal final.
- Huella visual final.
- A visual completa final.
- Contacto visual final.
- DC-006.
- Compi.
- Lumi.

## Criterio de cierre

El bloque puede cerrarse si flutter analyze y flutter test pasan en verde desde apps/mobile_flutter y el documento queda integrado en main.

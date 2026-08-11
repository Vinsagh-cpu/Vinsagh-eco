# DEV-012 · Adaptador de presentación del Orquestador

## Estado

En implementación.

## Fuentes de verdad

- ANIM-001 v1.0 · Actuación de Solanf hasta WAITING_FOR_GUARDIAN.
- FX-002 v1.1 · Vínculo, culminación de la A y apertura del Umbral.
- DC-005 v1.2 · Canon Oficial de Solanf.

## Objetivo

Conectar FirstEncounterOrchestrator con la capa de presentación existente sin introducir render final, assets, audio, biometría real, Flame ni Huella visual final.

## Alcance implementado

- FirstEncounterOrchestratorPresentationAdapter.
- Integración controlada en LumeaAppEntry.
- Panel debug de estado de orquestación.
- Acción debug guardianRecognitionAccepted.
- Avance automático hasta WAITING_FOR_GUARDIAN.
- Inicio de ThresholdBondController solo después del trigger.
- Llegada a HANDOFF_COMPLETE.

## Flujo visual de placeholder

El adapter conserva FirstEncounterPresentation como placeholder visual actual.

El panel de debug solo aparece cuando debugControlsEnabled está activo.

## Reglas protegidas

- Solanf no continúa por temporizador después de WAITING_FOR_GUARDIAN.
- El vínculo solo inicia con guardianRecognitionAccepted.
- guardianRecognitionAccepted sigue siendo un trigger abstracto.
- No se representa biometría real.
- No se completa visualmente la A en este bloque.
- No se introduce Huella visual final.

## Tests agregados

- Debug UI oculto por defecto.
- Estado de orquestación visible con debug habilitado.
- Llegada a WAITING_FOR_GUARDIAN sin entrar al vínculo.
- Inicio de ThresholdBondController tras guardianRecognitionAccepted.
- Llegada a HANDOFF_COMPLETE desde la presentación.

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

## Criterio de cierre

El bloque puede cerrarse si flutter analyze y flutter test pasan en verde y el documento queda integrado en main.

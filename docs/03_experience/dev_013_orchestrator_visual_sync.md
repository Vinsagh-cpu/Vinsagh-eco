# DEV-013 · Sincronización visual del Orquestador

## Estado

En implementación.

## Fuentes de verdad

- DEV-011 · FirstEncounterOrchestrator.
- DEV-012 · Adaptador de presentación del Orquestador.
- ANIM-001 v1.0 · Solanf llega a WAITING_FOR_GUARDIAN y espera.
- FX-002 v1.1 · El vínculo inicia solo con guardianRecognitionAccepted.
- DC-005 v1.2 · Canon Oficial de Solanf.

## Objetivo

Sincronizar el placeholder visual existente con el FirstEncounterOrchestrator para que la presentación ya no corra como flujo independiente.

## Alcance implementado

- FirstEncounterOrchestratorPresentationAdapter ahora controla el avance visual.
- FirstEncounterPresentation se conserva como placeholder.
- FirstEncounterPresentation recibe un FirstEncounterController sincronizado.
- El autoplay interno del placeholder visual queda desactivado.
- El ticker principal del adapter avanza orquestador y placeholder juntos.
- El placeholder visual se pausa al llegar a WAITING_FOR_GUARDIAN.
- El placeholder visual se reanuda solo después de guardianRecognitionAccepted.
- El panel debug muestra el estado visual sincronizado.

## Reglas protegidas

- Solanf no continúa por temporizador después de WAITING_FOR_GUARDIAN.
- La secuencia de vínculo no inicia sin guardianRecognitionAccepted.
- El trigger guardianRecognitionAccepted sigue siendo abstracto.
- No se representa biometría real.
- No se introduce render final de Solanf.
- No se introduce Huella visual final.
- No se completa visualmente la A.

## Tests agregados o reforzados

- El debug UI sigue oculto por defecto.
- El estado de orquestación se muestra cuando debug está habilitado.
- El placeholder visual no hace autoplay independiente.
- El flujo llega a WAITING_FOR_GUARDIAN sin entrar al vínculo.
- El placeholder visual se pausa en WAITING_FOR_GUARDIAN.
- El vínculo inicia después de guardianRecognitionAccepted.
- El placeholder visual se reanuda después de guardianRecognitionAccepted.
- El adapter llega a HANDOFF_COMPLETE.

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

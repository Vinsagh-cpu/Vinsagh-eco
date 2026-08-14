# DEV-014 · Estado visual canónico del Primer Encuentro

## Estado

En implementación.

## Autoridad y alcance

- DC-005 v1.2 es la autoridad visual de Solanf.
- ANIM-001 v1.0 define los estados de actuación de Solanf.
- FX-002 v1.2 define la evolución visual del vínculo.
- ACC-001 v1.0 permanece como referencia transversal de accesibilidad.

## Objetivo

Crear un modelo de presentación que traduzca el estado del FirstEncounterOrchestrator a intenciones visuales canónicas, sin producir todavía el render final.

## Alcance implementado

- FirstEncounterCanonicalVisualState.
- FirstEncounterCanonicalVisualMoment.
- SolanfFootprintPlacement.
- SolanfFootprintVisibility.
- CanonicalAVisualState.
- GuardianRecognitionVisualPolicy.
- Mapeo desde FirstEncounterOrchestrationState.
- Sensibilidad a la fase narrativa de Solanf.
- Sensibilidad a la fase narrativa del vínculo.
- Protección de la Huella exclusivamente en almohadillas.
- Protección de la A incompleta hasta A_COMPLETION.
- Política explícita de reconocimiento abstracto sin biometría real.
- Exclusión explícita de DC-006, Compi y Lumi.

## Reglas canónicas protegidas

- La Huella solo puede existir en las almohadillas.
- La A permanece oculta o incompleta antes de A_COMPLETION.
- En A_COMPLETION la A puede comenzar a completarse por vínculo.
- Después de A_COMPLETION la A completa solo existe como resultado del vínculo.
- El estado visual no expone biometría real.
- El estado visual no requiere audio para comprender el flujo.
- El estado visual debe admitir alternativa compatible con reducción de movimiento.
- Este bloque no incorpora DC-006.
- Este bloque no incorpora Compi ni Lumi.

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

## Tests agregados

- Inicio como presencia de Solanf sin símbolos protegidos.
- Espera del Guardian con A incompleta en almohadillas.
- A incompleta durante CONTACT_PENDING.
- A incompleta durante BOND_FORMING.
- A completándose solo en A_COMPLETION.
- Huella despertada en almohadillas después de A_COMPLETION.
- Apertura de Umbral sin cambiar política biométrica.
- HANDOFF_COMPLETE como momento visual terminal.
- Huella exclusivamente en almohadillas en hitos narrativos.
- Exclusión de DC-006, Compi y Lumi.

## Criterio de cierre

El bloque puede cerrarse si flutter analyze y flutter test pasan en verde desde apps/mobile_flutter y el documento queda integrado en main.

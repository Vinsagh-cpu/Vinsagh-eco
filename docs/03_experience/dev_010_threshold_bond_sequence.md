# DEV-010 · Vínculo, culminación de la A y apertura del Umbral

## Estado

En implementación.

## Fuentes de verdad

- DC-005 v1.2 · Canon Oficial de Solanf.
- ANIM-001 v1.0 · Solanf llega hasta WAITING_FOR_GUARDIAN.
- FX-002 v1.1 · Primer Encuentro · Vínculo, culminación de la A y apertura del Umbral.

## Objetivo

Modelar la secuencia posterior a WAITING_FOR_GUARDIAN usando un trigger abstracto de reconocimiento del Guardián.

Este bloque no implementa render final, biometría real, assets, audio, Flame ni apertura visual final del Umbral.

## Entrada

- ANIM-001A debe haber alcanzado WAITING_FOR_GUARDIAN.

## Trigger abstracto

- guardianRecognitionAccepted.

El trigger representa éxito/continuación de reconocimiento. No muestra, reconstruye, almacena ni simula datos biométricos reales del Guardián.

## Estados modelados

- WAITING_FOR_GUARDIAN.
- CONTACT_PENDING.
- RECOGNITION_RESPONSE.
- BOND_FORMING.
- A_COMPLETION.
- FOOTPRINT_AWAKENED.
- THRESHOLD_RESPONSE.
- THRESHOLD_OPEN.
- HANDOFF_COMPLETE.

## Timing objetivo

- CONTACT_PENDING: 0.0–0.4 s.
- RECOGNITION_RESPONSE: 0.4–1.0 s.
- BOND_FORMING: 1.0–1.8 s.
- A_COMPLETION: 1.8–2.2 s.
- FOOTPRINT_AWAKENED: 2.2–2.6 s.
- THRESHOLD_RESPONSE: 2.6–3.8 s.
- THRESHOLD_OPEN: 3.8–5.2 s.
- HANDOFF_COMPLETE: desde 5.2 s.

## Regla de la A

Antes de A_COMPLETION, el modelo mantiene la A incompleta.

Solo desde A_COMPLETION se permite representar la A completa como resultado del vínculo con el Guardián.

## Restricciones protegidas

No se implementa todavía:

- Render final del vínculo.
- Huella visual final.
- Biometría real.
- Huella digital real del Guardián.
- Audio.
- Assets.
- Video.
- GIF.
- Flame.
- Firebase.
- Portal circular convencional.
- Rayos.
- Runas flotantes.
- Hologramas.
- Escáneres.
- Explosiones de partículas.

## Tests agregados

- Timing aprobado por FX-002 v1.1.
- Mapeo de tiempo transcurrido a estados.
- A completa permitida solo desde A_COMPLETION.
- Prohibición de datos biométricos visibles.
- Progreso acotado.
- Espera hasta trigger guardianRecognitionAccepted.
- HANDOFF_COMPLETE como salida estable.
- Código canónico del trigger abstracto.

## Criterio de cierre

El bloque puede cerrarse si flutter analyze y flutter test pasan en verde y el documento queda integrado en main.

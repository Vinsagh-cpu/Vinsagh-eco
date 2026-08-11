# DEV-011 · Orquestador del Primer Encuentro

## Estado

En implementación.

## Fuentes de verdad

- ANIM-001 v1.0 · Actuación de Solanf hasta WAITING_FOR_GUARDIAN.
- FX-002 v1.1 · Vínculo, culminación de la A y apertura del Umbral.
- DC-005 v1.2 · Canon Oficial de Solanf.

## Objetivo

Unir el modelo de actuación de Solanf con la secuencia de vínculo y apertura del Umbral mediante un orquestador de dominio.

## Flujo modelado

SolanfPerformanceTimeline
→ WAITING_FOR_GUARDIAN
→ guardianRecognitionAccepted
→ ThresholdBondController
→ HANDOFF_COMPLETE

## Decisión técnica

El orquestador coordina modelos de dominio ya aprobados.

No renderiza, no reproduce audio, no invoca biometría real y no introduce assets.

## Reglas protegidas

- Solanf no avanza más allá de WAITING_FOR_GUARDIAN por temporizador.
- El vínculo solo inicia con guardianRecognitionAccepted.
- guardianRecognitionAccepted es un trigger abstracto.
- La secuencia posterior termina en HANDOFF_COMPLETE.
- El flujo no muestra datos biométricos reales.
- El flujo no anticipa render final, assets ni audio.

## Estados de orquestación

- SOLANF_PERFORMANCE.
- WAITING_FOR_GUARDIAN.
- THRESHOLD_BOND.
- HANDOFF_COMPLETE.

## Tests agregados

- Inicio con actuación de Solanf activa.
- Paso a WAITING_FOR_GUARDIAN después del timing de ANIM-001.
- No avance a vínculo sin trigger.
- Trigger ignorado antes de WAITING_FOR_GUARDIAN.
- Inicio de ThresholdBondController tras guardianRecognitionAccepted.
- Llegada a HANDOFF_COMPLETE.
- No avance después de HANDOFF_COMPLETE.
- Códigos canónicos de orquestación.

## Fuera de alcance

No se implementa todavía:

- Render final.
- Assets.
- Audio.
- Biometría real.
- Flame.
- Firebase.
- Cámara.
- Animación esquelética.
- Portal final.
- Huella visual final.
- Contacto visual final.

## Criterio de cierre

El bloque puede cerrarse si flutter analyze y flutter test pasan en verde y el documento queda integrado en main.

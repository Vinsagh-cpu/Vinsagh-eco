# DEV-007 · Acceso interno al Light Preview Harness

## Estado

En implementación.

## Objetivo

Permitir abrir el LightPreviewHarness desde la app en desarrollo sin convertirlo en parte pública de Lumea.

## Alcance implementado

- InternalLightPreviewAccess.
- Botón interno de acceso al harness.
- Acceso desactivado por defecto.
- Activación explícita mediante parámetro internalPreviewAccessEnabled.
- Activación explícita mediante dart define LUMEA_ENABLE_INTERNAL_PREVIEW.
- Integración controlada en LumeaAppEntry.
- Tests para verificar que el acceso interno permanece oculto por defecto.
- Tests para verificar que el harness abre cuando el acceso interno está habilitado.

## Uso interno

Para ejecutar la app con el acceso interno habilitado:

flutter run -d chrome --dart-define=LUMEA_ENABLE_INTERNAL_PREVIEW=true

## Restricciones protegidas

No se implementa todavía:

- Experiencia pública final.
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

## Decisión técnica

El acceso interno vive como una compuerta de desarrollo.

Por defecto no aparece en la app. Esto permite revisar y ajustar la luz procedural sin contaminar la experiencia pública ni acoplar LightLayer a narrativa final.

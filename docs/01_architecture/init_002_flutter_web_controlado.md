# INIT-002 - Inicializacion real/controlada de Flutter para Web

## Estado

Intento de inicializacion web controlada documentado. El proyecto no pudo ser creado desde este shell porque `flutter` no esta disponible en la ruta ejecutable que ve Codex en este momento.

## Proposito

Inicializar de forma controlada un proyecto Flutter real dentro de `apps/mobile_flutter`, usando unicamente plataforma web por ahora, sin Android, sin iOS, sin Firebase, sin Flame y sin pantallas finales.

## Estado del entorno Flutter

El entorno reportado por la fundadora indica:

- Flutter instalado.
- Chrome disponible.
- Android toolchain pendiente.
- Visual Studio para Windows apps pendiente.

Sin embargo, en el shell operativo de esta sesion `flutter` no pudo resolverse para ejecutar `flutter create`.

## Decision de uso

La decision tecnica sigue siendo usar Chrome/web como primer target de prueba.

Android queda pendiente para fase posterior.

Visual Studio para Windows apps queda pendiente y no bloquea el arranque web.

## Comandos intentados

- `flutter create --platforms=web apps/mobile_flutter`

Resultado:

- El comando fallo en PowerShell porque `flutter` no se reconoce como cmdlet o ejecutable.
- El comando fallo tambien en Git Bash porque `flutter: command not found`.

## Bloqueo actual

La inicializacion real de `apps/mobile_flutter` no pudo completarse porque el binario de Flutter no esta accesible desde el shell que Codex puede usar en esta sesion.

## Que no se implemento todavia

- No se creo el proyecto Flutter web.
- No se ejecuto `flutter pub get`.
- No se ejecuto `flutter analyze`.
- No se ejecuto `flutter run`.
- No se agrego Firebase.
- No se agrego Flame.
- No se agregaron assets reales.
- No se crearon pantallas finales.

## Recomendacion siguiente

Antes de retomar INIT-002, hacer que el shell de trabajo vea `flutter` de forma efectiva y repetir la inicializacion web controlada con una meta minima.

## Proximo paso recomendado

- `APP-001` o la inicializacion web de `INIT-002` solo cuando el comando `flutter` sea ejecutable desde el entorno disponible.

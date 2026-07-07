# TRAIN-004D - Errores Flutter comunes

## Proposito

Preparar a la fundadora para reconocer errores frecuentes sin perder control ni improvisar soluciones.

## Errores comunes

### `flutter no reconocido`

Significa que Flutter no esta instalado o no esta en el `PATH`.

Accion:

- Confirmar instalacion.
- Revisar variables de entorno.
- No asumir que el problema esta en el proyecto.

### `no devices found`

Flutter no encuentra un dispositivo o emulador para correr la app.

Accion:

- Conectar un dispositivo.
- Abrir un emulador.
- Revisar disponibilidad antes de correr de nuevo.

### `pub get failed`

La descarga o resolucion de dependencias fallo.

Accion:

- Revisar `pubspec.yaml`.
- Verificar conexion o compatibilidad.
- Confirmar que no haya un typo en paquetes o versiones.

### `analyzer errors`

El analizador encontro errores de Dart o de estructura.

Accion:

- Leer el error real.
- Corregir el archivo exacto.
- No continuar con otros cambios hasta limpiar el analisis.

### `archivo bloqueado por VS Code`

El archivo esta en uso y no puede guardarse o editarse con normalidad.

Accion:

- Cerrar el archivo o la vista que lo bloquea.
- Volver a guardar.
- Evitar duplicar ediciones a mano.

### `dependencia faltante`

El proyecto espera algo que no esta declarado o no esta disponible.

Accion:

- Revisar la declaracion.
- Confirmar si la dependencia realmente debe entrar.
- No agregar paquetes por impulso.

### `ruta incorrecta`

Flutter o Dart no encuentra un archivo o carpeta esperada.

Accion:

- Verificar nombres.
- Confirmar `snake_case`.
- Revisar que la ruta exista de verdad.

## Regla de lectura

No todos los errores se resuelven con mas codigo.

A veces la solucion es pausar, leer el mensaje completo y corregir el entorno o la ruta exacta.

## Criterio de seguridad

Si el error afecta `android/`, `ios/`, `firebase/`, `pubspec.yaml`, `build/` o `.dart_tool/`, no se toca nada a ciegas. Se pide una tarea acotada o supervision tecnica.

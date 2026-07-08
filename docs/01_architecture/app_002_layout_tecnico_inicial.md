# APP-002 - Estructura visual minima / layout tecnico inicial

## Proposito
Definir una estructura visual tecnica minima para Vinsagh Eco Studios en Flutter Web, con una pantalla controlada que sirva como base de layout para futuras pantallas del proyecto.

## Alcance
- Pantalla tecnica inicial en `apps/mobile_flutter/lib/main.dart`.
- Prueba minima de render en `apps/mobile_flutter/test/widget_test.dart`.
- Documentacion tecnica de la decision y de lo que quedo fuera.

## Archivos modificados
- `apps/mobile_flutter/lib/main.dart`
- `apps/mobile_flutter/test/widget_test.dart`
- `docs/01_architecture/app_002_layout_tecnico_inicial.md`

## Decision tecnica
Se sustituyo la pantalla tecnica simple por un layout mas estructurado, todavia minimo y no final, usando solo widgets nativos de Flutter y sin dependencias nuevas.

## Que se implemento
- `MaterialApp` y `Scaffold` como base.
- Layout responsive con `LayoutBuilder`.
- Bloque de encabezado tecnico.
- Vista wireframe de tres zonas: header, contenido y footer.
- Paneles de estado y estructura.
- Etiquetas visibles para:
  - `Vinsagh Eco Studios`
  - `APP-002`
  - `Flutter Web base activo`
  - `Sin Firebase`
  - `Sin Flame`
  - `Sin assets reales`
- Prueba widget que valida el render del layout.

## Que no se implemento
- Firebase.
- Flame.
- Login.
- Tienda.
- Founder Club.
- Personajes completos.
- Assets reales.
- Pantallas finales.
- Navegacion compleja.

## Validaciones ejecutadas
- `flutter pub get`
- `flutter analyze`
- `flutter test`
- `flutter build web`

## Proximo paso recomendado
`APP-003 - Separacion minima de widgets tecnicos`

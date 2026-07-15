# APP-009 · Ajuste visual de Mi Sendero

## Problemas observados en la primera prueba visual

- La navegación compacta podía sentirse como una barra superior extensa, más cercana a un dashboard técnico que a una primera experiencia de Lumea.
- El encabezado no daba suficiente protagonismo emocional a "Bienvenida, Guardián".
- "Reconexión Disponible" competía visualmente con las demás tarjetas en lugar de funcionar como la acción principal.
- "Mi Cartera" dejaba demasiado aire vertical y no aprovechaba bien el ancho de escritorio.
- Los módulos principales existían, pero la composición no usaba una retícula consistente para escritorio, tablet y móvil.

## Decisiones responsive

- Escritorio desde 1080 px: sidebar lateral izquierdo de 244 px y contenido principal a la derecha.
- Tablet desde 720 px: navegación compacta adaptable arriba, contenido centrado y retícula de dos columnas cuando el ancho lo permite.
- Móvil: estructura apilada en una columna con padding reducido y sin navegación horizontal.
- La pantalla usa `LayoutBuilder`, `SingleChildScrollView`, `ConstrainedBox` y `Wrap` para evitar overflow y mantener widgets nativos de Flutter.

## Cambios de jerarquía

- El encabezado pasa a ser una bienvenida visual más cálida, con "Bienvenida, Guardián" como elemento dominante.
- Se mantienen "Lumea despierta" y "Primera Huella en curso" como señales de estado, pero con lectura menos técnica.
- "Reconexión Disponible" queda primera en la retícula y ocupa dos columnas en escritorio/tablet para funcionar como acción visual principal.
- "Mi Cartera" queda junto a la acción principal en escritorio y organiza monto/descripción en horizontal cuando hay espacio.

## Retícula utilizada

- Contenido máximo: 1220 px, centrado dentro del área principal.
- Sidebar escritorio: 244 px.
- Grid principal:
  - 3 columnas en escritorio amplio.
  - 2 columnas en tablet/ancho intermedio.
  - 1 columna en móvil.
- Spans principales:
  - Reconexión Disponible: 2 columnas en escritorio/tablet.
  - Mi Cartera: 1 columna.
  - Galería de Samara: 2 columnas en escritorio/tablet.
  - Atelier: 1 columna.
  - Mi Impacto: 2 columnas en escritorio/tablet.
  - Compi/Lumi: 1 columna.

## Componentes ajustados

- `HomeScreen`: sidebar lateral real, navegación compacta adaptable y grid responsive.
- `GuardianHeader`: nueva jerarquía visual, gradiente cálido y chips de estado.
- `LumeaSidebar`: variante lateral premium y variante compacta para tablet/móvil.
- `ReconnectionAvailableCard`: tarjeta principal con copy más claro y botón "Iniciar Reconexión" sin acción funcional.
- `WalletCard`: composición horizontal en escritorio y columna en móvil.
- `SamaraCollectionsCard`, `AtelierCard`, `ImpactCard`, `CompanionPanel`: radios, paddings, textos y retículas internas unificados.
- `VinsaghSpacing` y `VinsaghColors`: radios compartidos y color de apoyo para evitar constantes visuales dispersas.

## Qué sigue sin ser funcional

- El botón "Iniciar Reconexión" no ejecuta flujo real.
- La navegación de Lumea no cambia de sección.
- No hay Firebase, Flame, assets reales, login, checkout, carrito, pagos, persistencia ni navegación profunda.
- Compi y Lumi siguen siendo contenido visual estático.

## Validaciones ejecutadas

Desde `apps/mobile_flutter`:

- `flutter pub get`: OK.
- `flutter analyze`: OK, sin issues.
- `flutter test`: OK, todos los tests pasaron.
- `flutter build web`: OK, build generado en `build/web`.

## Próximo paso recomendado

APP-010 debería validar esta experiencia en navegador con captura visual desktop/tablet/móvil y ajustar microcopy, densidad vertical y estados hover/focus antes de conectar navegación o lógica real.

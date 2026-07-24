# ARCH-001 · Fundación del Motor de Lumea

**Estado:** Listo para implementación  
**Tipo:** Refactor arquitectónico sin cambio visual  
**Base recomendada:** `main`  
**Objetivo:** Convertir el Canon vigente en una arquitectura modular, extensible y desacoplada de Flutter.

## Alcance

ARCH-001 introduce la estructura mínima de dominios para Lumea, Ecosistemas, Senderos, Huellas, Guardián, Samara, Atelier, Vestimenta, Compi, Lumi y Reconexión.

No debe introducir contenido definitivo, rediseñar VS-001 ni alterar su experiencia visible.

## Principios obligatorios

1. Los dominios no dependen de Flutter.
2. La UI consume casos de uso y estados; no contiene lógica narrativa.
3. Senderos y ecosistemas se definen mediante datos.
4. Las Huellas son entidades persistentes independientes de su origen.
5. Samara es un lugar modular dentro de Lumea.
6. Compi y Lumi son entidades con estado, presencia, expresión y vestimenta.
7. No existen skins; existen prendas.
8. Ningún texto narrativo se incrusta directamente en widgets.
9. Agregar un ecosistema o Sendero no debe exigir modificar el núcleo.
10. El refactor no debe cambiar el comportamiento visible actual.

## Estructura inicial

```text
lib/src/
├── core/
│   ├── events/
│   ├── identifiers/
│   ├── persistence/
│   └── result/
├── domains/
│   ├── lumea/
│   ├── ecosystems/
│   ├── trails/
│   ├── footprints/
│   ├── guardian/
│   ├── samara/
│   ├── atelier/
│   ├── wardrobe/
│   ├── companions/
│   └── reconnection/
└── features/
    └── awakening/
```

Cada dominio podrá contener `domain/`, `application/` e `infrastructure/`. La presentación permanece en las features dependientes de Flutter.

## Modelos mínimos

- Lumea: `LumeaState`, `LumeaLocation`, `LumeaProgress`, `UniverseEvent`
- Ecosistemas: `EcosystemId`, `EcosystemDefinition`, `EcosystemState`, `EcosystemRepository`
- Senderos: `TrailId`, `TrailDefinition`, `TrailStepDefinition`, `TrailState`, `TrailOutcome`, `TrailRepository`, `TrailEngine`
- Huellas: `FootprintId`, `Footprint`, `FootprintOrigin`, `FootprintRepository`
- Guardián: `GuardianId`, `GuardianProfile`, `GuardianAffinity`, `GuardianProgress`, `GuardianRepository`
- Samara: `SamaraState`, `SamaraModule`, `SamaraRepository`
- Anfitriones: `CompanionId`, `CompanionDefinition`, `CompanionState`, `CompanionExpression`, `CompanionPresence`, `CompanionRepository`
- Atelier y vestimenta: `GarmentId`, `GarmentDefinition`, `GarmentVariant`, `WardrobeState`, `AtelierState`, `WardrobeRepository`
- Reconexión: `ReconnectionId`, `ReconnectionState`, `ReconnectionRepository`

## Eventos iniciales

```text
GuardianEnteredLumea
EcosystemEntered
TrailStarted
TrailAdvanced
TrailCompleted
FootprintCreated
GuardianAffinityUpdated
CompanionPresenceChanged
GarmentUnlocked
GarmentEquipped
SamaraEntered
ReconnectionStarted
ReconnectionCompleted
```

Los eventos serán objetos de dominio inmutables. ARCH-001 no requiere todavía un bus global complejo.

## Persistencia

Definir interfaces de repositorio. Las implementaciones concretas podrán permanecer en memoria durante ARCH-001.

Quedan fuera: base de datos remota, sincronización, analítica, biometría y Portal AR.

## Integración con VS-001

El Awakening Shell debe seguir funcionando. ARCH-001 solo prepara puntos de integración para crear posteriormente:

- estado inicial del Guardián;
- estado inicial de Lumea;
- `portalPending`;
- afinidad inicial;
- preferencias y consentimientos.

No cambiar flujo visual ni textos en este paquete.

## Pruebas mínimas

1. Registrar un ecosistema nuevo sin modificar el motor.
2. Cargar un Sendero desde una definición de datos.
3. Completar un Sendero y generar una Huella independiente.
4. Conservar el origen de una Huella sin depender del objeto Sendero.
5. Cambiar Samara sin alterar un ecosistema.
6. Cambiar la vestimenta de Compi y Lumi sin cambiar su identidad.
7. Verificar que dominio no importe Flutter.
8. Mantener en verde las pruebas del Awakening Shell.

## Exclusiones

No incluye interfaz definitiva, Design System, assets finales, animaciones, biometría real, Portal, los 128 Senderos, backend ni migración completa de persistencia.

## Criterio de aceptación

ARCH-001 queda aprobado cuando:

- `flutter analyze` no reporta incidencias;
- `flutter test` pasa completamente;
- no existen importaciones de Flutter en modelos y reglas de dominio;
- un ecosistema y un Sendero de ejemplo se añaden mediante datos;
- completar el Sendero de ejemplo produce una Huella;
- Samara permanece desacoplada de la exploración;
- Compi y Lumi existen como entidades extensibles;
- VS-001 conserva su comportamiento;
- el universo puede crecer sin reescribir el motor.

## Secuencia de commits recomendada

```text
chore(arch): create Lumea domain boundaries
feat(ecosystems): add data-driven ecosystem contracts
feat(trails): add data-driven trail engine contracts
feat(footprints): add independent footprint domain
feat(guardian): add guardian state contracts
feat(samara): add modular Samara contracts
feat(companions): add companion entity contracts
feat(wardrobe): add garment and wardrobe contracts
test(arch): verify domain extensibility gates
docs(arch-001): document Lumea engine foundation
```

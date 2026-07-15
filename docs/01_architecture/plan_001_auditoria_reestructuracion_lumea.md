# PLAN-001 - Auditoria de reestructuracion arquitectonica Lumea

Fecha de auditoria: 2026-07-15

Repositorio local auditado: `Vinsagh Eco`

Rama obligatoria confirmada: `refactor/lumea-architecture-foundation`

Estado inicial del working tree: limpio antes de crear este reporte

## 1. Resumen ejecutivo

El repositorio tiene una base funcional y visual aprobada para Lumea en APP-008 y APP-009. La app Flutter entra directamente a una experiencia visual de `Mi Sendero` mediante `MaterialApp.home = HomeScreen`, sin rutas, sin Portal, sin transicion narrativa, sin persistencia y sin servicios externos. Esto confirma que no existe una Home tradicional funcional; el archivo `home_screen.dart` actua como contenedor de Mi Sendero, no como home generica del producto.

La capa visual actual es reutilizable. `HomeScreen`, los widgets de Mi Sendero y el sistema visual `VinsaghColors`, `VinsaghSpacing`, `VinsaghRadii` y `VinsaghTheme` deben conservarse como referencia de experiencia aprobada. La deuda principal no esta en la composicion visual sino en el acoplamiento: datos, copy, estados, navegacion visual, iconos y acciones placeholder viven dentro de widgets de presentacion.

La arquitectura recomendada puede avanzar, pero no debe crear todo el arbol objetivo de una vez. La reorganizacion debe hacerse por migracion incremental, empezando por `shared` y por las features que ya existen visualmente. `core`, `shared` y algunas carpetas `features/*/presentation` son necesarias en fases proximas; `data` y `domain` deben esperar a contratos aprobados. Portal, AR, comunidad, biblioteca, economia interna completa y modelos de Guardian no deben implementarse todavia.

Recomendacion general: **GO CON CONDICIONES** para iniciar la reorganizacion. Condiciones: preservar la experiencia APP-009, no introducir dependencias, no crear modelos antes de validacion creativa, desacoplar navegacion primero y migrar por feature sin cambio visual.

## 2. Estado actual del repositorio

### Confirmaciones de entrada

| Item | Estado auditado |
| --- | --- |
| Rama activa | `refactor/lumea-architecture-foundation` |
| Working tree antes del reporte | Limpio |
| Flutter local | Flutter 3.44.5 stable, revision `f94f4fc76b`, Dart 3.12.2, DevTools 2.57.0 |
| Tipo de proyecto Flutter | App Flutter con plataformas `root` y `web` en `.metadata` |
| SDK declarado | `environment.sdk: ^3.12.2`; lockfile `dart >=3.12.2 <4.0.0` |
| Plataforma real presente | Web. No hay carpetas Android/iOS versionadas en la app |
| Canon | `docs/00_canon/` esta mencionado como reservado, pero no existe fisicamente en esta rama |
| Apps | `apps/mobile_flutter` |
| Paquetes internos | `ve_agent_experience`, `ve_assets_manifest`, `ve_content_engine`, `ve_core`, `ve_game_flame`, `ve_services_firebase`, `ve_ui_kit` |
| Paquete con contenido real | `packages/ve_assets_manifest` |
| Backend | `firebase/` con reglas cerradas y sin indices |

### Organizacion Flutter actual

- `apps/mobile_flutter/lib/main.dart` ejecuta `VinsaghEcoApp`.
- `VinsaghEcoApp` configura `MaterialApp`, tema y `home: const HomeScreen()`.
- `features/home/` contiene la experiencia visual de Mi Sendero.
- `theme/` contiene tokens visuales locales de la app.
- `widgets/`, `modules/`, `navigation/` y `verticals/` contienen la base tecnica legacy de APP-004 a APP-007.
- `test/widget_test.dart` valida la experiencia APP-009 por textos visibles y scroll.
- `web/` mantiene metadatos de plantilla Flutter.

## 3. Arbol arquitectonico actual

```text
apps/mobile_flutter/
  lib/
    main.dart
    src/
      vinsagh_eco_app.dart
      technical_dashboard_screen.dart
      features/
        home/
          home_screen.dart
          widgets/
            atelier_card.dart
            companion_panel.dart
            guardian_header.dart
            impact_card.dart
            lumea_sidebar.dart
            reconnection_available_card.dart
            samara_collections_card.dart
            wallet_card.dart
      theme/
        vinsagh_colors.dart
        vinsagh_spacing.dart
        vinsagh_theme.dart
      widgets/
        footer_badge.dart
        scope_panel.dart
        technical_modules_panel.dart
        technical_navigation_panel.dart
        technical_status_card.dart
        vertical_001_panel.dart
      modules/
        technical_module.dart
      navigation/
        technical_navigation_item.dart
      verticals/
        vertical_001_stage.dart
  test/
    widget_test.dart
  web/
    index.html
    manifest.json

packages/
  ve_assets_manifest/
    assets_manifest.json
    schema/assets_manifest_schema.json
    README.md
  ve_agent_experience/        # reservado por .gitkeep
  ve_content_engine/          # reservado por .gitkeep
  ve_core/                    # reservado por .gitkeep
  ve_game_flame/              # reservado por .gitkeep
  ve_services_firebase/       # reservado por .gitkeep
  ve_ui_kit/                  # reservado por .gitkeep

assets/                       # carpetas reservadas; sin assets reales
firebase/                     # reglas cerradas; sin integracion activa
docs/                         # arquitectura, experiencia, storyboard, DS, game, backend y release
tools/                        # reservado
```

Archivos Dart mas grandes:

| Archivo | Lineas auditadas | Lectura |
| --- | ---: | --- |
| `features/home/widgets/lumea_sidebar.dart` | 219 | Navegacion visual hardcodeada |
| `features/home/home_screen.dart` | 213 | Composicion y grid de Mi Sendero |
| `technical_dashboard_screen.dart` | 186 | Superficie tecnica legacy no conectada |
| `features/home/widgets/guardian_header.dart` | 157 | Header visual del Guardian |
| `widgets/technical_navigation_panel.dart` | 164 | Navegacion tecnica legacy |

No hay archivos excesivamente grandes todavia. El riesgo viene mas por responsabilidades mezcladas que por tamano.

## 4. Dependencias

### Dependencias declaradas

| Tipo | Dependencia | Estado |
| --- | --- | --- |
| Produccion | `flutter` | SE CONSERVA |
| Produccion | `cupertino_icons: ^1.0.8` | SE ADAPTA; viene de plantilla y no se observa uso directo en la UI actual |
| Desarrollo | `flutter_test` | SE CONSERVA |
| Desarrollo | `flutter_lints: ^6.0.0` | SE CONSERVA |

### Dependencias ausentes por diseno actual

- No hay `go_router`, `auto_route` ni otro router.
- No hay Firebase en Flutter (`firebase_core`, `cloud_firestore`, `firebase_auth`, etc.).
- No hay Flame.
- No hay AR, camara, permisos ni sensores.
- No hay state management externo.
- No hay persistencia local.
- No hay assets declarados en `pubspec.yaml`.
- No hay fonts declaradas.

### Evaluacion

La base minima es adecuada para una reestructuracion sin presion de compatibilidad externa. No se recomienda agregar dependencias en la fase de reorganizacion. La navegacion futura debe poder empezar con abstracciones simples y solo incorporar router cuando haya flujo aprobado.

## 5. Clasificacion SE CONSERVA / SE ADAPTA / SE REEMPLAZA

| Elemento | Clasificacion | Justificacion |
| --- | --- | --- |
| `main.dart` | SE CONSERVA | Entrada limpia y minima. |
| `VinsaghEcoApp` | SE ADAPTA | Debe dejar de apuntar directamente a `HomeScreen` cuando exista Portal/routing. |
| `features/home/home_screen.dart` | SE ADAPTA | Es Mi Sendero, no Home generica. Debe migrar conceptualmente a `journey` o nombre validado. |
| `GuardianHeader` | SE ADAPTA | Visual reutilizable; datos y copy deben venir de contratos aprobados. |
| `LumeaSidebar` | SE ADAPTA | Base visual util; items, estado activo y destino deben salir de una configuracion de navegacion. |
| `ReconnectionAvailableCard` | SE ADAPTA | Card visual aprobada; boton sin accion y sin feature real. |
| `WalletCard` | SE ADAPTA | UI valida; saldo y V.S. Coins hardcodeados requieren dominio de economia. |
| `SamaraCollectionsCard` | SE ADAPTA | UI valida; piezas son datos placeholder y requieren taxonomia. |
| `AtelierCard` | SE ADAPTA | UI valida; accion y tags dependen de reglas futuras. |
| `ImpactCard` | SE ADAPTA | UI valida; metricas hardcodeadas deben moverse a huellas/impacto cuando exista contrato. |
| `CompanionPanel` | SE ADAPTA | Compi y Lumi son contenido hardcodeado; deben ser entidades/componentes reutilizables. |
| `VinsaghColors` | SE CONSERVA | Base visual APP-009. Debe moverse solo sin cambiar valores. |
| `VinsaghSpacing` y `VinsaghRadii` | SE CONSERVA | Tokens simples y utiles. |
| `VinsaghTheme` | SE CONSERVA | Centraliza `ThemeData`; puede pasar a `shared/theme`. |
| `technical_dashboard_screen.dart` | SE REEMPLAZA | Superficie tecnica legacy no conectada al flujo actual. |
| `widgets/technical_*` | SE REEMPLAZA | Representan placeholders tecnicos de fases anteriores, no arquitectura Lumea final. |
| `modules/technical_module.dart` | SE REEMPLAZA | Modelo de presentacion legacy acoplado a `IconData`. |
| `navigation/technical_navigation_item.dart` | SE REEMPLAZA | Navegacion tecnica legacy; no sirve para Portal/Mi Sendero. |
| `verticals/vertical_001_stage.dart` | SE REEMPLAZA | Concepto legacy de Vertical 001; no debe convertirse en dominio sin validacion. |
| `test/widget_test.dart` | SE ADAPTA | Conserva una guardia visual APP-009, pero debe ampliarse por flujo y arquitectura. |
| `firebase/firestore.rules` | SE CONSERVA | Reglas cerradas por defecto. |
| `firebase/storage.rules` | SE CONSERVA | Reglas cerradas por defecto. |
| `firebase/indexes.json` | SE CONSERVA | Sin indices activos. |
| `packages/ve_assets_manifest` | SE CONSERVA | Manifiesto vacio y schema son utiles. |
| Paquetes internos vacios | SE ADAPTA | Son reservas validas, pero no deben duplicar la nueva estructura sin uso. |
| `assets/` reservado | SE CONSERVA | Estructura preparada sin assets reales. |
| `web/index.html` y `web/manifest.json` | SE ADAPTA | Siguen con metadatos de plantilla. |
| Documentacion ARCH/UX/SB/GAME/FIRE | SE ADAPTA | Mantener como antecedente, pero reconciliar con Lumea/Guardian. |

## 6. Acoplamientos encontrados

- `VinsaghEcoApp` acopla el acceso inicial a `HomeScreen`; no hay bootstrap, router ni decision de estado.
- `HomeScreen` compone todas las responsabilidades visibles: Sendero, Reconexion, Cartera, Galeria, Atelier, Impacto y personajes.
- `features/home` mezcla contenedor de experiencia con widgets de features que ya tienen dominios separados.
- `LumeaSidebar` contiene labels, iconos y estado activo en una lista privada `_items`; la navegacion no es funcional ni externa.
- Cards como `WalletCard`, `ImpactCard` y `SamaraCollectionsCard` contienen datos placeholder privados en la UI.
- `AtelierCard` y `ReconnectionAvailableCard` exponen botones con `onPressed: () {}` sin contrato de accion.
- `CompanionPanel` define a Compi y Lumi como textos estaticos dentro de una sola pantalla.
- Clases tecnicas (`TechnicalModule`, `TechnicalNavigationItem`, `Vertical001Stage`) dependen de `IconData`, por lo que no son dominio puro.
- `widget_test.dart` usa textos de UI como contrato; esto protege la visual, pero vuelve fragil cualquier cambio de microcopy.
- La documentacion usa `Agente`, `Vin` y `Sagh`; la UI actual usa `Guardian`, `Compi` y `Lumi`. La resolucion vigente adopta `Guardian` y confirma Compi/Lumi como canonicos; la relacion con Vin/Sagh sigue pendiente.

## 7. Deuda tecnica

- No existe separacion real entre UI, dominio y datos.
- No hay modelos de dominio implementados.
- No hay servicios ni repositorios implementados.
- No hay persistencia local o remota.
- No hay navegacion funcional.
- No hay rutas profundas.
- No hay Portal ni transicion narrativa.
- No hay mecanismo para estado inicial, consentimiento, perfil progresivo o recuperacion de sesion.
- No hay feature flags ni capacidades para preparar AR.
- La carpeta `features/home` ya no representa bien su responsabilidad.
- Persisten superficies legacy (`technical_dashboard_screen.dart` y widgets tecnicos) que no participan en la experiencia actual.
- `web/manifest.json`, `web/index.html` y `apps/mobile_flutter/README.md` conservan datos de plantilla.
- Hay datos placeholder: saldo `1,240`, metricas `0.0 kg`, `0 L`, `0 g`, piezas de Samara, tags del Atelier, mensajes de Compi/Lumi.
- Hay acciones placeholder sin comportamiento.
- `docs/00_canon` esta referenciado, pero no existe en el arbol versionado.
- Los paquetes internos estan reservados por `.gitkeep`, pero no tienen contratos ni `pubspec.yaml` propios.

## 8. Riesgos

| Riesgo | Impacto | Mitigacion |
| --- | --- | --- |
| Mover todo el arbol objetivo de una vez | Rompe APP-009 o genera carpetas vacias sin valor | Migracion por feature con diffs pequenos |
| Crear modelos antes de cerrar contratos y relaciones | Duplica `Guardian`, `Compi`, `Lumi`, `Vin`, `Sagh`, Huellas o progreso | Decision creativa y tecnica antes de dominio |
| Introducir router antes del flujo Portal | Navegacion rigida o incorrecta | Primero desacoplar `home`, luego rutas |
| Crear `data/` sin persistencia aprobada | Repositorios vacios y contratos falsos | Esperar a Firebase/local storage aprobados |
| Agregar AR temprano | Dependencias pesadas y permisos sin UX | Reservar capacidades, no plugins |
| Expandir economia con V.S. Coins | Riesgo de reglas economicas improvisadas | Definir economia interna antes de clases |
| Separar cards sin pruebas | Regresiones visuales | Mantener test APP-009 y agregar pruebas por widget |
| Usar docs legacy como canon | Confusion narrativa | Documentar como antecedente, no canon |

## 9. Oportunidades de reutilizacion

- `VinsaghColors`, `VinsaghSpacing`, `VinsaghRadii` y `VinsaghTheme` pueden migrar a `shared/theme` sin cambios visuales.
- El patron de card con `DecoratedBox`, borde y padding puede convertirse en un componente compartido despues de dos o tres usos estabilizados.
- Los chips de `GuardianHeader` y tags de `AtelierCard` pueden converger en un componente `SignalChip`/`Tag` compartido.
- `_FeatureGridItem` y la logica responsive de `HomeScreen` pueden convertirse en helper de layout si otras pantallas repiten la grilla.
- `LumeaSidebar` puede reutilizar la visual si recibe descriptors externos.
- `packages/ve_assets_manifest` ya ofrece base para validar assets futuros.
- Reglas Firebase cerradas por defecto permiten activar backend mas adelante sin exposicion accidental.
- La documentacion UX/SB/GAME/FIRE puede servir como insumo de contratos, siempre que Direccion Creativa valide la nueva nomenclatura Lumea.

## 10. Evaluacion de la navegacion

### Acceso inicial actual

El acceso inicial actual es directo:

```text
main.dart
  -> VinsaghEcoApp
    -> MaterialApp
      -> HomeScreen
```

No existe pantalla Portal, Home tradicional, seleccion de estado, onboarding, autenticacion, perfil ni redireccion condicional. El usuario cae directamente en Mi Sendero.

### Existencia o ausencia de Home tradicional

Hay una clase `HomeScreen`, pero funcionalmente representa `Mi Sendero`. No hay Home tradicional con secciones, landing, dashboard general o hub independiente. El nombre `home` ya no describe correctamente la responsabilidad.

### Navegacion actual

`LumeaSidebar` muestra:

- Mi Sendero.
- Galeria de Samara.
- Atelier.
- Biblioteca.
- Las Huellas.
- Mi Impacto.

El estado activo esta hardcodeado en `Mi Sendero`. Los items no navegan, no tienen route id, no tienen permisos, no tienen feature flags y no actualizan pantalla.

### Navegacion futura

Flujo objetivo conceptual solicitado:

```text
Portal
  -> Transicion narrativa
    -> Mi Sendero
```

Partes conservables:

- `MaterialApp` como contenedor.
- `HomeScreen` como experiencia visual base, despues de renombrar/mover.
- `LumeaSidebar` como componente visual si se desacopla de datos.
- Test visual APP-009 como guardia de que Mi Sendero sigue visible.

Partes a desacoplar:

- `home: const HomeScreen()` debe pasar a una decision de entrada.
- `LumeaSidebar._items` debe salir a route descriptors o configuracion de navegacion.
- Los botones de Reconexion y Atelier deben emitir intenciones, no ejecutar nada inline.
- El concepto "Home" debe reemplazarse por `journey` o nombre validado.

## 11. Evaluacion de personajes

Compi y Lumi existen solo en `CompanionPanel` como dos `_CompanionNote` estaticos. La resolucion creativa vigente confirma que son personajes principales y canonicos de la IP: Compi impulsa la exploracion y Lumi sensibiliza despues de una experiencia. No hay todavia entidad tecnica, contrato, id, estado, assets, comportamiento, tono configurable ni reutilizacion fuera de Mi Sendero.

Evaluacion:

- SE ADAPTA el panel visual.
- Compi y Lumi deben salir de una sola pantalla y vivir como responsabilidad de `features/characters` cuando se autorice implementacion.
- No se debe crear todavia un sistema de personajes.
- No se debe asumir relacion canonica con Vin y Sagh.
- La direccion creativa ya resolvio su condicion de personajes principales; siguen pendientes relacion con Vin/Sagh, reglas de aparicion, assets, estados y contratos.

Requisito futuro minimo antes de implementar:

- Identificador estable por personaje o presencia.
- Rol narrativo aprobado y comportamiento esperado por contexto.
- Nivel de personalizacion permitido.
- Relacion con Guardian, Portal y Sendero.
- Regla de uso en pantallas distintas a Mi Sendero.

## 12. Evaluacion de economia y perfil

### Perfil

La UI usa "Guardian" en copy y `GuardianHeader`, pero no existe `GuardianProfile`, preferencias, consentimiento, estado, identidad ni persistencia. La documentacion previa usa "Agente"; la resolucion vigente adopta `Guardian` como termino principal. El riesgo restante es tecnico: crear modelos antes de cerrar contratos, privacidad y relacion con documentos legacy.

### Economia

`WalletCard` muestra:

- `Mi Cartera`.
- saldo `1,240`.
- `V.S. Coins`.
- texto de reserva para futuras Reconexiones.

No existe economia interna implementada, reglas de emision, reglas de gasto, historial, inventario, recompensas ni persistencia. La resolucion vigente define `V.S. Coins` como reconocimiento interno, no dinero ni puntos; no debe convertirse todavia en clase productiva sin contrato tecnico.

### Impacto

`ImpactCard` muestra metricas iniciales hardcodeadas:

- CO2 evitado.
- Agua ahorrada.
- Residuos reducidos.

Estas metricas pertenecen probablemente a `footprints`, `guardian impact` o `progress`, pero el propietario debe definirse antes de crear modelos para evitar duplicacion entre `GuardianImpact`, `GuardianFootprints` y `GuardianProgress`.

## 13. Preparacion para Portal y AR

### Portal

No existe Portal en codigo. La resolucion vigente define el acceso futuro como Primer Vinculo -> Portal -> transicion -> Mi Sendero. La preparacion correcta sigue siendo arquitectonica:

- Desacoplar entrada inicial.
- Reservar una feature `portal` cuando haya flujo aprobado.
- Mantener `Mi Sendero` como destino, no como arranque absoluto.
- Permitir transicion narrativa como pantalla o estado intermedio sin acoplarla a persistencia.

### Realidad Aumentada

No hay dependencias ni permisos AR. La resolucion vigente establece que AR es parte obligatoria del Portal y usara camara/anclaje espacial, pero no se recomienda agregar dependencias todavia.

Preparacion conceptual:

- Definir una capa futura de capacidades, no una dependencia inmediata.
- Relacionar AR con consentimiento antes de cualquier acceso a camara/sensores.
- Mantener assets y modelos 3D bajo reglas de manifiesto.
- Evitar que AR controle el dominio de Sendero, Huellas o Atelier.
- Resolver proveedor, plugin, persistencia tecnica y recuperacion antes de implementar.

## 14. Arquitectura objetivo propuesta

Arbol propuesto como direccion, no como checklist inmediato:

```text
lib/src/
  core/
  shared/
  features/
    guardian/
      data/
      domain/
      presentation/
    portal/
    journey/
    footprints/
    community/
    library/
    gallery/
    atelier/
    reconnection/
    wallet/
    characters/
```

### Necesario en la primera reorganizacion

- `core/app`: bootstrap de app y punto unico de seleccion inicial.
- `shared/theme`: `VinsaghColors`, `VinsaghSpacing`, `VinsaghRadii`, `VinsaghTheme`.
- `features/journey/presentation`: Mi Sendero como experiencia visual actual.
- `features/reconnection/presentation`: card actual de Reconexion.
- `features/wallet/presentation`: card actual de Cartera.
- `features/gallery/presentation`: card actual de Galeria de Samara.
- `features/atelier/presentation`: card actual de Atelier.
- `features/characters/presentation`: panel actual Compi/Lumi.

### Reservado para fases posteriores

- `features/guardian/domain` y `features/guardian/data`: esperar perfil, esencia, preferencias y consentimiento.
- `features/portal`: flujo Primer Vinculo -> Portal -> transicion resuelto conceptualmente; implementacion reservada.
- `features/footprints`: esperar propiedad de Huellas, Impacto y progreso.
- `features/community`: no hay UI ni flujo actual.
- `features/library`: aparece en sidebar, pero sin pantalla ni contenido.
- `data/` en cualquier feature: no crear hasta aprobar persistencia.
- AR: no crear estructura tecnica hasta decidir proveedor, permisos y alcance.

### Responsabilidades de `core`

- Bootstrap de app.
- Configuracion global no visual.
- Punto de entrada y seleccion inicial.
- Abstracciones transversales estables, si son necesarias.
- Contratos de error/resultado solo cuando aparezcan servicios reales.

No debe contener reglas de negocio de Guardian, Wallet, Galeria, Atelier o Reconexion.

### Responsabilidades de `shared`

- Tema visual y tokens.
- Componentes UI verdaderamente reutilizables.
- Helpers responsive compartidos.
- Tipos de presentacion reutilizables que no pertenezcan a una feature.

No debe contener copy narrativo especifico ni datos de dominio.

### Responsabilidades por feature

- `journey`: composicion de Mi Sendero y experiencia principal visible.
- `guardian`: identidad, perfil progresivo, esencia, preferencias y consentimiento cuando se aprueben.
- `portal`: entrada inicial y transicion narrativa del flujo Primer Vinculo -> Portal -> Mi Sendero, sin implementacion todavia.
- `footprints`: Huellas, impacto y progreso si Direccion confirma esa propiedad.
- `gallery`: Galeria de Samara como espacio de descubrimiento de piezas; taxonomia tecnica pendiente.
- `atelier`: espacio creativo vinculado al recorrido del Guardian; reglas tecnicas pendientes.
- `reconnection`: flujo de economia real para vincular una pieza.
- `wallet`: economia interna y reconocimiento V.S. Coins; no debe acoplarse a Reconexion.
- `characters`: Compi y Lumi como personajes principales canonicos de la IP; relacion con Vin/Sagh pendiente.
- `community` y `library`: reservadas; no necesarias ahora.

## 15. Mapa de migracion incremental

1. Congelar el comportamiento visual actual con el test existente y, si se autoriza en otra fase, agregar pruebas de widget por card.
2. Crear solo carpetas necesarias para mover codigo existente, sin `data/` ni `domain/` vacios.
3. Migrar tema a `shared/theme` sin cambiar valores.
4. Mover Mi Sendero desde `features/home` a `features/journey/presentation` o nombre aprobado, manteniendo el render identico.
5. Extraer cards visibles a features de presentacion solo cuando el diff sea mecanico y verificable.
6. Desacoplar `LumeaSidebar` para recibir items desde configuracion, sin activar rutas nuevas.
7. Reemplazar `MaterialApp.home` por un punto de entrada preparado para Portal, todavia apuntando a Mi Sendero hasta que Portal exista.
8. Marcar el dashboard tecnico como legacy y retirarlo en una fase separada, sin mezclar con cambios visuales.
9. Definir modelos de dominio solo despues de decisiones creativas y de persistencia.
10. Introducir repositorios/adapters solo cuando exista backend/local storage aprobado.

## 16. Orden recomendado de fases

1. PLAN-001: auditoria actual. Este documento.
2. PLAN-002: reorganizacion no funcional de tema, app shell y Mi Sendero.
3. PLAN-003: desacoplamiento de navegacion visual y route descriptors.
4. PLAN-004: separacion de features de presentacion actuales.
5. PLAN-005: decisiones creativas restantes, consentimiento, privacidad y taxonomias.
6. PLAN-006: contratos de dominio minimos aprobados.
7. PLAN-007: persistencia y consentimiento.
8. PLAN-008: Portal y transicion narrativa.
9. PLAN-009: economia, Huellas, progreso e impacto.
10. PLAN-010: AR solo si hay proveedor, permisos, assets y experiencia aprobados.

## 17. Elementos fuera de alcance

Fuera de alcance de esta auditoria y de la siguiente reorganizacion inmediata:

- Crear modelos Dart.
- Crear carpetas futuras vacias para simular avance.
- Implementar Portal.
- Implementar transicion narrativa.
- Implementar AR.
- Implementar persistencia.
- Implementar Firebase en Flutter.
- Implementar Flame.
- Implementar navegacion funcional profunda.
- Cambiar el diseno visual APP-009.
- Cambiar `pubspec.yaml`.
- Cambiar tests.
- Cambiar `docs/00_canon`.
- Crear assets reales.
- Crear economia productiva.
- Crear sistema de personajes.
- Crear Comunidad o Biblioteca.

## 18. Matriz de decisiones de Direccion Creativa

Esta matriz actualiza las decisiones creativas posteriores a la auditoria. "Paquete de produccion propietario" identifica la responsabilidad funcional para planificacion; no autoriza crear carpetas, modelos ni codigo en esta fase.

| Decision | Estado | Resolucion vigente | Paquete de produccion propietario |
| --- | --- | --- | --- |
| Termino principal del usuario | RESUELTA | El termino principal es `Guardian`. | `features/guardian` |
| Rol de Mi Sendero | RESUELTA | `Mi Sendero` no es Home tradicional; es el destino de recorrido del Guardian. | `features/journey` |
| Acceso futuro | RESUELTA | El acceso futuro sigue: Primer Vinculo -> Portal -> transicion -> Mi Sendero. | `features/portal` y `features/journey` |
| Naturaleza de Compi y Lumi | RESUELTA | Compi y Lumi son personajes principales y canonicos de la IP. | `features/characters` |
| Funcion de Compi | RESUELTA | Compi impulsa la exploracion. | `features/characters` |
| Funcion de Lumi | RESUELTA | Lumi sensibiliza despues de una experiencia. | `features/characters` |
| Galeria de Samara | RESUELTA | Es un espacio de descubrimiento de piezas. | `features/gallery` |
| Atelier | RESUELTA | Es un espacio creativo vinculado al recorrido del Guardian. | `features/atelier` |
| Reconexion | RESUELTA | Es el flujo de economia real para vincular una pieza. | `features/reconnection` |
| V.S. Coins | RESUELTA | Son reconocimiento interno; no son dinero ni puntos. | `features/wallet` |
| Primera Huella | RESUELTA | Ocurre al recibir la primera pieza y reconocer el Monograma VS. | `features/footprints` con relacion a `features/atelier` |
| Realidad Aumentada | PARCIALMENTE RESUELTA | Es parte obligatoria del Portal y usara camara/anclaje espacial; proveedor, plugin, persistencia tecnica y recuperacion siguen pendientes. | `features/portal` con soporte futuro de capacidades AR |
| Relacion Compi/Lumi con Vin/Sagh | PENDIENTE | Falta definir relacion canonica, jerarquia narrativa y reglas de aparicion conjunta. | Direccion Creativa / `features/characters` |
| Propiedad de impacto, Huellas y progreso | PENDIENTE | Falta definir propietario definitivo entre `footprints`, `journey`, `guardian` y progreso. | Direccion Creativa / arquitectura |
| Prioridad de Comunidad y Biblioteca | PENDIENTE | Falta definir si entran en el primer ciclo o permanecen reservadas. | `features/community` y `features/library` |
| Consentimiento y privacidad | PENDIENTE | Falta definir modelo exacto de consentimiento, privacidad, permisos y perfil progresivo. | `core/privacy` o propietario futuro aprobado |
| Proveedor y tecnologia AR | PENDIENTE | Falta seleccionar proveedor, plugin, persistencia tecnica y recuperacion de experiencias AR. | `features/portal` / plataforma AR futura |
| Taxonomia tecnica de piezas, colecciones e inventario | PENDIENTE | Falta cerrar nombres, entidades, relaciones y ownership tecnico. | `features/gallery`, `features/atelier`, `features/reconnection` y propietario de inventario futuro |

## 19. Condiciones arquitectonicas para PLAN-002

PLAN-002 debe mantenerse como reorganizacion no funcional y sin cambio visual. Las condiciones arquitectonicas vigentes son:

- `wallet` pertenece unicamente a economia interna.
- Reconexion pertenece a economia real.
- No acoplar Reconexion a V.S. Coins.
- `FirstFootprint` se vincula al reconocimiento del Monograma VS.
- Portal no se implementa todavia.
- El app shell debe quedar preparado para seleccionar un estado inicial.
- Mi Sendero continua siendo el destino temporal mientras Portal no exista.
- No crear `data/`, `domain` ni modelos en PLAN-002.
- Preservar visualmente APP-009.

## 20. Jerarquia economica oficial

La jerarquia economica oficial queda registrada asi:

```text
Experiencia
  -> Emocion
    -> Reflexion
      -> Huella
        -> Impacto
          -> V.S. Coins
```

Esta jerarquia ubica V.S. Coins como reconocimiento interno derivado del recorrido, no como dinero, puntos, saldo monetario ni mecanismo de Reconexion.

## 21. Capas oficiales

| Capa | Responsabilidad |
| --- | --- |
| Emocional | Ordena la sensacion, pertenencia, calma, reconocimiento y respuesta del Guardian. |
| Narrativa | Ordena Primer Vinculo, Portal, transiciones, personajes, piezas, Monograma VS y continuidad del universo. |
| Economia interna | Ordena reconocimiento, V.S. Coins, recompensas internas y lectura de avance sin valor monetario. |
| Economia real | Ordena Reconexion y vinculacion real de piezas; no depende de V.S. Coins. |

## 22. Revision preliminar de modelos futuros

Esta seccion no autoriza crear clases. Solo ubica riesgos y propietarios preliminares.

| Modelo | Dominio propietario preliminar | Responsabilidad | Relaciones preliminares | Riesgos / validacion |
| --- | --- | --- | --- | --- |
| `GuardianProfile` | `guardian` | Identidad progresiva del Guardian | `GuardianEssence`, `GuardianPreferences`, `Consent`, `GuardianProgress` | `Guardian` queda resuelto como termino principal; no duplicar `ve_profiles`. |
| `GuardianEssence` | `guardian` | Rasgos narrativos o esencia personal | Perfil, preferencias, monograma | Alto riesgo creativo; no deberia existir aun. |
| `GuardianPreferences` | `guardian` | Preferencias de experiencia/comunicacion | Perfil, consentimiento | Separar preferencias de consentimiento legal. |
| `GuardianImpact` | `footprints` o `guardian` | Agregado de impacto | Huellas, progreso, metricas | Riesgo de duplicar `impactScore` y `ImpactCard`. |
| `GuardianFootprints` | `footprints` | Coleccion de Huellas del Guardian | `FirstFootprint`, progreso, impacto | Validar propiedad entre Sendero/Huellas/Impacto. |
| `GuardianProgress` | `journey` o `guardian` | Hitos y avance | Perfil, Huellas, recompensas | Riesgo de duplicar `ve_progress` y `RewardHistory`. |
| `SharedJourney` | `journey` o `community` | Experiencia compartida | Guardianes, Comunidad, Senderos | No deberia existir aun sin reglas sociales. |
| `Consent` | `guardian` o `core/privacy` | Permisos y aceptaciones | Perfil, AR, persistencia, preferencias | Necesario antes de datos sensibles, pero no como stub prematuro. |
| `GuardianWallet` | `wallet` | Estado de reconocimiento interno | `VSCoins`, `RewardHistory` si se aprueba | No debe representar economia real ni Reconexion. |
| `VSCoins` | `wallet` | Reconocimiento interno no monetario y no equivalente a puntos | Wallet, avance, recompensas internas | Concepto creativo resuelto; forma tecnica pendiente y probablemente value object, no entidad. |
| `Collection` | `gallery` | Agrupacion de piezas | `Piece`, `GalleryItem` | Nombre demasiado generico; validar `SamaraCollection`. |
| `Piece` | `gallery`, `atelier` o `inventory` | Pieza fisica/digital | Coleccion, inventario, assets | Nombre generico; riesgo de duplicar GalleryItem. |
| `Reconnection` | `reconnection` | Flujo de economia real para vincular una pieza | Pieza, Guardian, Portal o Journey segun fase | No acoplar a V.S. Coins; persistencia y contrato pendientes. |
| `AtelierDesign` | `atelier` | Configuracion de diseno | Monogram, Piece, FirstFootprint | No crear antes de reglas del Atelier. |
| `GalleryItem` | `gallery` | Item presentable en Galeria | Collection, Piece, asset manifest | Puede duplicar `Piece`; definir diferencia. |
| `Monogram` | `atelier` o `guardian` | Marca/simbolo personal | GuardianEssence, AtelierDesign | Alto riesgo canonico; no deberia existir aun. |
| `FirstFootprint` | `footprints` o `journey` | Primera Huella al recibir la primera pieza y reconocer el Monograma VS | GuardianFootprints, Progress, Monogram | Concepto resuelto; propietario definitivo de Huellas/progreso pendiente. |
| `Inventory` | `wallet` o `gallery` | Posesion de piezas/recompensas | Wallet, Piece, Collection | No deberia existir aun; riesgo de acercarse a tienda/closet. |
| `RewardHistory` | `wallet` o `progress` | Historial de recompensas | Wallet, Progress, events | Riesgo de duplicar eventos y `ve_rewards`. |

Modelos que no deberian existir todavia: `GuardianEssence`, `SharedJourney`, `VSCoins`, `Collection`, `Piece`, `AtelierDesign`, `GalleryItem`, `Monogram`, `FirstFootprint`, `Inventory`, `RewardHistory`. Algunos conceptos ya tienen resolucion creativa parcial o completa, pero crear clases ahora fijaria contratos, persistencia y relaciones tecnicas antes de PLAN-002.

## 23. Evaluacion por sistema futuro solicitado

| Sistema | Estado actual | Preparacion recomendada |
| --- | --- | --- |
| Primer Vinculo | No existe en codigo | Flujo de acceso resuelto conceptualmente; no implementar en PLAN-002. |
| Portal | No existe | Desacoplar entrada inicial; preparar app shell sin implementar Portal. |
| AR | No existe | Obligatoria para Portal con camara/anclaje espacial; proveedor y tecnologia pendientes. |
| Esencia del Guardian | Solo copy de Guardian | Requiere decision creativa especifica antes de dominio. |
| Perfil progresivo | No existe | Requiere consentimiento y modelo minimo aprobado. |
| Senderos | Mi Sendero visual existe | Conservar visual y migrar a `journey`. |
| Huellas | Aparece en copy/sidebar | Primera Huella queda vinculada a pieza y Monograma VS; ownership de Huellas/progreso pendiente. |
| Florecimiento | No existe | Reservado; no implementar. |
| Comunidad | No existe | Reservado. |
| Biblioteca | Solo item en sidebar | Reservado hasta contenido. |
| Economia interna | Wallet visual existe | V.S. Coins son reconocimiento interno; separar de economia real. |
| Galeria de Samara | Card visual existe | Espacio de descubrimiento de piezas; separar presentacion y validar taxonomia tecnica. |
| Atelier | Card visual existe | Espacio creativo vinculado al recorrido; separar presentacion y validar reglas tecnicas. |
| Reconexion | Card visual existe | Flujo de economia real para vincular una pieza; separar de wallet/V.S. Coins. |

## 24. Recomendacion final

**GO CON CONDICIONES** para iniciar la reorganizacion arquitectonica.

Condiciones obligatorias:

- La primera fase de reorganizacion debe ser no funcional y sin cambio visual.
- No crear `data/` ni `domain/` vacios.
- No agregar dependencias.
- No crear modelos futuros hasta resolver contratos, persistencia y propietarios restantes.
- No tocar `docs/00_canon`.
- Preservar APP-008 y APP-009 como base tecnica/visual.
- Mantener pruebas existentes y ampliarlas solo cuando una fase lo autorice.
- Tratar la documentacion previa de Agente/Vin/Sagh como antecedente; `Guardian`, Compi y Lumi ya tienen resolucion vigente, pero la relacion con Vin/Sagh sigue pendiente.

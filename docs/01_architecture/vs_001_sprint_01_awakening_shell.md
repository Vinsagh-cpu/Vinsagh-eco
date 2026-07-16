# VS-001 Sprint 01 - Awakening Shell

## Proposito

Crear el shell tecnico interno de `VS-001` para validar una maquina de estados
en memoria, semantica inicial, teclado, foco y reduccion de movimiento sin
conectar la experiencia al flujo publico de la app.

Este sprint no crea un prototipo visual creativo ni una experiencia revisable
de Huella, Compi corporal, Portal, AR, autorizacion, biometria o Lumi.

## Alcance implementado

- Feature interna aislada en `apps/mobile_flutter/lib/src/features/awakening/`.
- Shell tecnico de presentacion en `presentation/awakening_shell.dart`.
- Controlador de presentacion en memoria en
  `presentation/controller/awakening_flow_controller.dart`.
- Enum de estados en `presentation/controller/awakening_stage.dart`.
- Tests de controlador, shell y regresion de entrada publica.

No se modificaron `main.dart`, `LumeaAppEntry`, `MiSenderoScreen`,
`pubspec.yaml`, assets ni `docs/00_canon`.

## Estructura creada

```text
apps/mobile_flutter/lib/src/features/awakening/
  presentation/
    awakening_shell.dart
    controller/
      awakening_stage.dart
      awakening_flow_controller.dart
```

No se crearon carpetas `data/`, `domain/`, `repositories/`, `services/` ni
`assets/`.

## Estados

El enum `AwakeningStage` define estos estados conceptuales:

- `initialDarkness`
- `footprintVisible`
- `invitationVisible`
- `authorizationRequested`
- `authorizationAuthorized`
- `authorizationCancelled`
- `authorizationUnavailable`
- `authorizationRecoverableError`
- `accessibleAlternative`
- `awakeningInProgress`
- `compiArrival`
- `firstBondInProgress`
- `initialAffinity`
- `firstBondCompleted`
- `portalPending`
- `completed`

`footprintVisible` existe solo como estado conceptual. No hay Huella visible,
simbolo, monograma, icono ni placeholder visual.

`compiArrival` existe solo como estado conceptual. No hay cuerpo, silueta,
avatar, emoji, mascota, imagen, ilustracion ni placeholder corporal.

## Transiciones

Flujo principal:

```text
initialDarkness
-> footprintVisible
-> invitationVisible
-> authorizationRequested
-> authorizationAuthorized
-> awakeningInProgress
-> compiArrival
-> firstBondInProgress
-> initialAffinity
-> firstBondCompleted
-> portalPending
-> completed
```

Recuperacion:

```text
authorizationRequested
-> authorizationCancelled
-> invitationVisible o accessibleAlternative

authorizationRequested
-> authorizationUnavailable
-> accessibleAlternative o invitationVisible

authorizationRequested
-> authorizationRecoverableError
-> invitationVisible o accessibleAlternative

invitationVisible
-> accessibleAlternative
-> awakeningInProgress
```

El controlador expone `validNextStages`, `canTransitionTo`, `transitionTo`,
`advance`, eventos internos de resultado de autorizacion y `reset`.
Las transiciones invalidas se rechazan sin cambiar el estado.

## Estado en memoria

El estado vive solo en la instancia de `AwakeningFlowController`. No hay
almacenamiento local, `shared_preferences`, `localStorage`, Firebase, backend,
servicios externos, hardware, camara, permisos ni biometria.

Crear un nuevo controlador reinicia el flujo en `initialDarkness`.
`reset()` reinicia la escena a `initialDarkness` sin persistir nada fuera de la
sesion actual.

## Reduccion de movimiento

`reduceMotion` es una preferencia en memoria con valor inicial explicito
`false`. Puede cambiarse durante la sesion desde el controlador o desde el
shell. No se lee todavia la configuracion del dispositivo y no se persiste.

El shell no depende de animaciones para cambiar de escena. Las pruebas avanzan
con `reduceMotion` activado.

## Accesibilidad inicial

El shell incorpora:

- Raiz `Semantics` identificable.
- Estados identificables por texto tecnico numerico.
- Controles reales de Flutter alcanzables por teclado.
- `FocusTraversalGroup` con orden numerico estable.
- Atajos de teclado para continuar con Enter o Space.
- Ruta alternativa accesible cuando la transicion esta permitida.
- Ausencia de temporizadores bloqueantes.

Esta base no cierra la accesibilidad final de `VS-001`; solo deja soporte
tecnico verificable para el sprint interno.

## Pruebas

Se agregaron pruebas para:

- Estado inicial `initialDarkness`.
- Recorrido principal completo.
- Rechazo de transicion invalida.
- Cancelacion y retorno seguro.
- No disponibilidad y ruta alternativa.
- Error recuperable con reintento o alternativa.
- Reinicio del controlador.
- Preferencia `reduceMotion` en memoria.
- Semantica raiz del shell.
- Activacion y foco por teclado.
- Ausencia de persistencia, hardware, backend y assets dentro de la feature.
- Ausencia de textos o elementos que impliquen biometria real.
- Ausencia de Lumi en el shell.
- Ausencia de representacion corporal de Compi.
- Ausencia de Huella visual reconocible.
- Regresion de entrada publica: `VinsaghEcoApp` sigue mostrando
  `MiSenderoScreen` y no monta `AwakeningShell`.

El test existente de APP-009 se mantiene en `test/widget_test.dart`.

## Integracion

`AwakeningShell` no esta conectado a `LumeaAppEntry`.

La entrada publica sigue siendo:

```text
main.dart
  -> VinsaghEcoApp
    -> LumeaAppEntry
      -> MiSenderoScreen
```

APP-009 permanece intacta como experiencia visible de `Mi Sendero`.

## Bloqueado para Sprint 02

- Tratamiento visual aprobado de Huella.
- Cualquier placeholder visual de Huella.
- Representacion visual o corporal de Compi.
- Prototipo visual creativo revisable.
- Autorizacion simulada funcional.
- Primer Vinculo funcional.
- Afinidad funcional.
- Portal.
- AR.
- Persistencia.
- Sonido.
- Lumi.

## Fuera de alcance

- Modificar el diseno de Mi Sendero.
- Conectar el shell al flujo publico.
- Agregar router, feature flags o entrada temporal.
- Agregar dependencias.
- Modificar `pubspec.yaml`.
- Crear assets.
- Acceder a hardware.
- Implementar biometria real.
- Implementar autorizacion simulada funcional.
- Implementar Firebase, backend o persistencia.
- Crear `data/` o `domain/`.
- Modificar `docs/00_canon`.

## Validaciones ejecutadas

- `flutter pub get`: OK. No se modifico `pubspec.yaml` ni se agregaron
  dependencias.
- `dart format lib test`: OK.
- `flutter analyze`: OK, sin issues.
- `flutter test`: OK, todos los tests pasan, incluido APP-009.
- `flutter build web`: OK.
- `git diff --check`: OK.
- `git status --short`: OK, cambios limitados al alcance autorizado.
- `git diff --stat`: OK, usado para revisar el alcance del cambio antes del
  commit.

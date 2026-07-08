# ENV-001 - Pending Android Setup

## Proposito

Documentar lo que falta en Android para que no se mezcle con el arranque web de INIT-002.

## Elementos pendientes

- `cmdline-tools` component missing.
- Android license status unknown.
- Android toolchain no completada.

## Riesgos si se intenta Android antes de configurarlo

- `flutter doctor` seguira mostrando advertencias.
- `flutter run` puede quedar limitado a dispositivos no preparados.
- Se pierde tiempo resolviendo un entorno que no es la prioridad inmediata.
- Se puede mezclar la configuracion tecnica con el aprendizaje de Flutter basico.
- Se puede retrasar la primera validacion web que si esta lista para arrancar.

## Decision tecnica

Android no bloquea INIT-002 si la primera meta es Chrome/web.

Debe quedar pendiente para una fase posterior, cuando ya exista base tecnica mas estable y se decida trabajar multiplataforma.

## Visual Studio

Visual Studio para Windows apps tambien queda pendiente, pero no bloquea INIT-002 web.

En este momento no es necesario detener la ruta de aprendizaje por no tener instalacion de Windows desktop.

## Regla operativa

No tocar Android ahora salvo que una instruccion posterior lo pida de forma expresa.

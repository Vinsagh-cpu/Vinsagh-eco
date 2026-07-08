# ENV-001 - Next steps for INIT-002

## Proposito

Definir la ruta inmediata para pasar de ENV-001 a INIT-002 sin abrir demasiados frentes a la vez.

## Decision operativa

Avanzar a INIT-002 usando Chrome/web como primer objetivo de prueba.

## Checklist antes de INIT-002

- Confirmar que Flutter responde en Git Bash.
- Confirmar que Chrome esta disponible.
- Confirmar que el dispositivo web esta listo.
- Confirmar que Git status esta limpio antes de tocar nada.
- Confirmar que Android sigue fuera del alcance inmediato.
- Confirmar que Visual Studio no bloquea el arranque web.
- Confirmar que no se va a tocar Firebase.
- Confirmar que no se va a tocar `docs/00_canon/`.

## Ruta recomendada

1. Revisar el estado actual del entorno.
2. Elegir Chrome/web como primer objetivo.
3. Entrar a INIT-002 con una meta minima.
4. Mantener el cambio tecnico pequeno y verificable.
5. Solo despues evaluar Android.

## Regla de seguridad

No tocar Firebase ni Android todavia.

La prioridad es validar la primera ruta web controlada, no abrir una implementacion multiplataforma completa.

## Resultado esperado

Cuando INIT-002 empiece, el equipo ya debera saber que:

- Flutter funciona en Windows.
- Chrome/web sera la primera superficie de prueba.
- Android queda pendiente.
- Visual Studio no bloquea la ruta inicial.
- El siguiente paso debe ser pequeno y guiado.

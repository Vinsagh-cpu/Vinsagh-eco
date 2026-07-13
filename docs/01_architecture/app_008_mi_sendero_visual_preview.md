# APP-008 · Mi Sendero visual preview

## Propósito

Preparar una primera pantalla visual de prueba para Lumea dentro de la app Flutter Web de Vinsagh Eco Studios.

Este entregable cambia el enfoque de placeholder técnico hacia una experiencia visual inicial que permita comenzar pruebas antes del 15, sin integrar todavía lógica real, Firebase, Flame, assets reales ni navegación compleja.

## Alcance

Se implementa una vista visual inicial llamada Mi Sendero, basada en el brief de Lumea y en el lenguaje de Guardianes.

## Archivos modificados o creados

- apps/mobile_flutter/lib/src/features/home/
- apps/mobile_flutter/lib/src/theme/vinsagh_colors.dart
- apps/mobile_flutter/lib/src/vinsagh_eco_app.dart
- apps/mobile_flutter/test/widget_test.dart
- docs/01_architecture/app_008_mi_sendero_visual_preview.md

## Decisión técnica

Se crea una estructura de feature visual en `features/home/` para aislar la experiencia de Mi Sendero y permitir que el desarrollo visual avance sin contaminar módulos técnicos previos.

## Componentes visuales implementados

- Mi Sendero
- Encabezado del Guardián
- Sidebar Lumea
- Mi Cartera con V.S. Coins
- Reconexión Disponible
- Galería de Samara
- Atelier
- Mi Impacto
- Panel Compi/Lumi

## Qué se puede probar

- Primera impresión visual de Lumea.
- Jerarquía de cards.
- Lenguaje de Guardián.
- Sensación de experiencia premium, sostenible y cálida.
- Responsive básico en Flutter Web.
- Presencia de los módulos visuales principales.

## Qué no se implementó todavía

- Firebase.
- Flame.
- Assets reales.
- Login.
- Checkout.
- Carrito.
- Rutas profundas.
- Navegación funcional real.
- Persistencia de datos.
- Lógica de juego.
- Experiencia final de Primera Travesía.

## Validaciones ejecutadas

- flutter pub get
- flutter analyze
- flutter test
- flutter build web

## Próximo paso recomendado

APP-009 · Ajuste visual y prueba navegable de Mi Sendero

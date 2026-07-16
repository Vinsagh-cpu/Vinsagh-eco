import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vinsagh_eco_mobile/src/features/awakening/presentation/awakening_shell.dart';
import 'package:vinsagh_eco_mobile/src/features/awakening/presentation/controller/awakening_flow_controller.dart';
import 'package:vinsagh_eco_mobile/src/features/awakening/presentation/controller/awakening_stage.dart';

void main() {
  testWidgets('exposes an identifiable root semantics node', (tester) async {
    final semanticsHandle = tester.ensureSemantics();

    await tester.pumpWidget(const MaterialApp(home: AwakeningShell()));

    expect(find.byKey(AwakeningShellKeys.root), findsOneWidget);
    final semantics = tester.getSemantics(find.byKey(AwakeningShellKeys.root));

    expect(semantics.label, 'VS-001 internal awakening shell');
    semanticsHandle.dispose();
  });

  testWidgets('can continue by keyboard without waiting for animation', (
    tester,
  ) async {
    final controller = AwakeningFlowController(reduceMotion: true);

    await tester.pumpWidget(
      MaterialApp(home: AwakeningShell(controller: controller)),
    );
    await tester.pump();

    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pump();

    expect(controller.stage, AwakeningStage.footprintVisible);

    await tester.sendKeyEvent(LogicalKeyboardKey.space);
    await tester.pump();

    expect(controller.stage, AwakeningStage.invitationVisible);
  });

  testWidgets('keeps a stable focus order for controls', (tester) async {
    final controller = AwakeningFlowController();

    controller.transitionTo(AwakeningStage.footprintVisible);
    controller.transitionTo(AwakeningStage.invitationVisible);

    await tester.pumpWidget(
      MaterialApp(home: AwakeningShell(controller: controller)),
    );

    await tester.sendKeyEvent(LogicalKeyboardKey.tab);
    await tester.pump();

    expect(
      Focus.of(
        tester.element(find.byKey(AwakeningShellKeys.continueButton)),
      ).hasFocus,
      isTrue,
    );

    await tester.sendKeyEvent(LogicalKeyboardKey.tab);
    await tester.pump();

    expect(
      Focus.of(
        tester.element(find.byKey(AwakeningShellKeys.alternativeButton)),
      ).hasFocus,
      isTrue,
    );

    await tester.sendKeyEvent(LogicalKeyboardKey.tab);
    await tester.pump();

    expect(
      Focus.of(
        tester.element(find.byKey(AwakeningShellKeys.reduceMotionToggle)),
      ).hasFocus,
      isTrue,
    );
  });

  testWidgets('updates reduceMotion during the session', (tester) async {
    final controller = AwakeningFlowController();

    await tester.pumpWidget(
      MaterialApp(home: AwakeningShell(controller: controller)),
    );

    expect(controller.reduceMotion, isFalse);

    await tester.tap(find.byKey(AwakeningShellKeys.reduceMotionToggle));
    await tester.pump();

    expect(controller.reduceMotion, isTrue);
  });

  testWidgets('does not expose blocked narrative or visual elements', (
    tester,
  ) async {
    final controller = AwakeningFlowController();

    await tester.pumpWidget(
      MaterialApp(home: AwakeningShell(controller: controller)),
    );

    final renderedTexts = <String>[];

    for (var i = 0; i < AwakeningStage.values.length; i += 1) {
      renderedTexts.add(_visibleText(tester).toLowerCase());
      controller.advance();
      await tester.pump();
    }

    final allRenderedText = renderedTexts.join(' ');
    const forbiddenText = <String>[
      'lumi',
      'biometr',
      'huella',
      'fingerprint',
      'face id',
      'touch id',
      'sensor',
      'avatar',
      'silueta',
      'mascota',
      'emoji',
      'cuerpo',
      'ilustracion',
      'imagen',
      'monograma',
    ];

    for (final text in forbiddenText) {
      expect(allRenderedText, isNot(contains(text)));
    }

    expect(find.byType(Image), findsNothing);
    expect(find.byType(Icon), findsNothing);
    expect(find.byType(Placeholder), findsNothing);
  });
}

String _visibleText(WidgetTester tester) {
  return find
      .byType(Text)
      .evaluate()
      .map((element) => element.widget as Text)
      .map((widget) => widget.data ?? widget.textSpan?.toPlainText() ?? '')
      .join(' ');
}

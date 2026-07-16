import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:vinsagh_eco_mobile/src/features/awakening/presentation/controller/awakening_flow_controller.dart';
import 'package:vinsagh_eco_mobile/src/features/awakening/presentation/controller/awakening_stage.dart';

void main() {
  group('AwakeningFlowController', () {
    test('starts in initialDarkness with explicit reduceMotion value', () {
      final controller = AwakeningFlowController();

      expect(controller.stage, AwakeningStage.initialDarkness);
      expect(controller.reduceMotion, isFalse);
      expect(controller.validNextStages, {AwakeningStage.footprintVisible});
    });

    test('completes the approved main route in memory', () {
      final controller = AwakeningFlowController();
      final mainRoute = <AwakeningStage>[
        AwakeningStage.footprintVisible,
        AwakeningStage.invitationVisible,
        AwakeningStage.authorizationRequested,
        AwakeningStage.authorizationAuthorized,
        AwakeningStage.awakeningInProgress,
        AwakeningStage.compiArrival,
        AwakeningStage.firstBondInProgress,
        AwakeningStage.initialAffinity,
        AwakeningStage.firstBondCompleted,
        AwakeningStage.portalPending,
        AwakeningStage.completed,
      ];

      for (final stage in mainRoute) {
        expect(controller.transitionTo(stage), isTrue);
        expect(controller.stage, stage);
      }

      expect(controller.validNextStages, isEmpty);
      expect(controller.advance(), isFalse);
    });

    test('rejects invalid transitions without changing state', () {
      final controller = AwakeningFlowController();

      expect(controller.transitionTo(AwakeningStage.completed), isFalse);
      expect(controller.stage, AwakeningStage.initialDarkness);
    });

    test('supports cancellation and safe return to invitation', () {
      final controller = _authorizationRequestedController();

      expect(controller.markAuthorizationCancelled(), isTrue);
      expect(controller.stage, AwakeningStage.authorizationCancelled);
      expect(controller.validNextStages, {
        AwakeningStage.invitationVisible,
        AwakeningStage.accessibleAlternative,
      });
      expect(controller.transitionTo(AwakeningStage.invitationVisible), isTrue);
      expect(controller.stage, AwakeningStage.invitationVisible);
    });

    test('supports unavailable result and accessible alternative route', () {
      final controller = _authorizationRequestedController();

      expect(controller.markAuthorizationUnavailable(), isTrue);
      expect(controller.stage, AwakeningStage.authorizationUnavailable);
      expect(
        controller.transitionTo(AwakeningStage.accessibleAlternative),
        isTrue,
      );
      expect(controller.advance(), isTrue);
      expect(controller.stage, AwakeningStage.awakeningInProgress);
    });

    test('supports recoverable error retry or accessible alternative', () {
      final retryController = _authorizationRequestedController();

      expect(retryController.markAuthorizationRecoverableError(), isTrue);
      expect(
        retryController.transitionTo(AwakeningStage.invitationVisible),
        isTrue,
      );
      expect(retryController.stage, AwakeningStage.invitationVisible);

      final alternativeController = _authorizationRequestedController();

      expect(alternativeController.markAuthorizationRecoverableError(), isTrue);
      expect(
        alternativeController.transitionTo(
          AwakeningStage.accessibleAlternative,
        ),
        isTrue,
      );
      expect(alternativeController.stage, AwakeningStage.accessibleAlternative);
    });

    test('resets the flow while keeping the in-session motion preference', () {
      final controller = AwakeningFlowController();

      expect(controller.advance(), isTrue);
      controller.setReduceMotion(true);
      controller.reset();

      expect(controller.stage, AwakeningStage.initialDarkness);
      expect(controller.reduceMotion, isTrue);
    });

    test('keeps reduceMotion only in memory for each controller instance', () {
      final firstController = AwakeningFlowController();

      firstController.setReduceMotion(true);
      expect(firstController.reduceMotion, isTrue);

      final secondController = AwakeningFlowController();

      expect(secondController.stage, AwakeningStage.initialDarkness);
      expect(secondController.reduceMotion, isFalse);
    });

    test('does not contain persistence, hardware, backend, or asset code', () {
      final sourceFiles = Directory('lib/src/features/awakening')
          .listSync(recursive: true)
          .whereType<File>()
          .where((file) => file.path.endsWith('.dart'));
      final source = sourceFiles.map((file) => file.readAsStringSync()).join();

      const forbiddenFragments = <String>[
        'localStorage',
        'shared_preferences',
        'Firebase',
        'firebase',
        'dart:html',
        'dart:io',
        'local_auth',
        'camera',
        'permission',
        'assets/',
      ];

      for (final fragment in forbiddenFragments) {
        expect(source, isNot(contains(fragment)));
      }
    });
  });
}

AwakeningFlowController _authorizationRequestedController() {
  final controller = AwakeningFlowController();

  expect(controller.transitionTo(AwakeningStage.footprintVisible), isTrue);
  expect(controller.transitionTo(AwakeningStage.invitationVisible), isTrue);
  expect(controller.requestAuthorization(), isTrue);

  return controller;
}

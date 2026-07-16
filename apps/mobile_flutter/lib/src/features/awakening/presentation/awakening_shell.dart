import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'controller/awakening_flow_controller.dart';
import 'controller/awakening_stage.dart';

class AwakeningShellKeys {
  const AwakeningShellKeys._();

  static const root = Key('awakening_shell.root');
  static const stageLabel = Key('awakening_shell.stage_label');
  static const stageMarker = Key('awakening_shell.stage_marker');
  static const continueButton = Key('awakening_shell.continue_button');
  static const alternativeButton = Key('awakening_shell.alternative_button');
  static const retryButton = Key('awakening_shell.retry_button');
  static const reduceMotionToggle = Key('awakening_shell.reduce_motion_toggle');
}

class AwakeningShell extends StatefulWidget {
  const AwakeningShell({super.key, this.controller});

  final AwakeningFlowController? controller;

  @override
  State<AwakeningShell> createState() => _AwakeningShellState();
}

class _AwakeningShellState extends State<AwakeningShell> {
  late AwakeningFlowController _controller;
  late bool _ownsController;

  @override
  void initState() {
    super.initState();
    _setController(widget.controller);
  }

  @override
  void didUpdateWidget(covariant AwakeningShell oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      if (_ownsController) {
        _controller.dispose();
      }
      _setController(widget.controller);
    }
  }

  @override
  void dispose() {
    if (_ownsController) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _setController(AwakeningFlowController? controller) {
    _controller = controller ?? AwakeningFlowController();
    _ownsController = controller == null;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Semantics(
          key: AwakeningShellKeys.root,
          container: true,
          explicitChildNodes: true,
          label: 'VS-001 internal awakening shell',
          value: _technicalStateLabel(_controller.stage),
          child: Material(
            child: FocusTraversalGroup(
              policy: OrderedTraversalPolicy(),
              child: Shortcuts(
                shortcuts: const <ShortcutActivator, Intent>{
                  SingleActivator(LogicalKeyboardKey.enter):
                      _ContinueAwakeningIntent(),
                  SingleActivator(LogicalKeyboardKey.space):
                      _ContinueAwakeningIntent(),
                },
                child: Actions(
                  actions: <Type, Action<Intent>>{
                    _ContinueAwakeningIntent:
                        CallbackAction<_ContinueAwakeningIntent>(
                          onInvoke: (intent) {
                            _continue();
                            return null;
                          },
                        ),
                  },
                  child: Focus(
                    autofocus: true,
                    child: SafeArea(
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 480),
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  'VS-001 internal shell',
                                  style: Theme.of(context).textTheme.titleLarge,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  _technicalStateLabel(_controller.stage),
                                  key: AwakeningShellKeys.stageLabel,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  key: AwakeningShellKeys.stageMarker,
                                  width: 0,
                                  height: 0,
                                ),
                                const SizedBox(height: 24),
                                ..._buildActions(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _buildActions() {
    final widgets = <Widget>[];

    if (_controller.stage != AwakeningStage.completed) {
      widgets.add(
        FocusTraversalOrder(
          order: const NumericFocusOrder(1),
          child: FilledButton(
            key: AwakeningShellKeys.continueButton,
            autofocus: true,
            onPressed: _continue,
            child: const Text('Continuar'),
          ),
        ),
      );
      widgets.add(const SizedBox(height: 8));
    }

    if (_controller.canTransitionTo(AwakeningStage.accessibleAlternative)) {
      widgets.add(
        FocusTraversalOrder(
          order: const NumericFocusOrder(2),
          child: OutlinedButton(
            key: AwakeningShellKeys.alternativeButton,
            onPressed: () {
              _controller.transitionTo(AwakeningStage.accessibleAlternative);
            },
            child: const Text('Continuar de otra forma'),
          ),
        ),
      );
      widgets.add(const SizedBox(height: 8));
    }

    if (_controller.canTransitionTo(AwakeningStage.invitationVisible)) {
      widgets.add(
        FocusTraversalOrder(
          order: const NumericFocusOrder(3),
          child: OutlinedButton(
            key: AwakeningShellKeys.retryButton,
            onPressed: () {
              _controller.transitionTo(AwakeningStage.invitationVisible);
            },
            child: const Text('Reintentar'),
          ),
        ),
      );
      widgets.add(const SizedBox(height: 8));
    }

    widgets.add(
      FocusTraversalOrder(
        order: const NumericFocusOrder(4),
        child: Semantics(
          button: true,
          toggled: _controller.reduceMotion,
          child: CheckboxListTile(
            key: AwakeningShellKeys.reduceMotionToggle,
            value: _controller.reduceMotion,
            onChanged: (value) {
              _controller.setReduceMotion(value ?? false);
            },
            title: const Text('Reducir movimiento'),
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
          ),
        ),
      ),
    );

    return widgets;
  }

  void _continue() {
    _controller.advance();
  }

  String _technicalStateLabel(AwakeningStage stage) {
    final number = stage.index + 1;
    final total = AwakeningStage.values.length;
    return 'Estado tecnico $number de $total';
  }
}

class _ContinueAwakeningIntent extends Intent {
  const _ContinueAwakeningIntent();
}

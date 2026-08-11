import 'package:flutter/material.dart';

import '../../experience/first_encounter/presentation/light/internal_light_preview_access.dart';
import '../../experience/first_encounter/presentation/orchestration/first_encounter_orchestrator_presentation_adapter.dart';

class LumeaAppEntry extends StatelessWidget {
  const LumeaAppEntry({
    super.key,
    this.internalPreviewAccessEnabled = const bool.fromEnvironment(
      'LUMEA_ENABLE_INTERNAL_PREVIEW',
    ),
  });

  final bool internalPreviewAccessEnabled;

  @override
  Widget build(BuildContext context) {
    return InternalLightPreviewAccess(
      enabled: internalPreviewAccessEnabled,
      child: FirstEncounterOrchestratorPresentationAdapter(
        debugControlsEnabled: internalPreviewAccessEnabled,
      ),
    );
  }
}

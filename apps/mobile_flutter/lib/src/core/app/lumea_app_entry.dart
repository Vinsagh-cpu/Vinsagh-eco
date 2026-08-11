import 'package:flutter/material.dart';

import '../../experience/first_encounter/presentation/first_encounter_presentation.dart';
import '../../experience/first_encounter/presentation/light/internal_light_preview_access.dart';

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
      child: const FirstEncounterPresentation(),
    );
  }
}

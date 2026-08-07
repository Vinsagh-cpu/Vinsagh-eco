import 'package:flutter/material.dart';

import '../../application/first_encounter_controller.dart';
import 'atmosphere_layer.dart';
import 'background_layer.dart';
import 'eye_layer.dart';
import 'eyelid_layer.dart';
import 'focus_layer.dart';
import 'guardian_silhouette_layer.dart';
import 'light_layer.dart';

class FirstEncounterLayerStack extends StatelessWidget {
  const FirstEncounterLayerStack({super.key, required this.state});

  final FirstEncounterState state;

  @override
  Widget build(BuildContext context) {
    return Stack(
      key: const Key('firstEncounterLayerStack'),
      children: <Widget>[
        Positioned.fill(child: BackgroundLayer(phase: state.phase)),
        Positioned.fill(child: AtmosphereLayer(state: state)),
        Center(
          child: SizedBox(
            width: 280,
            height: 220,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                GuardianSilhouetteLayer(phase: state.phase),
                EyelidLayer(state: state),
                EyeLayer(state: state),
                FocusLayer(state: state),
                LightLayer(state: state),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

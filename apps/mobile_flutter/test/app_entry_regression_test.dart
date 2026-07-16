import 'package:flutter_test/flutter_test.dart';
import 'package:vinsagh_eco_mobile/src/core/app/vinsagh_eco_app.dart';
import 'package:vinsagh_eco_mobile/src/features/awakening/presentation/awakening_shell.dart';
import 'package:vinsagh_eco_mobile/src/features/journey/presentation/mi_sendero_screen.dart';

void main() {
  testWidgets('keeps Mi Sendero as the public app entry', (tester) async {
    await tester.pumpWidget(const VinsaghEcoApp());
    await tester.pumpAndSettle();

    expect(find.byType(MiSenderoScreen), findsOneWidget);
    expect(find.byType(AwakeningShell), findsNothing);
    expect(find.text('Mi Sendero'), findsWidgets);
  });
}

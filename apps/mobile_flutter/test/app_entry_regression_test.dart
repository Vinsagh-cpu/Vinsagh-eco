import 'package:flutter_test/flutter_test.dart';
import 'package:vinsagh_eco_mobile/src/core/app/lumea_app_entry.dart';
import 'package:vinsagh_eco_mobile/src/core/app/vinsagh_eco_app.dart';
import 'package:vinsagh_eco_mobile/src/features/awakening/presentation/awakening_shell.dart';

void main() {
  testWidgets('keeps Lumea as the public app entry', (tester) async {
    await tester.pumpWidget(const VinsaghEcoApp());
    await tester.pumpAndSettle();

    expect(find.byType(LumeaAppEntry), findsOneWidget);
    expect(find.byType(AwakeningShell), findsNothing);
  });
}

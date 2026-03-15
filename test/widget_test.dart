import 'package:flutter_test/flutter_test.dart';
import 'package:solar_pulse_tech/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const SolarPulseApp());

    // Verify that the dashboard is shown.
    expect(find.text('DASHBOARD'), findsWidgets);
  });
}

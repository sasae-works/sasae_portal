import 'package:flutter_test/flutter_test.dart';

import 'package:sasae_portal/main.dart';

void main() {
  testWidgets('app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Sasae Works'), findsWidgets);
    expect(find.textContaining('技術で、日常の'), findsOneWidget);
  });
}

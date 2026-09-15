// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:digitera_task1/core/di/service_locator.dart';
import 'package:digitera_task1/main.dart';

void main() {
  setUpAll(setupServiceLocator);

  testWidgets('Digitera app opens the products screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const DigiteraApp());
    expect(find.text('Digitera Market'), findsOneWidget);
    expect(find.text('Everything you love, in one place'), findsOneWidget);
    await tester.pump(const Duration(milliseconds: 2300));
    await tester.pump();
    expect(find.text('Digitera Market'), findsOneWidget);
  });
}

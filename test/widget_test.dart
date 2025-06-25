import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foton/main.dart';

void main() {
  testWidgets('App has title', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const App());

    final titleFind = find.text("Foton");
    expect(titleFind, findsOneWidget);
  });
}

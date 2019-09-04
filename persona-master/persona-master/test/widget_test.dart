// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:personas/main.dart';

void main() {
  testWidgets('MyHomePage has a title', (WidgetTester tester) async {
    // Create the Widget tell the tester to build it
    await tester.pumpWidget(new MyApp());
    final titleFinder = find.text('Personas');
    expect(titleFinder, findsOneWidget);
  });
}

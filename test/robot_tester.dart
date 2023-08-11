import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class RobotTester {
  final WidgetTester tester;

  RobotTester(this.tester);

  Future<void> makeTestableWidget({required Widget child}) async {
    await tester.pumpWidget(
      MaterialApp(
        title: 'Pokemon Demo',
        home: child,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}

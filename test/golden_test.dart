import 'package:education/templates/lab6/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testGoldens('LoginScreen golden test', (WidgetTester tester) async {
    final builder = GoldenBuilder.grid(
      columns: 1,
      widthToHeightRatio: 0.5,
    )..addScenario('Login Screen', MaterialApp(home: LoginScreen()));

    await tester.pumpWidgetBuilder(
      builder.build(),
      surfaceSize: Size(1000, 2000),
    );

    await screenMatchesGolden(tester, 'login_screen');

    await screenMatchesGolden(tester, 'login_screen',
        customPump: (WidgetTester tester) async {
      await tester.pump(const Duration(seconds: 1));
    });
  });
}

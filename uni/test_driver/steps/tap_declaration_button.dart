import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric TapDeclarationButton() {
  return when1<String, FlutterWorld>('I tap the {string} button',
      (key, context) async {
    context.world.driver.runUnsynchronized(() async {
      final expectMatch = context.expectMatch;

      final locator = find.byValueKey(key);

      expectMatch(
          await FlutterDriverUtils.isPresent(context.world.driver, locator),
          true);

      await context.world.driver.tap(locator);
    });
  });
}

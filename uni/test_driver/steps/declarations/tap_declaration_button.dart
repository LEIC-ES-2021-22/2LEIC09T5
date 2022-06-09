import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric TapDeclarationButton() {
  return when1<String, FlutterWorld>('I tap the {string} declaration button',
      (key, context) async {
    final expectMatch = context.expectMatch;

    final locator = find.byValueKey(key);

    sleep(Duration(seconds: 1)); // we need some delay for some reason

    expectMatch(
        await FlutterDriverUtils.isPresent(context.world.driver, locator),
        true);

    await context.world.driver.tap(locator);

    sleep(Duration(seconds: 1)); // we need some delay for some reason
  });
}

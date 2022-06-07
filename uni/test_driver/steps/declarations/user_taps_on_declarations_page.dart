import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric TapDeclarationsPageButton() {
  return and<FlutterWorld>(
    'The user taps the declarations page button',
    (context) async {
      final expectMatch = context.expectMatch;

      final locator = find.text("Declarações");

      expectMatch(
          await FlutterDriverUtils.isPresent(context.world.driver, locator),
          true);

      await context.world.driver.tap(locator);
    },
  );
}

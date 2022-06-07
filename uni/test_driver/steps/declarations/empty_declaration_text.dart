import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric EmptyDeclarationText() {
  return and<FlutterWorld>(
    'The declaration text is empty',
    (context) async {
      final expectMatch = context.expectMatch;

      final locator = find.byValueKey('declarationText');

      expectMatch(
          await FlutterDriverUtils.isPresent(context.world.driver, locator),
          true);

      final String text = await context.world.driver.getText(locator);

      expectMatch(text.isEmpty, true);
    },
  );
}

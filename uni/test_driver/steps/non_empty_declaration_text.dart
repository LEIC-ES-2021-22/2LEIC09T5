import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric NonEmptyDeclarationText() {
  return then1<String, FlutterWorld>(
    'I expect the {string} to not be empty',
    (key, context) async {
      final expectMatch = context.expectMatch;

      final locator = find.byValueKey(key);

      expectMatch(
          await FlutterDriverUtils.isPresent(context.world.driver, locator),
          true);

      final String text = await context.world.driver.getText(locator);

      expectMatch(text.isNotEmpty, true);
    },
  );
}

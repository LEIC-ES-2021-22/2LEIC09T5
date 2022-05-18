import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric NonEmptyDeclarationText() {
  return then<FlutterWorld>(
    'I expect the declaration text to not be empty',
    (context) async {
      context.world.driver.runUnsynchronized(() async {
        final expectMatch = context.expectMatch;

        final locator = find.byValueKey('declarationTest');

        expectMatch(
            await FlutterDriverUtils.isPresent(context.world.driver, locator),
            true);

        final String text = await context.world.driver.getText(locator);

        expectMatch(text.isNotEmpty, true);
      });
    },
  );
}

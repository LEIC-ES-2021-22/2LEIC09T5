import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric EmptyDeclarationText() {
  return given1<String, FlutterWorld>(
    'I expect the {string} to be empty',
    (key, context) async {
      final expectMatch = context.expectMatch;

      final locator = find.byValueKey(key);

      expectMatch(
          await FlutterDriverUtils.isAbsent(context.world.driver, locator),
          true);
    },
  );
}

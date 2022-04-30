import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric EmptyDeclarationText() {
  return given<FlutterWorld>(
    'That the declaration text is empty',
    (context) async {
      final expectMatch = context.expectMatch;

      final locator = find.byValueKey('declarationText');

      expectMatch(
          await FlutterDriverUtils.isAbsent(context.world.driver, locator),
          true);
    },
  );
}

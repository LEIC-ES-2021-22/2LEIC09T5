import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

import 'package:uni/model/entities/declaration.dart';
import 'package:uni/controller/declarations/declarations_fetcher.dart';

const mapping = {
  'multiusos': DeclarationType.MULTIUSOS,
  'deslocamento': DeclarationType.DESLOCAMENTO
};

StepDefinitionGeneric DeclarationTextContent() {
  return and1<String, FlutterWorld>(
    'I expect the declaration text to have the text related to the {string} declaration',
    (declarationType, context) async {
      context.world.driver.runUnsynchronized(() async {
        final expectMatch = context.expectMatch;

        final locator = find.byValueKey('declarationText');

        expectMatch(
            await FlutterDriverUtils.isPresent(context.world.driver, locator),
            true);

        final String containerText =
            await context.world.driver.getText(locator);

        final String realText =
            await DeclarationsFetcher.getDeclaration(mapping[declarationType]);

        expectMatch(containerText.isNotEmpty, true);
        expectMatch(containerText, realText);
      });
    },
  );
}

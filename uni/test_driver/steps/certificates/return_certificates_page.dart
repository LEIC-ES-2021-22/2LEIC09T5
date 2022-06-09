import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric ReturnCertificatesPage() {
  return then<FlutterWorld>(
    'I return to the certificates page',
    (context) async {
      final expectMatch = context.expectMatch;

      final locator = find.byValueKey('certificatesForm');

      expectMatch(
          await FlutterDriverUtils.isPresent(context.world.driver, locator),
          true);
    },
  );
}

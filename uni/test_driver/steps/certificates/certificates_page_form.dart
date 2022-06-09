import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric CertificatesPageForm() {
  return then<FlutterWorld>(
    'I expect the certificate creation page to appear',
    (context) async {
      final expectMatch = context.expectMatch;

      final locator = find.byValueKey('requestCertificatesForm');

      expectMatch(
          await FlutterDriverUtils.isPresent(context.world.driver, locator),
          true);
    },
  );
}

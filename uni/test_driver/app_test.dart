import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';

import 'steps/declarations/user_taps_on_declarations_page.dart';
import 'steps/declarations/non_empty_declaration_text.dart';
import 'steps/declarations/empty_declaration_text.dart';
import 'steps/declarations/tap_declaration_button.dart';
import 'steps/declarations/declaration_text_content.dart';

import 'steps/certificates/certificates_page_form.dart';
import 'steps/certificates/certificates_page_start.dart';
import 'steps/certificates/return_certificates_page.dart';
import 'steps/certificates/tap_certificates_fab.dart';
import 'steps/certificates/tap_certificates_form_submission_button.dart';
import 'steps/certificates/user_taps_on_certificates_page.dart';
import 'steps/certificates/certificates_dropdown_tap.dart';

Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [Glob(r'test_driver/features/**.feature')]
    ..reporters = [
      ProgressReporter(),
      TestRunSummaryReporter(),
      JsonReporter(path: './report.json'),
    ]
    ..stepDefinitions = [
      GivenOpenDrawer(),
      TapDeclarationsPageButton(),
      EmptyDeclarationText(),
      TapDeclarationButton(),
      // WhenTapWidget(), do not use this since we need the custom delay
      NonEmptyDeclarationText(),
      DeclarationTextContent(),
      TapCertificatesFAB(),
      TapCertificatesFormSubmissionButton(),
      CertificatesPageForm(),
      CertificatesPageStart(),
      ReturnCertificatesPage(),
      TapCertificatesPageButton(),
      CertificatesDropdownTap(),
    ]
    ..customStepParameterDefinitions = []
    ..restartAppBetweenScenarios = true
    ..targetAppPath = 'test_driver/app.dart';
  return GherkinRunner().execute(config);
}

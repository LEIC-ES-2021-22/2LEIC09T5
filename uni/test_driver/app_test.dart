import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';

import 'steps/empty_declaration_text.dart';
import 'steps/non_empty_declaration_text.dart';
import 'steps/tap_declaration_button.dart';
import 'steps/declaration_text_content.dart';

Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [Glob(r'test_driver/features/**.feature')]
    ..reporters = [
      ProgressReporter(),
      TestRunSummaryReporter(),
      JsonReporter(path: './report.json'),
    ]
    ..stepDefinitions = [
      EmptyDeclarationText(),
      TapDeclarationButton(),
      NonEmptyDeclarationText(),
      DeclarationTextContent(),
    ]
    ..customStepParameterDefinitions = []
    ..restartAppBetweenScenarios = true
    ..targetAppPath = 'test_driver/app.dart';
  return GherkinRunner().execute(config);
}

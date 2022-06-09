import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric CertificatesDropdownTap() {
  return when<FlutterWorld>('I select a certificate',
      (context) async {
    context.world.driver.runUnsynchronized(() async {
      final expectMatch = context.expectMatch;

      final locator = find.byValueKey('dropdownMenu');

      sleep(Duration(seconds: 1)); // we need some delay for some reason

      expectMatch(
          await FlutterDriverUtils.isPresent(context.world.driver, locator),
          true);

      await context.world.driver.tap(locator);

      sleep(Duration(seconds: 1)); // we need some delay for some reason
    
          final locator_text = find.text('Carta de Curso - Grau de Licenciado');

      sleep(Duration(seconds: 1)); // we need some delay for some reason

      expectMatch(
          await FlutterDriverUtils.isPresent(context.world.driver, locator_text),
          true);

      await context.world.driver.tap(locator_text);

    });
  });
}
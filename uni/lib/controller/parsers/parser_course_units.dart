import 'package:html/parser.dart' show parse;
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:collection';

/// Extracts a map containing information about the user's courses from an HTTP
/// [response].
///
/// *Note:*
/// * a key in this map is the name of a course
/// * a value in this map is the state of the corresponding course
List<String> parseCoursesUnitClasses(http.Response response) {
  final document = parse(response.body);

  final courseUnitClassesHeader = document.querySelectorAll(
      'div#conteudo > div#conteudoinner > table.tabela > tbody > tr')[0];

  var courseUnitClasses = courseUnitClassesHeader.querySelectorAll("th");

  courseUnitClasses.removeLast();

  return courseUnitClasses.map((elem) => elem.text).toList();
}

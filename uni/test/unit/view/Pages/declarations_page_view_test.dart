import 'package:uni/view/Pages/declarations_page_view.dart';
import 'package:uni/view/Widgets/declarations_page_title.dart';
import 'package:uni/view/Widgets/declaration_rectangle.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import '../../../testable_widget.dart';

void main() {
  group('Declarations Page', () {
    testWidgets('Should have default widgets', (WidgetTester tester) async {
      final widget = makeTestableWidget(child: DeclarationsPageView());
      await tester.pumpWidget(widget);

      expect(find.byType(DeclarationsPageTitle), findsOneWidget);
      expect(find.byType(DeclarationRectangle), findsNWidgets(2));
    });

    /* testWidgets('Should display declaration information on button press',
        (WidgetTester tester) async {
      const delcarationText =
          "Declaração Multiusos\n\nServe a seguinte declaração como um template do que seria aqui a Declaração Multiusos";

      const delcarationType = DeclarationType.MULTIUSOS;

      final widget = makeTestableWidget(child: DeclarationsPageView());
      await tester.pumpWidget(widget);

      tester.press();

      expect(find.w, findsOneWidget);
      expect(find.byType(DeclarationRectangle), findsNWidgets(2));
    }); */
  });
}

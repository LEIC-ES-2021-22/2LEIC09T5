import 'dart:async';
import 'package:uni/model/entities/declaration.dart';

class DeclarationsFetcher {
  static Future<String> getDeclaration(DeclarationType declarationType) async {
    print(declarationType);

    // TODO: implement file downloads

    switch (declarationType) {
      case DeclarationType.MULTIUSOS:
        return "Declaração Multiusos\n\nServe a seguinte declaração como um template do que seria aqui a Declaração Multiusos";
      case DeclarationType.DESLOCAMENTO:
        return "Declaração de descolamento\n\nServe a seguinte declaração como um template do que seria aqui a Declaração de Deslocamento";
    }

    return 'Test declaration';
  }
}

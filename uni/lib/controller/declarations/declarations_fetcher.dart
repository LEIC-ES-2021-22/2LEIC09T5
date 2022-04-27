class DeclarationsFetcher {
  static String getDeclaration(String declarationType) {
    switch (declarationType) {
      case 'deslocamento':
        {
          return "Declaração de descolamento";
        }
      case 'multiusos':
        {
          return "Declaração Multiusos";
        }
    }

    return 'Test declaration';
  }
}

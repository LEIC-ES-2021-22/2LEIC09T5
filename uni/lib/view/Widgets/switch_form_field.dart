import 'package:flutter/material.dart';

class SwitchFormField extends StatelessWidget {
  const SwitchFormField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormField<bool>(
      builder: (field) => Switch.adaptive(
        value: field.value,
        onChanged: field.didChange,
      ),
    );
  }
}

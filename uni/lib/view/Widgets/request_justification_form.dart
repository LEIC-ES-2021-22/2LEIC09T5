import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:tuple/tuple.dart';
import 'package:uni/view/Widgets/switch_form_field.dart';
import 'package:uni/view/theme.dart';

class RequestJustificationForm extends StatefulWidget {
  const RequestJustificationForm({Key key}) : super(key: key);

  @override
  _RequestJustificationFormState createState() =>
      _RequestJustificationFormState();
}

class Justification {
  static final values = ["ESOF", "DA", "LTW", "LCOM", "SO"];

  final String UC;
  final String date;
  final String obs;

  const Justification(
    this.UC,
    this.date,
    this.obs,
  );
}

class _RequestJustificationFormState extends State<RequestJustificationForm> {
  Justification justification = null;

  final formKey = GlobalKey<FormState>();

  final Map<String, String> fieldsTextContent = {
    "Calendário": "Calendário"
  };

  @override
  Widget build(BuildContext context) {
    final List<Widget> fields = getFormFields();

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.separated(
          itemCount: fields.length,
          itemBuilder: (context, i) => fields[i],
          separatorBuilder: (context, i) =>
              SizedBox.fromSize(size: Size.fromHeight(10)),
          shrinkWrap: true,
          primary: false,
        ),
      ),
    );
  }

  DropdownMenuItem dropdownMenuItemFromTuple(Tuple2<String, dynamic> tuple) {
    return DropdownMenuItem(
      child: Text(tuple.item1),
      value: tuple.item2,
    );
  }

  List<Widget> getFormFields() {
    Function handleCalendarChange(String keyText) {
      return () {
        showDateRangePicker(
                context: context,
                firstDate: DateTime(2022, 01, 01), // the earliest allowable
                lastDate: DateTime.now(), // the latest allowable
                currentDate: DateTime.now(),
                saveText: 'Done',
                builder: (context, child) => Theme(
                  data: applicationLightTheme.copyWith(
                    colorScheme: ColorScheme.light(
                      primary: Color.fromARGB(255, 0x75, 0x17, 0x1e)
                    ),
                  ),
                  child: child
                )
            ).then((DateTimeRange range) {
              this.setState(() {
                String range_str = range.toString();
                this.fieldsTextContent[keyText] = range_str.split(' ')[0] + " - " + range_str.split(' ')[3];
              });
            });
      };
    }

    final List<Widget> fields = [
      DropdownButtonFormField(
        decoration: InputDecoration(
          labelText: 'UC',
          filled: true,
        ),
        hint: Text('Escolher uma UC'),
        items: Justification.values
            .map((type) => DropdownMenuItem(
                  child: Text(type),
                  value: type,
                ))
            .toList(),
        onChanged: (j) => setState(() => justification = j),
        value: justification,
        isExpanded: true,
      ),
      TextFormField(
          key: Key(this.fieldsTextContent['Calendário']),
          initialValue: this.fieldsTextContent['Calendário'],
          onTap: handleCalendarChange("Calendário"),
          showCursor: false,
          readOnly: true   
      )  
    ];

    fields.add(TextFormField(
      decoration: InputDecoration(labelText: 'Observações'),
      keyboardType: TextInputType.multiline,
      maxLines: null,
    ));

    fields.add(ElevatedButton(
      onPressed: () {
        if (formKey.currentState.validate()) {
          Navigator.pop(context);
        }
      },
      child: Text('Submeter Pedido'),
    ));

    return fields;
  }
}

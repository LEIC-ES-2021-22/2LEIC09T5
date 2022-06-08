import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/controller/local_storage/app_certificates_database.dart';
import 'package:uni/main.dart';
import 'package:uni/model/entities/certificate.dart';
import 'package:uni/model/entities/course_unit.dart';
import 'package:uni/model/entities/lecture.dart';
import 'package:uni/redux/action_creators.dart';

class RequestClassChangeForm extends StatefulWidget {
  const RequestClassChangeForm({Key key}) : super(key: key);

  @override
  _RequestClassChangeFormState createState() => _RequestClassChangeFormState();
}

class _RequestClassChangeFormState extends State<RequestClassChangeForm> {
  String uc = null;
  String format = 'P';
  String shipping = 'N';

  final formKey = GlobalKey<FormState>();

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

  List<Widget> getFormFields() {
    final List<Widget> fields = [
      StoreConnector<AppState, List<String>>(converter: (store) {
        final List<CourseUnit> exams = store.state.content['currUcs'];

        final Set currUcs =
            store.state.content['schedule'].map((l) => l.subject).toSet();

        return exams
            .where((unit) => currUcs.contains(unit.abbreviation))
            .map((unit) => '${unit.abbreviation} - ${unit.name}')
            .toList();
      }, builder: (context, ucs) {
        return DropdownButtonFormField(
          decoration: InputDecoration(
            labelText: 'Escolhe uma UC',
            filled: true,
          ),
          hint: Text('Escolher uma UC'),
          items: ucs
              .map((uc) => DropdownMenuItem(
                    child: Text(uc),
                    value: uc,
                  ))
              .toList(),
          onChanged: (t) => setState(() => uc = t),
          value: uc,
          isExpanded: true,
        );
      }),
    ];

    fields.add(ElevatedButton(
      onPressed: () async {
        if (formKey.currentState.validate()) {
          // state.dispatch(updateStateBasedOnLocalUserCertificates());
          Navigator.pop(context);
        }
      },
      child: Text('Submeter Pedido'),
    ));

    return fields;
  }
}

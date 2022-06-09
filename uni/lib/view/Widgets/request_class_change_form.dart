import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/controller/parsers/parser_course_units.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/course_unit.dart';
import 'package:uni/controller/networking/network_router.dart';

class RequestClassChangeForm extends StatefulWidget {
  const RequestClassChangeForm({Key key}) : super(key: key);

  @override
  _RequestClassChangeFormState createState() => _RequestClassChangeFormState();
}

class _RequestClassChangeFormState extends State<RequestClassChangeForm> {
  CourseUnit uc = null;
  List<String> classes = [];
  bool classesFetched = false;
  String chosenClass = null;

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
      StoreConnector<AppState, List<CourseUnit>>(converter: (store) {
        final List<CourseUnit> ucs = store.state.content['currUcs'];

        final Set currUcs =
            store.state.content['schedule'].map((l) => l.subject).toSet();

        return ucs
            .where((unit) => currUcs.contains(unit.abbreviation))
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
                    child: Text('${uc.abbreviation} - ${uc.name}'),
                    value: uc,
                  ))
              .toList(),
          onChanged: (t) => setState(() {
            uc = t;
            this.classesFetched = false;
            this.chosenClass = null;
          }),
          value: uc,
          isExpanded: true,
        );
      }),
    ];

    if (uc != null) {
      fields.add(StoreConnector<AppState, List<String>>(converter: (store) {
        if (!classesFetched) {
          // do not place in AppState since this will change with every change to the chosen UC
          final response = NetworkRouter.getWithCookies(
                  NetworkRouter.getBaseUrlFromSession(
                          store.state.content['session']) +
                      "it_listagem.lista_turma_disciplina?",
                  {
                    'pv_curso_id': store.state.content['profile'].courses[0].id
                        .toString(), // TODO: figure out how to handle multiple courses
                    'pv_ocorrencia_id': uc.occurrId.toString(),
                    'pv_ano_lectivo': '2021', // FIXME: figure this out
                    'pv_periodo_id': uc.semesterCode.characters.first,
                    'pv_no_menu': '1'
                  },
                  store.state.content['session'])
              .then((response) {
            this.setState(() {
              this.classes = parseCoursesUnitClasses(response);
              this.classesFetched = true;
            });
          });
        }

        return classes;
      }, builder: (context, ucs) {
        return DropdownButtonFormField(
          decoration: InputDecoration(
            labelText: 'Turma pretendida',
            filled: true,
          ),
          hint: Text('Escolher uma nova turma'),
          items: ['Escolher nova turma', ...ucs]
              .map((className) => DropdownMenuItem(
                    child: Text(className),
                    value: className,
                  ))
              .toList(),
          onChanged: (c) => setState(() => chosenClass = c),
          value: chosenClass,
          isExpanded: true,
        );
      }));
    }

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

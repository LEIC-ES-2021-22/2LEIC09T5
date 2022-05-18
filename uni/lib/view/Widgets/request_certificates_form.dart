import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:tuple/tuple.dart';
import 'package:uni/view/Widgets/switch_form_field.dart';

class RequestCertificatesForm extends StatefulWidget {
  const RequestCertificatesForm({Key key}) : super(key: key);

  @override
  _RequestCertificatesFormState createState() =>
      _RequestCertificatesFormState();
}

class CertificateType {
  static final courseDiploma = CertificateType(
    'Carta de Curso - Grau de Licenciado',
    canBeInEnglish: false,
    timeLimitPhysical: const [Tuple2('180 dias úteis', '371')],
  );
  static final schoolAchievement = CertificateType(
      'Certidão de Aproveitamento Escolar',
      needsYear: true,
      purposePhysical: const [
        Tuple2('ADSE', '21'),
        Tuple2('IRS', '3'),
        Tuple2('Abono de família', '4'),
        Tuple2('Concessão de residência a estudantes estrangeiros', '61'),
        Tuple2('Pensões', '8'),
        Tuple2('Bolsas de estudo dos Serviços de Ação Social', '81'),
        Tuple2('Passes de transporte', '9'),
        Tuple2('Assistência médica e medicamentosa', '41'),
      ],
      timeLimitPhysical: const [
        Tuple2('10 dias úteis', '415'),
        Tuple2('5 dias úteis (50% mais caro)', '567'),
        Tuple2('2 dias úteis (100% mais caro)', '544'),
      ]);
  static final attendanceOfAcademicYearAndEnrolmentInTheFollowingYear =
      CertificateType(
    'Certidão de Frequência de um Ano Letivo e Inscrição no seguinte',
    timeLimitPhysical: const [
      Tuple2('10 dias úteis', '400'),
      Tuple2('5 dias úteis (50% mais caro)', '563'),
      Tuple2('2 dias úteis (100% mais caro)', '562'),
    ],
  );
  static final licenciadoDegree = CertificateType(
    'Certidão de Grau de Licenciado',
    canBeDigital: true,
    timeLimitPhysical: const [
      Tuple2('30 dias úteis', '394'),
      Tuple2('5 dias úteis (50% mais caro)', '521'),
      Tuple2('2 dias úteis (100% mais caro)', '522'),
    ],
    timeLimitDigital: const [Tuple2('30 dias úteis', '1141')],
  );
  static final enrolmentInCurricularYear = CertificateType(
      'Certidão de Inscrição em Ano Curricular',
      needsYear: true,
      purposePhysical: const [
        Tuple2('ADSE', '21'),
        Tuple2('IRS', '3'),
        Tuple2('Abono de família', '4'),
        Tuple2('Concessão de residência a estudantes estrangeiros', '61'),
        Tuple2('Pensões', '8'),
        Tuple2('Bolsas de estudo dos Serviços de Ação Social', '81'),
        Tuple2('Passes de transporte', '9'),
        Tuple2('Assistência médica e medicamentosa', '41'),
      ],
      timeLimitPhysical: const [
        Tuple2('10 dias úteis', '403'),
        Tuple2('5 dias úteis (50% mais caro)', '542'),
        Tuple2('2 dias úteis (100% mais caro)', '564'),
      ]);
  static final enrolmentInAcademicYear = CertificateType(
      'Certidão de Inscrição em Ano Letivo',
      needsYear: true,
      purposePhysical: const [
        Tuple2('ADSE', '21'),
        Tuple2('IRS', '3'),
        Tuple2('Abono de família', '4'),
        Tuple2('Concessão de residência a estudantes estrangeiros', '61'),
        Tuple2('Pensões', '8'),
        Tuple2('Bolsas de estudo dos Serviços de Ação Social', '81'),
        Tuple2('Passes de transporte', '9'),
        Tuple2('Assistência médica e medicamentosa', '41'),
      ],
      timeLimitPhysical: const [
        Tuple2('10 dias úteis', '403'),
        Tuple2('5 dias úteis (50% mais caro)', '542'),
        Tuple2('2 dias úteis (100% mais caro)', '564'),
      ]);
  static final registrationInCourseUnits = CertificateType(
      'Certidão de Inscrição em Unidades Curriculares',
      needsYear: true,
      timeLimitPhysical: const [
        Tuple2('10 dias úteis', '397'),
        Tuple2('5 dias úteis (50% mais caro)', '561'),
        Tuple2('2 dias úteis (100% mais caro)', '541'),
      ]);
  static final enrolment =
      CertificateType('Certidão de Matrícula', timeLimitPhysical: const [
    Tuple2('10 dias úteis', '403'),
    Tuple2('5 dias úteis (50% mais caro)', '542'),
    Tuple2('2 dias úteis (100% mais caro)', '564'),
  ]);
  static final noRestrictionOnRegistration = CertificateType(
      'Certidão de Não Prescrição',
      canBeInEnglish: false,
      needsYear: true,
      timeLimitPhysical: const [
        Tuple2('10 dias úteis', '505'),
        Tuple2('5 dias úteis (50% mais caro)', '1001'),
        Tuple2('2 dias úteis (100% mais caro)', '1021'),
      ]);
  static final programmesAndCourseWorkloads = CertificateType(
      'Certidão de Programas e Cargas Horárias',
      timeLimitPhysical: const [
        Tuple2('10 dias úteis', '461'),
        Tuple2('5 dias úteis (50% mais caro)', '462'),
        Tuple2('2 dias úteis (100% mais caro)', '481'),
      ]);
  static final courseUnitsCompleted = CertificateType(
      'Certidão de Realização de Unidades Curriculares',
      timeLimitPhysical: const [
        Tuple2('10 dias úteis', '397'),
        Tuple2('5 dias úteis (50% mais caro)', '561'),
        Tuple2('2 dias úteis (100% mais caro)', '541'),
      ]);
  static final sub23Pass = CertificateType(
    'Passe sub23@superior.tp',
    canBeInEnglish: false,
    canBeDigital: true,
    needsYear: true,
    timeLimitPhysical: const [Tuple2('10 dias úteis', '1201')],
    timeLimitDigital: const [Tuple2('10 dias úteis', '1201')],
  );

  static final values = [
    courseDiploma,
    schoolAchievement,
    attendanceOfAcademicYearAndEnrolmentInTheFollowingYear,
    licenciadoDegree,
    enrolmentInCurricularYear,
    enrolmentInAcademicYear,
    registrationInCourseUnits,
    enrolment,
    noRestrictionOnRegistration,
    programmesAndCourseWorkloads,
    courseUnitsCompleted,
    sub23Pass
  ];

  final String label;
  final bool canBeDigital;
  final bool canBeInEnglish;
  final bool needsYear;
  final List<Tuple2<String, String>> purposePhysical;
  final List<Tuple2<String, String>> purposeDigital;
  final List<Tuple2<String, String>> timeLimitPhysical;
  final List<Tuple2<String, String>> timeLimitDigital;
  final List<Tuple2<String, String>> shippingType = const [
    Tuple2('Correio normal', 'N'),
    Tuple2('Correio registado com aviso de receção', 'RC'),
    Tuple2('Correio registado sem aviso de receção', 'RS'),
    Tuple2('Levantamento presencial nos serviços', 'SR'),
  ];

  const CertificateType(
    this.label, {
    this.canBeDigital = false,
    this.canBeInEnglish = true,
    this.needsYear = false,
    this.timeLimitPhysical = null,
    this.timeLimitDigital = null,
    this.purposePhysical = null,
    this.purposeDigital = null,
  });
}

class _RequestCertificatesFormState extends State<RequestCertificatesForm> {
  CertificateType certificateType = null;
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

  DropdownMenuItem dropdownMenuItemFromTuple(Tuple2<String, dynamic> tuple) {
    return DropdownMenuItem(
      child: Text(tuple.item1),
      value: tuple.item2,
    );
  }

  List<Widget> getFormFields() {
    final List<Widget> fields = [
      DropdownButtonFormField(
        decoration: InputDecoration(
          labelText: 'Tipo de certificado',
          filled: true,
        ),
        hint: Text('Escolher um certificado'),
        items: CertificateType.values
            .map((type) => DropdownMenuItem(
                  child: Text(type.label),
                  value: type,
                ))
            .toList(),
        onChanged: (t) => setState(() => certificateType = t),
        value: certificateType,
        isExpanded: true,
      ),
    ];

    if (certificateType == null) {
      return fields;
    }

    if (certificateType.canBeInEnglish) {
      fields.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Em inglês'),
          SwitchFormField(),
        ],
      ));
    }

    if (certificateType.canBeDigital) {
      fields.add(DropdownButtonFormField(
        decoration: InputDecoration(labelText: 'Formato'),
        items: [
          dropdownMenuItemFromTuple(Tuple2('Digital', 'D')),
          dropdownMenuItemFromTuple(Tuple2('Papel', 'P')),
        ],
        isExpanded: true,
        onChanged: (i) => setState(() => format = i),
        value: format,
      ));
    }

    if (certificateType.canBeDigital && format == 'D') {
      if (certificateType.purposeDigital != null) {
        fields.add(DropdownButtonFormField(
          decoration: InputDecoration(labelText: 'Finalidade'),
          items: certificateType.purposeDigital
              .map(dropdownMenuItemFromTuple)
              .toList(),
          isExpanded: true,
          onChanged: (i) => {},
        ));
      }

      if (certificateType.timeLimitDigital != null) {
        fields.add(DropdownButtonFormField(
          decoration: InputDecoration(labelText: 'Prazo de emissão'),
          items: certificateType.timeLimitDigital
              .map(dropdownMenuItemFromTuple)
              .toList(),
          isExpanded: true,
          onChanged: (i) => {},
        ));
      }
    } else {
      if (certificateType.purposePhysical != null) {
        fields.add(DropdownButtonFormField(
          decoration: InputDecoration(labelText: 'Finalidade'),
          items: certificateType.purposePhysical
              .map(dropdownMenuItemFromTuple)
              .toList(),
          isExpanded: true,
          onChanged: (i) => {},
        ));
      }

      if (certificateType.timeLimitPhysical != null) {
        fields.add(DropdownButtonFormField(
          decoration: InputDecoration(labelText: 'Prazo de emissão'),
          items: certificateType.timeLimitPhysical
              .map(dropdownMenuItemFromTuple)
              .toList(),
          isExpanded: true,
          onChanged: (i) => {},
        ));
      }

      fields.add(Row(
        children: [
          Text('Quantidade:'),
          FormField<int>(
            builder: (field) => Row(
              children: [
                IconButton(
                  onPressed: () => field
                      .didChange(field.value - 1 < 1 ? 1 : field.value - 1),
                  icon: Icon(Icons.remove),
                ),
                Text(field.value.toString()),
                IconButton(
                  onPressed: () => field
                      .didChange(field.value + 1 > 99 ? 99 : field.value + 1),
                  icon: Icon(Icons.add),
                ),
              ],
            ),
            initialValue: 1,
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ));

      fields.add(DropdownButtonFormField(
        decoration: InputDecoration(labelText: 'Tipo de envio'),
        items: certificateType.shippingType
            .map(dropdownMenuItemFromTuple)
            .toList(),
        isExpanded: true,
        onChanged: (i) => setState(() => shipping = i),
        value: shipping,
      ));

      if (shipping != 'SR') {
        fields.add(TextFormField(
          decoration: InputDecoration(labelText: 'Morada'),
          keyboardType: TextInputType.multiline,
          maxLines: null,
        ));
      }
    }

    fields.add(TextFormField(
      decoration: InputDecoration(labelText: 'Observações'),
      keyboardType: TextInputType.multiline,
      maxLines: null,
    ));

    if (certificateType.needsYear) {
      fields.add(DropdownButtonFormField(
        decoration: InputDecoration(labelText: 'Ano letivo'),
        items: [
          DropdownMenuItem(
            child: Text('2021/2022'),
            value: '2021',
          )
        ],
        isExpanded: true,
        onChanged: (i) => {},
      ));
    }

    if (certificateType ==
        CertificateType
            .attendanceOfAcademicYearAndEnrolmentInTheFollowingYear) {
      fields.add(DropdownButtonFormField(
        decoration: InputDecoration(labelText: 'Ano letivo - Frequência'),
        items: [
          DropdownMenuItem(
            child: Text('2021/2022'),
            value: '2021',
          )
        ],
        isExpanded: true,
        onChanged: (i) => {},
      ));

      fields.add(DropdownButtonFormField(
        decoration: InputDecoration(labelText: 'Ano letivo - Inscrição'),
        items: [
          DropdownMenuItem(
            child: Text('2021/2022'),
            value: '2021',
          )
        ],
        isExpanded: true,
        onChanged: (i) => {},
      ));
    }

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

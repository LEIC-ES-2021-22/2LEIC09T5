import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:tuple/tuple.dart';
import 'package:uni/model/entities/certificate.dart';
import 'package:uni/view/Widgets/switch_form_field.dart';

class RequestCertificatesForm extends StatefulWidget {
  const RequestCertificatesForm({Key key}) : super(key: key);

  @override
  _RequestCertificatesFormState createState() =>
      _RequestCertificatesFormState();
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

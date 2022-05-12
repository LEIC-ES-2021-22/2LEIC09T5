import 'package:flutter/material.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/view/Widgets/certificates_page_title.dart';

class CertificatesPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CertificatesPageViewState();
}

class CertificatesPageViewState extends SecondaryPageViewState {

  @override
  Widget getBody(BuildContext context) {

    return ListView(
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              CertificatesPageTitle(),
              Text("testData21"),
              Text("testData2"),
              Text("testData3"),
            ]
          )
        ),
      ],
    );
  }

}

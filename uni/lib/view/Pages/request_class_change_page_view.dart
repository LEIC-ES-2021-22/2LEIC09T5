import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/view/Pages/unnamed_page_view.dart';
import 'package:uni/view/Widgets/certificates_page_title.dart';
import 'package:uni/view/Widgets/request_certificates_form.dart';

class RequestClassChangePageView extends StatefulWidget {
  const RequestClassChangePageView({Key key}) : super(key: key);

  @override
  RequestClassChangePageViewState createState() =>
      RequestClassChangePageViewState();
}

class RequestClassChangePageViewState extends UnnamedPageView {
  @override
  getScaffold(BuildContext context, Widget body) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: body,
    );
  }

  @override
  Widget getBody(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          CertificatesPageTitle(),
          RequestCertificatesForm(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/view/Pages/unnamed_page_view.dart';
import 'package:uni/view/Widgets/certificates_page_title.dart';
import 'package:uni/view/Widgets/request_certificates_form.dart';

class RequestCertificatesPageView extends StatefulWidget {
  const RequestCertificatesPageView({Key key}) : super(key: key);

  @override
  RequestCertificatesPageViewState createState() =>
      RequestCertificatesPageViewState();
}

class RequestCertificatesPageViewState extends UnnamedPageView {
  @override
  Widget getBody(BuildContext context) {
    return StoreConnector<AppState, String>(
      converter: (store) => '',
      builder: (context, state) => Column(
        children: [
          CertificatesPageTitle(),
          RequestCertificatesForm(),
        ],
      ),
      rebuildOnChange: false,
    );
  }
}

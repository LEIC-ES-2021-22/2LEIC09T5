import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/view/Pages/unnamed_page_view.dart';
import 'package:uni/view/Widgets/absence_justification_page_title.dart';
import 'package:uni/view/Widgets/request_justification_form.dart';

class RequestJustificationPageView extends StatefulWidget {
  const RequestJustificationPageView({Key key}) : super(key: key);

  @override
  RequestJustificationsPageViewState createState() =>
      RequestJustificationsPageViewState();
}

class RequestJustificationsPageViewState extends UnnamedPageView {
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
          AbsenceJustificationPageTitle(),
          RequestJustificationForm(),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/justification.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/view/Widgets/absence_justification_page_title.dart';
import 'package:uni/view/Pages/request_justification_page_view.dart';
import 'package:uni/view/Widgets/justification_card.dart';

class AbsenceJustificationPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AbsenceJustificationPageViewState();
}

class AbsenceJustificationPageViewState extends SecondaryPageViewState {
  @override
  Widget getBody(BuildContext context) {
    return StoreConnector<AppState, List<Justification>>(
      converter: (store) => store.state.content['justifications'],
      builder: (context, justifications) => Scaffold(
        body: ListView.builder(
          itemBuilder: ((context, i) => i == 0
              ? AbsenceJustificationPageTitle()
              : JustificationCard(justifications[i - 1])),
          itemCount: justifications.length + 1,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => RequestJustificationPageView())),
          ),
        ),
      ),
    );
  }
}

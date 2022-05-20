import 'package:flutter/material.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/view/Widgets/absence_justification_page_title.dart';
import 'package:uni/view/Pages/request_Justification_page_view.dart';

class AbsenceJustificationPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AbsenceJustificationPageViewState();
}

class AbsenceJustificationPageViewState extends SecondaryPageViewState {
  @override
  Widget getBody(BuildContext context) {

    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                AbsenceJustificationPageTitle(),
                
              ]
            )
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RequestJustificationPageView())),
      ),
    );
  }
}

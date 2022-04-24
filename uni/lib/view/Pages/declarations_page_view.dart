import 'package:flutter/material.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/view/Widgets/declarations_page_title.dart';

class DeclarationsPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DeclarationsPageViewState();
}

class DeclarationsPageViewState extends SecondaryPageViewState {

  @override
  Widget getBody(BuildContext context) {
  
    return ListView(
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              DeclarationsPageTitle(),
              Text("testData1"),
              Text("testData2"),
              Text("testData3"),
            ]
          )
        ),
      ],
    );
  }

}


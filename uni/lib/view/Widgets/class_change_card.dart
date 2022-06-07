import 'package:flutter/material.dart';
import 'package:uni/model/entities/class_change.dart';

class ClassChangeCard extends StatelessWidget {
  final double borderRadius = 12;
  final ClassChange classChange;

  ClassChangeCard(ClassChange this.classChange);

  @override
  Widget build(BuildContext context) {
    int textOpacity = (255 * 0.6).toInt();

    final List children = <Widget>[
      // no thouts head emty Xd
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Nome:",
                style: TextStyle(color: Color.fromARGB(textOpacity, 0, 0, 0))),
            Text(this.classChange.studentName,
                style: TextStyle(fontSize: 12.5)),
          ]),
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Nª mecanográfico:",
                style: TextStyle(color: Color.fromARGB(textOpacity, 0, 0, 0))),
            Text(this.classChange.studentNumber.toString(),
                style: TextStyle(fontSize: 12.5))
          ]),
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Cadeira:",
                style: TextStyle(color: Color.fromARGB(textOpacity, 0, 0, 0))),
            Flexible(
              child: Text(this.classChange.unitName,
                  softWrap: true,
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 12.5)),
            )
          ]),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(this.classChange.prevClass),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: const Icon(Icons.arrow_forward, color: Colors.black)),
        Text(this.classChange.newClass)
      ])
    ];

    return Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(this.borderRadius),
          color: Color.fromARGB(255, 245, 245, 245),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Color.fromARGB(255, 190, 190, 190),
                blurRadius: this.borderRadius / 2)
          ],
        ),
        child: ListView.separated(
          itemCount: children.length,
          itemBuilder: (context, i) => children[i],
          separatorBuilder: (context, i) =>
              SizedBox.fromSize(size: Size.fromHeight(20)),
          shrinkWrap: true,
          primary: false,
        ));
  }
}

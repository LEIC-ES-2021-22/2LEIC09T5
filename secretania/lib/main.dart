import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var mainColor = Color(0xFF75171E);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        primaryTextTheme: Typography.englishLike2018.apply(
            bodyColor: mainColor,
            displayColor: mainColor,
            decorationColor: mainColor),
        primaryIconTheme: IconTheme.of(context).copyWith(color: mainColor),
        accentColor: mainColor,
        appBarTheme: AppBarTheme.of(context)
            .copyWith(elevation: 0, color: Colors.transparent),
        cardTheme: CardTheme.of(context).copyWith(
          elevation: 8,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text.rich(
          TextSpan(children: [
            TextSpan(text: "secreta"),
            TextSpan(text: "NI", style: TextStyle(fontWeight: FontWeight.w900)),
            TextSpan(text: "a"),
          ]),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundColor: Colors.grey,
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2),
          child: Divider(
            height: 2,
            thickness: 2,
            indent: 16,
            endIndent: 16,
          ),
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (context, i) =>
            SizedBox.fromSize(size: Size.fromHeight(16)),
        itemCount: 7,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, i) => <Widget>[
          Text(
            'Trocas de Turmas',
            style: Theme.of(context).textTheme.headline6,
          ),
          TurmasCard(
            name: "António Santos",
            number: "202008004",
          ),
          TurmasCard(
            name: "João Pereira",
            number: "202007145",
          ),
          TurmasCard(
            name: "Nuno Pereira",
            number: "202007865",
          ),
          TurmasCard(
            name: "José Osório",
            number: "202004653",
          ),
          TurmasCard(
            name: "Pedro Nunes",
            number: "202004714",
          ),
          TurmasCard(
            name: "Pedro Silva",
            number: "202004985",
          ),
        ][i],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: ListView.builder(
            itemBuilder: (context, i) => i == 0
                ? SizedBox.fromSize(
                    size: Size.fromHeight(56),
                  )
                : ListTile(
                    title: Text(
                      [
                        "Troca de Turmas",
                        "Justificação de Faltas",
                        "Certificados",
                        "Declarações",
                      ][i - 1],
                      style: Theme.of(context).primaryTextTheme.bodyText1,
                    ),
                    selected: i == 1,
                    selectedTileColor: Colors.black12,
                  ),
            itemCount: 5,
          ),
        ),
      ),
    );
  }
}

class TurmasCard extends StatelessWidget {
  const TurmasCard({
    Key key,
    String this.name,
    String this.number,
  }) : super(key: key);

  final String name;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Nome:"), Text(name)],
            ),
            SizedBox.fromSize(size: Size.fromHeight(24)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Nº Mecanográfico:"), Text(number)],
            ),
            SizedBox.fromSize(size: Size.fromHeight(24)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Cadeira:"), Text("Engenharia de Software")],
            ),
            SizedBox.fromSize(size: Size.fromHeight(24)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("2L.EIC01"),
                SizedBox.fromSize(size: Size.square(8)),
                Icon(Icons.arrow_forward),
                SizedBox.fromSize(size: Size.square(8)),
                Text("2L.EIC02")
              ],
            ),
          ],
        ),
      ),
    );
  }
}

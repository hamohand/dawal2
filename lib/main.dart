import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:dawal2/models/lettre_model.dart';
import 'package:dawal2/onglets/apropos.dart';
import 'package:dawal2/onglets/clavier.dart';
import 'package:dawal2/onglets/liens/liens.dart';
import 'package:dawal2/onglets/liste/lettres_liste.dart';
import 'package:dawal2/themes.dart';
import 'package:dawal2/titre.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const String appTitre = 'Transcription';
    //const Color bleu = Colors.blue;
    //const Color vert = Colors.green;
    const Color ambre = Colors.amber;
    return MaterialApp(
      title: appTitre,
      theme: monThemeData1(context, ambre),
      /* ThemeData(
        //
        colorScheme: ColorScheme.fromSeed(seedColor: bleu),
        useMaterial3: true,
      ), */
      home: const MyHomePage(title: 'Wagi d awal iw'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  //
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          toolbarHeight: 90,
          backgroundColor: Theme.of(context).primaryColorDark,
          //
          title: const Titre(),
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Theme.of(context).primaryColorLight,
            //indicatorWeight: 20.0,
            tabs: const [
              Tab(
                icon: Icon(Icons.hdr_auto,semanticLabel: 'label'),
                //text: 'Alphabet',
              ),
              Tab(
                icon: Icon(Icons.keyboard,semanticLabel: 'label'),
                //text: 'Clavier',
              ),
              Tab(
                icon: Icon(Icons.public,semanticLabel: 'label'),
                //text: 'Liens',
              ),
              Tab(
                icon: Icon(Icons.info,semanticLabel: 'label'),
                //text: 'A propos',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            FutureBuilder(
                future: _chargerRoot('assets/json/lettres.json'),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    if (kDebugMode) {
                      print(snapshot.error);
                    }
                  }
                  return snapshot.hasData
                      ? LettresList(
                    tabLettres: snapshot.data,
                    zoom: 1,
                  )
                      : const CircularProgressIndicator();
                }),
            const Center(child: Clavier()),
            const Center(child: Liens()),
            const Center(child: Apropos()),
          ],
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

// méthode 2 OK
//Future<List<Photo>> _chargerRoot() async {
Future<List<Lettre>?> _chargerRoot(String url) async {
  String jsonString = //await rootBundle.loadString('json/photos.json');
  //await rootBundle.loadString('https://drive.google.com/file/d/1AxJHclljcFX7b03G7B9G-QOuVDaNxlXS/view?usp=sharing');
  await rootBundle.loadString(url);
  //print('main: jsonString= $jsonString');
  return convertir(jsonString);
}

/* ***** Conversion json ****** */
List<Lettre>? convertir(String responseBody) {
  //final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  final parsed = jsonDecode(responseBody);
  //print('main: parsed= $parsed');
  final parsedTab =
  parsed.map<Lettre>((json) => Lettre.fromJson(json)).toList();
  //print('main: parsedTab= ${parsedTab[0].prononciations[0].exemple}');
  return parsedTab;
}

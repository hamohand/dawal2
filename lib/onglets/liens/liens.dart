//import 'dart:js';

import 'package:flutter/material.dart';

import 'lien_navigateur.dart';

class Liens extends StatelessWidget {
  const Liens({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(10),
        elevation: 10,
        child: ListView(children: [
          ListTile(
            title: Text(
              'Quelques liens utiles',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            //subtitle: const Text('Liste non exhaustive', textAlign: TextAlign.center,)
          ),
          widgetWeb(context),
          widgetAppli(context),
        ]));
  }
}

Widget widgetWeb(context) {
  final List<Widget> tab = [
    ListTile(
        leading: Icon(Icons.web, color: Theme.of(context).primaryColor),
        title: Text(
          'Sites Web :',
          style: Theme.of(context).textTheme.displaySmall,
          //style: Theme.of(context).textTheme.bodyText1,
        )),
    LienNavigateur(
        lien: 'Dictionnaire DALLET',
        uri: Uri(
            scheme: 'https',
            host: 'adrar-inu.blogspot.com',
            path:
                '2020/11/tasenfelt-tamaynut-n-umawal-n-dallet.html?fbclid=IwAR2Be9alShzhOfQpKKoGnZTrNiqO9HBxSnJVISsqnwlfvSvdHQKyXG7OfEs#more')),
    //'https://adrar-inu.blogspot.com/2020/11/tasenfelt-tamaynut-n-umawal-n-dallet.html?fbclid=IwAR2Be9alShzhOfQpKKoGnZTrNiqO9HBxSnJVISsqnwlfvSvdHQKyXG7OfEs#more'),
    LienNavigateur(
        lien: 'Adrar inu',
        uri: Uri(scheme: 'https', host: 'adrar-inu.blogspot.com')),
    LienNavigateur(
        lien: 'Centre de Recherche Berbère Paris',
        uri: Uri(
            scheme: 'https',
            host: 'www.centrederechercheberbere.fr',
            path: 'transcription-kabyle.html')),
    LienNavigateur(
        lien: 'Le verbe kabyle',
        uri: Uri(scheme: 'https', host: 'www.amyag.com')),
    const ListTile(title: Text(' ...')),
  ];
  return Column(children: tab);
}

Widget widgetAppli(context) {
  final List<Widget> tab = [
    ListTile(
        leading:
            Icon(Icons.apps_outlined, color: Theme.of(context).primaryColor),
        title: Text(
          'Applications Play Store :',
          style: Theme.of(context).textTheme.displaySmall,
        )),
    const ListTile(title: Text('- Amyag')),
    const ListTile(title: Text('- Tamsirt')),
    const ListTile(title: Text('- Lmd Tamazight')),
    const ListTile(title: Text('- Aselmed')),
    const ListTile(title: Text('- ...')),
  ];
  return Column(children: tab);
}

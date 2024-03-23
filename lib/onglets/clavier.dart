import 'package:flutter/material.dart';

import 'liens/lien_navigateur.dart';

class Clavier extends StatelessWidget {
  const Clavier({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(10),
        elevation: 10,
        child: ListView(children: [
          ListTile(
              title: Text(
                'Installation langue et clavier',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              subtitle: Text(
                'Android - Windows - Iphone',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall,
              )),
          widgetAndroid(context),
          widgetWindow(context),
          widgetIphone(context)
        ]));
  }
}

Widget widgetAndroid(context) {
  final List<Widget> tab = [
    ListTile(
        leading: const Icon(Icons.android, color: Colors.blue,semanticLabel: 'label'),
        title: Text(
          'Android',
          style: Theme.of(context).textTheme.displaySmall,
        )),
    const ListTile(
        leading: Icon(Icons.settings,semanticLabel: 'label'),
        title: Text('Langue et clavier - Langue - Ajout d\'une langue')),
    const ListTile(
        leading: Icon(
          Icons.more_vert_rounded,semanticLabel: 'label',
        ),
        title: Text('Toutes les langues')),
    const ListTile(
        title: Text('Sélectionner \'Taqbaylit\' dans la liste des langues')),
    const ListTile(
        title: Text(
            'Télécharger et installer l\'application \'KeyBer\' (préconisée par le groupe D AWAL !)')),
  ];
  return Column(children: tab); //ListView(children: tabAndroid);
}

Widget widgetWindow(context) {
  final List<Widget> tab = [
    ListTile(
        leading: const Icon(Icons.window, color: Colors.blue,semanticLabel: 'label'),
        title: Text(
          'Windows',
          style: Theme.of(context).textTheme.displaySmall,
        )),
    Row(children: [
      LienNavigateur(
          lien: 'Youtube',
          uri: Uri.parse('https://www.youtube.com/watch?v=5S2wVF-PNa8')),
      LienNavigateur(
          lien: 'amawal.free.fr',
          uri:
              Uri(scheme: 'http', host: 'amawal.free.fr', path: 'fontes.html')),
    ])
  ];
  return Column(children: tab);
}

Widget widgetIphone(context) {
  final List<Widget> tab = [
    ListTile(
        leading: const Icon(Icons.phone_iphone, color: Colors.blue,semanticLabel: 'label'),
        title: Text(
          'Iphone',
          style: Theme.of(context).textTheme.displaySmall,
        )),
    const ListTile(
        leading: Icon(Icons.youtube_searched_for,semanticLabel: 'label'), title: Text('à suivre')),
  ];
  return Column(children: tab);
}

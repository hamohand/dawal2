import 'package:flutter/material.dart';

import '../../../models/lettre_model.dart';
import '../lettres_liste.dart';
import '../lettre_son.dart';
import 'exemple_son.dart';

class AfficheDetails extends StatelessWidget {
  final Lettre? lettreDef;
  final int? index;
  // ignore: use_key_in_widget_constructors
  const AfficheDetails(this.lettreDef, this.index);

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // implement build
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColorLight,
        appBar: AppBar(
          title: Text('${lettreDef?.lettre}'),
        ),
        body: Column(
          children: [
            const SizedBox(width: 10),
            Row(
              children: [
                afficheLettre(context, lettreDef?.lettreMaj, 2),
                const SizedBox(width: 10),
                afficheLettre(context, lettreDef?.lettre, 2),
                const SizedBox(width: 10),
              ],
            ),
            Text('Prononciation(s)',
                style: Theme.of(context).textTheme.displaySmall),
            Text('et sons équivalents',
                style: Theme.of(context).textTheme.displaySmall),
            const SizedBox(width: 10),
            const SizedBox(height: 20),
            const SizedBox(width: 10),
            lesPrononciations_details(context, lettreDef),
          ],
        ));
    //
  }
}

/* */
// ignore: non_constant_identifier_names
Widget lesPrononciations_details(BuildContext context, lettreDef) {
  List<Widget> prononciations = []; // tableau des prononciations s'il y a lieu
  for (var i = 0; i < lettreDef.prononciations.length; i++) {
    prononciations.add(tabPrononciations_details(context, lettreDef, i));
  }
  return Column(children: prononciations);
}

/* */
// ignore: non_constant_identifier_names
Widget tabPrononciations_details(
  //certaines lettres ont deux prononciations = tableau à 2 éléments
  BuildContext context,
  lettreDef,
  int? index,
  //TextStyle? styleDutexte
) {
  // éléments du tableau des prononciations s'il y a lieu
  return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
    //const SizedBox(width: 10),
    Row(
      children: [
        //const Text('-'),
        afficheLettre(context, lettreDef?.lettre, 1),
        //const SizedBox(width: 10),
        SonLettre(
          titre: lettreDef.lettre,
          fichier:
              'assets/audio_lettres/${lettreDef.prononciations[index].son}',
          couleurFond: Colors.transparent,
        ),

        afficheExemple_details(
            context,
            lettreDef.prononciations[index].exemple['texte'],
            Theme.of(context).textTheme.bodyMedium,
            1.0),
        //const SizedBox(width: 10),
        /* Icon(
          Icons.record_voice_over,
          color: Theme.of(context).primaryColor,
        ), */
        ExempleSon(
          titre: lettreDef.lettre,
          fichier:
              'assets/audio_exemples/${lettreDef.prononciations[index].exemple['son']}',
          couleurFond: Colors.transparent,
        ),
        //const SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
              border: Border.all(width: 0.5, color: Colors.white)),
          child: Image.asset(
            'assets/images/lettres/${lettreDef.prononciations[index].image}',
            width: 150,
            //height: 40,
            //scale: 3.0,
          ),
        ),
      ],
    ),
    Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
              text: TextSpan(
                  text: 'Français:',
                  style: Theme.of(context).textTheme.bodyLarge,
                  children: [
                TextSpan(
                  text: '${lettreDef.prononciations[index].francais}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ])),
          RichText(
              //textAlign: TextAlign.left,
              text: TextSpan(
                  text: 'Arabe:',
                  style: Theme.of(context).textTheme.bodyLarge,
                  children: [
                TextSpan(
                  text: '${lettreDef.prononciations[index].arabe}',
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ]))
        ])
  ]);
}

/* */
// ignore: non_constant_identifier_names
Widget afficheExemple_details(BuildContext context, String? texteExemple,
    TextStyle? styleTexteTheme, double? taille) {
  return Container(
    decoration: const BoxDecoration(
      color: Colors.transparent,
    ),
    margin: const EdgeInsets.all(3.0),
    alignment: Alignment.centerLeft,
    //width: 120.0,
    child: Text(
      '$texteExemple',
      style: styleTexteTheme, //Theme.of(context).textTheme.bodyText1,
      //textScaleFactor: taille,
    ),
  );
}

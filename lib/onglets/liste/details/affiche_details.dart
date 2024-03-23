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
    int? nbPrononciations = lettreDef?.prononciations?.length; // nb de prononciations différentes (1 ou 2)

    return Scaffold(
        backgroundColor: Theme.of(context).primaryColorLight,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColorDark,
          title: Text('${lettreDef?.lettre} ${lettreDef?.lettreMaj}'),
        ),
        body: Container(
            margin: const EdgeInsets.symmetric(vertical: 12,horizontal: 5),
          child: Column(
          children: [
            const SizedBox(width: 20),
            Row(
              children: [
                /*afficheLettre(context, lettreDef?.lettreMaj, 2),
                const SizedBox(width: 10),
                afficheLettre(context, lettreDef?.lettre, 2),
                const SizedBox(width: 10),*/
                Text((nbPrononciations==1)? 'Prononciation' :'Deux Prononciations',
                    style: Theme.of(context).textTheme.displaySmall,
                textAlign: TextAlign.center,)],
            ),
            const SizedBox(height: 40),
            lesPrononciations_details(context, lettreDef, nbPrononciations),
          ],
        )));
    //
  }
}

/* */
// ignore: non_constant_identifier_names
Widget lesPrononciations_details(BuildContext context, lettreDef, int? nbPrononciations) {
  List<Widget> prononciations = []; // tableau des prononciations s'il y a lieu
  for (var i = 0; i < lettreDef.prononciations.length; i++) {
    prononciations.add(tabPrononciations_details(context, lettreDef, i, nbPrononciations!));
  }
  return Column(children: prononciations);
}

/* */
// ignore: non_constant_identifier_names
Widget tabPrononciations_details(
  //certaines lettres ont deux prononciations = tableau à 2 éléments
  BuildContext context,
  lettreDef,
  int? i,
  int nbPrononciations,
  //TextStyle? styleDutexte
) {
  // éléments du tableau des prononciations s'il y a lieu
  return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
    //const SizedBox(width: 10),
    Column(
      children: [
        Row(children: [
          //const Text('-'),
          Text((nbPrononciations==1)? '' : (i == 0)? '1/ ': '2/ ',
          style: const TextStyle(color:  Colors.black),),
          afficheLettre(context, lettreDef?.lettre, 1),
          const SizedBox(width: 10),
          SonLettre(
            titre: lettreDef.lettre,
            fichier:
            'assets/audio_lettres/${lettreDef.prononciations[i].son}',
            couleurFond: Colors.transparent,
          ),
        const SizedBox(width: 10,),
        const Text(' comme :',style: TextStyle(color:  Colors.black, fontWeight: FontWeight.normal, fontSize: 12),)]),

          Row(children: [
            afficheExemple_details(
              context,
              lettreDef.prononciations[i].exemple['texte'],
              Theme.of(context).textTheme.bodyMedium,
              1.0),
            const SizedBox(width: 5),
            /* Icon(
          Icons.record_voice_over,
          color: Theme.of(context).primaryColor,
        ), */
            ExempleSon(
              titre: lettreDef.lettre,
              fichier:
              'assets/audio_exemples/${lettreDef.prononciations[i].exemple['son']}',
              couleurFond: Colors.transparent,
            ),
            const SizedBox(width: 10),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 0.5, color: Colors.white)),
              child: Image.asset(
                'assets/images/lettres/${lettreDef.prononciations[i].image}',
                width: 150,
                //height: 40,
                //scale: 3.0,
              ),
            )]
            ,)
        //const SizedBox(width: 10),
      ],
    ),
    const SizedBox(height: 15,),
    Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Sons équivalents : ',
              style: TextStyle(color:  Colors.black, fontWeight: FontWeight.normal, fontSize: 14)
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisSize: MainAxisSize.max,
  children: [
          RichText(
              text: TextSpan(
                  text: 'Français : ',
                  //style: Theme.of(context).textTheme.bodyLarge,
                  style: const TextStyle(
                    fontFamily: 'Times New Roman',
                    fontStyle: FontStyle.italic,
                    color: Colors.black54,
                  ),
                  children: [
                TextSpan(
                  text: '${lettreDef.prononciations[i].francais}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ])),
          RichText(
              //textAlign: TextAlign.left,
              text: TextSpan(
                  text: '  Arabe : ',
                  //style: Theme.of(context).textTheme.bodyLarge,
                  style: const TextStyle(
                    fontFamily: 'Times New Roman',
                    fontStyle: FontStyle.italic,
                    color: Colors.black54,
                  ),
                  children: [
                TextSpan(
                  text: '${lettreDef.prononciations[i].arabe}',
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ]))],)
        ])
    ,
    const SizedBox(height: 35,)]);
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

import 'package:flutter/material.dart';

import '../../models/lettre_model.dart';
import 'lettre_son.dart';

class LettrePrononciations extends StatelessWidget {
  final Lettre? lettreDef;
  final Color? couleurFond;
  final double zoom;

  const LettrePrononciations(
      {super.key,
      required this.lettreDef,
      required this.couleurFond,
      required this.zoom});

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return lesPrononciations(context, lettreDef, couleurFond, zoom);
    //throw UnimplementedError();
  }
}

/* */
// ignore: non_constant_identifier_names
Widget lesPrononciations(BuildContext context, lettreDef, couleurFond, zoom) {
  List<Widget> prononciations = []; // tableau des prononciations s'il y a lieu
  for (var i = 0; i < lettreDef.prononciations.length; i++) {
    prononciations
        .add(tabPrononciations(context, lettreDef, couleurFond, i, zoom));
  }
  return Column(children: prononciations);
}

/* */
Widget tabPrononciations(
    //certaines lettres ont deux prononciations
    BuildContext context,
    lettreDef,
    couleurFond,
    int? index,
    double zoom) {
  // éléments du tableau des prononciations s'il y a lieu
  return Row(
    children: [
      SonLettre(
        titre: lettreDef.lettre,
        fichier: 'assets/audio_lettres/${lettreDef.prononciations[index].son}',
        couleurFond: couleurFond,
      ),
      const SizedBox(width: 10),
      afficheExemple(context, lettreDef.prononciations[index].exemple['texte'],
          Theme.of(context).textTheme.bodyLarge, zoom),
      Container(
        decoration:
            BoxDecoration(border: Border.all(width: 0.5, color: Colors.white)),
        child: Image.asset(
          'assets/images/lettres/${lettreDef.prononciations[index].image}',
          width: 52,
          height: 40,
        ),
      )
    ],
  );
}

/* */
Widget afficheExemple(BuildContext context, String? texteExemple,
    TextStyle? styleTexteTheme, double zoom) {
  return Container(
    decoration: const BoxDecoration(
      color: Colors.transparent,
    ),
    margin: const EdgeInsets.all(3.0),
    alignment: Alignment.centerLeft,
    width: 120.0,
    child: Text(
      '$texteExemple',
      style: styleTexteTheme, //Theme.of(context).textTheme.bodyText1,
      //textScaleFactor: zoom,
      textScaler: TextScaler.linear(zoom),
    ),
  );
}

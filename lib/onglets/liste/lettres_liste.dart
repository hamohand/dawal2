import 'package:flutter/material.dart';
import '../../models/lettre_model.dart';
import 'details/affiche_details.dart';
import 'lettre_pronociations.dart';

class LettresList extends StatelessWidget {
  final List<Lettre>? tabLettres;
  final double? zoom;

  const LettresList({super.key, this.tabLettres, this.zoom});

  @override
  Widget build(BuildContext context) {
    return laListe(context, tabLettres, zoom);
  }
}

Widget laListe(BuildContext context, tabLettres, zoom) {
  Color? couleurFondClair = Theme.of(context).primaryColorLight;
  Color? couleurFondFonce = Theme.of(context).colorScheme.background;
  Color? couleurFond = couleurFondFonce; // initialisée à foncé
  //
  return ListView.builder(
      padding: const EdgeInsets.all(2),
      itemCount: tabLettres.length,
      itemBuilder: (BuildContext context, int? index) {
        (couleurFond == couleurFondFonce)
            ? couleurFond = couleurFondClair
            : couleurFond = couleurFondFonce;
        return Container(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            color: couleurFond,
            child: Row(
              children: [
                afficheLettre(context, tabLettres[index].lettreMaj, zoom * 1.2),
                afficheLettre(context, tabLettres[index].lettre, zoom * 1.2),
                LettrePrononciations(
                    lettreDef: tabLettres[index],
                    couleurFond: couleurFond,
                    zoom: zoom),
                details(context, tabLettres[index], index),
              ],
            ));
      });
}

/* */
Widget afficheLettre(BuildContext context, String? lalettre, double taille) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.transparent,
        border:
            Border.all(width: 0.5, color: Theme.of(context).primaryColorDark),
        borderRadius: const BorderRadius.all(Radius.circular((18)))),
    margin: const EdgeInsets.all(1.0),
    alignment: Alignment.center,
    width: 28.0,
    child: // Expanded( child:
        Text(
      '$lalettre',
      style: Theme.of(context).textTheme.bodyMedium,
      //textScaleFactor: taille,
      textScaler: TextScaler.linear(taille),
    ),
    //)
  );
}

/* */
/* Widget const SizedBox(width: 10), {
  return Container(
    color: Colors.transparent,
    width: 10.0,
    //height: 30.0,
    child: const Text(''),
  );
} */

/* */
Widget details(BuildContext context, lettreDef, index) {
  return Row(
    children: [
      const SizedBox(width: 10),
      IconButton(
        alignment: Alignment.centerRight,
        // icon: const Icon(Icons.more_horiz_rounded),
        icon: const Icon(Icons.arrow_right),
        //color: Colors.lightGreen,
        color: Theme.of(context).primaryColor,
        // hoverColor: Colors.red,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AfficheDetails(lettreDef, index)));
        },
      ),
    ],
  );
}

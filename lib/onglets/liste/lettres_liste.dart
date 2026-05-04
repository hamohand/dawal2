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
  return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      itemCount: tabLettres.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
            elevation: 1,
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              child: Row(
                children: [
                  afficheLettre(context, tabLettres[index].lettreMaj, zoom * 1.2),
                  const SizedBox(width: 4),
                  afficheLettre(context, tabLettres[index].lettre, zoom * 1.2),
                  const SizedBox(width: 8),
                  LettrePrononciations(
                      lettreDef: tabLettres[index],
                      couleurFond: Colors.transparent,
                      zoom: zoom),
                  const Spacer(),
                  details(context, tabLettres[index], index),
                ],
              ),
            ));
      });
}

/* */
Widget afficheLettre(BuildContext context, String? lalettre, double taille) {
  return Container(
    decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: const BorderRadius.all(Radius.circular(8))),
    alignment: Alignment.center,
    width: 36.0,
    height: 36.0,
    child: Text(
      '$lalettre',
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            fontWeight: FontWeight.bold,
          ),
      textScaler: TextScaler.linear(taille),
    ),
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
        icon: const Icon(Icons.arrow_right,size: 50, semanticLabel: 'button'),
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

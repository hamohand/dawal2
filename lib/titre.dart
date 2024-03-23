import 'package:flutter/material.dart';

class Titre extends StatelessWidget {
  const Titre({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Column(children: [
      Row(
        children: [
          Image.asset(
            'assets/images/africa-north-transparent.png',
            width: 60,
            color: Theme.of(context).primaryColorLight,
            semanticLabel: 'label',
            // height: 52,
          ),
          Text.rich(semanticsLabel: 'label',
            //style: Theme.of(context).textTheme.headline1,
            TextSpan(
              style: Theme.of(context).textTheme.displayLarge,
              children: const <TextSpan>[
                TextSpan(
                  text: 'wagiDAWALiw',
                  style: TextStyle(
                      //color: Color.fromRGBO(205, 1, 51, 1.0),
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 1.3),
                ),
              ],
            ),
          ),
        ],
      ),
      const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text.rich(semanticsLabel: 'label',
          TextSpan(children: <TextSpan>[
            TextSpan(
              text: ' Aru Tamazi\$t -',
              style: TextStyle(
                fontFamily: 'Amazigh tms',
                fontSize: 18,
                //fontFamily: 'Gelio Greek Diner',
                //color: Color.fromRGBO(230, 230, 1, 1.0)
              ),
              //color: Colors.yellowAccent),
            ),
            TextSpan(
              text: ' Ecrire Berbère',
              style: TextStyle(
                fontFamily: 'Times New Roman',
                fontSize: 14,
                //color: Color.fromRGBO(230, 230, 1, 1.0)
              ),
            ),
          ]),
        )
      ]),
      //const Text(''),
      const Text(
        'En tamazight, toutes les lettres se prononcent.',
        style: TextStyle(
          fontFamily: 'Times New Roman',
          fontSize: 10,
          fontStyle: FontStyle.italic,
          color: Colors.black54,
          //color: Color.fromRGBO(230, 230, 1, 1.0)
        ),
      )
    ]);
  }
}

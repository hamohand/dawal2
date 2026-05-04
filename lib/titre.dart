import 'package:flutter/material.dart';

class Titre extends StatelessWidget {
  const Titre({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/africa-north-transparent.png',
              width: 50,
              color: Theme.of(context).colorScheme.primary,
              semanticLabel: 'logo africa',
            ),
            const SizedBox(width: 8),
            Text.rich(
              semanticsLabel: 'titre',
              TextSpan(
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: 24,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 1.3,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
                children: const <TextSpan>[
                  TextSpan(text: 'wagiDAWALiw'),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text.rich(
              semanticsLabel: 'sous-titre',
              TextSpan(
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
                children: const <TextSpan>[
                  TextSpan(
                    text: ' Aru Tamazi\$t -',
                    style: TextStyle(
                      fontFamily: 'Amazigh tms',
                      fontSize: 16,
                    ),
                  ),
                  TextSpan(
                    text: ' Ecrire Berbère',
                    style: TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Text(
          'En tamazight, toutes les lettres se prononcent.',
          style: TextStyle(
            fontFamily: 'Times New Roman',
            fontSize: 10,
            fontStyle: FontStyle.italic,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        )
      ],
    );
  }
}

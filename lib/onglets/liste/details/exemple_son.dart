import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class ExempleSon extends StatefulWidget {
  final String? titre;
  final String? fichier;
  final Color? couleurFond;
  const ExempleSon(
      {super.key,
      required this.titre,
      required this.fichier,
      required this.couleurFond});
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<ExempleSon> {
  late AudioPlayer player;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }

  @override
  void dispose() {
    player.dispose();
    // player2.dispose();
    super.dispose();
  }

  Future lire(fichierSon) async {
    await player.setAsset(fichierSon);
    player.play();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        // child: Expanded(
        child: boutonMusic(widget.fichier, widget.couleurFond)
        //),
        );
  }

  Widget boutonMusic(fichierSon, couleurFond) {
    return Container(
      color: couleurFond,
      child: Center(
        child: IconButton(
          icon: const Icon(Icons.record_voice_over),
          //icon: const Icon(Icons.music_note),
          color: Theme.of(context).primaryColor,
          onPressed: () {
            lire(fichierSon);
          },
        ),
      ),
    );
  }
}

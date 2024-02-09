import 'package:dawal/models/prononciation_model.dart';
import 'package:json_annotation/json_annotation.dart';

/// Ceci permet à la classe `User` d'accéder aux membres privés dans
/// le fichier généré. La valeur pour ceci est '*.g.dart', où
/// l'étoile indique le nom du fichier source. partie 'user.g.dart' ;
/// ne pa oublier d'exécuter, à la racine (terminal) :
/// "dart run build_runner watch"

part 'lettre_model.g.dart';

@JsonSerializable()
class Lettre {
  final String? lettre;
  final String? lettreMaj;
  final List<Prononciation>? prononciations;

  Lettre(
    this.lettre,
    this.lettreMaj,
    this.prononciations,
  );

  factory Lettre.fromJson(Map<String, dynamic> json) => _$LettreFromJson(json);
  Map<String, dynamic> toJson() => _$LettreToJson(this);
}

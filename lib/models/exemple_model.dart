import 'package:json_annotation/json_annotation.dart';

/// Ceci permet à la classe `User` d'accéder aux membres privés dans
/// le fichier généré. La valeur pour ceci est *.g.dart, où
/// l'étoile indique le nom du fichier source. partie 'user.g.dart' ;
/// ne pa oublier d'exécuter, à la racine (terminal) :
/// "dart run build_runner watch"

part 'exemple_model.g.dart';

@JsonSerializable()
class Exemple {
  final String? texte;
  final String? son;

  Exemple(this.texte, this.son);

  factory Exemple.fromJson(Map<String, dynamic> json) =>
      _$ExempleFromJson(json);
  Map<String, dynamic> toJson() => _$ExempleToJson(this);
}

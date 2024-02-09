import 'package:json_annotation/json_annotation.dart';

/// Ceci permet à la classe `User` d'accéder aux membres privés dans
/// le fichier généré. La valeur pour ceci est *.g.dart, où
/// l'étoile indique le nom du fichier source. partie 'user.g.dart' ;
/// ne pa oublier d'exécuter, à la racine (terminal) :
/// "dart run build_runner watch"

part 'prononciation_model.g.dart';

@JsonSerializable()
class Prononciation {
  final Map<String, dynamic>? exemple;
  final String? son;
  final String? image;
  final String? francais;
  final String? arabe;

  Prononciation(this.exemple, this.son, this.image, this.francais, this.arabe);

  factory Prononciation.fromJson(Map<String, dynamic> json) =>
      _$PrononciationFromJson(json);
  Map<String, dynamic> toJson() => _$PrononciationToJson(this);
}

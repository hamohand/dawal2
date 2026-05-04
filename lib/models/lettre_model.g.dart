// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lettre_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lettre _$LettreFromJson(Map<String, dynamic> json) => Lettre(
      json['lettre'] as String?,
      json['lettreMaj'] as String?,
      json['lettreTifinagh'] as String?,
      (json['prononciations'] as List<dynamic>?)
          ?.map((e) => Prononciation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LettreToJson(Lettre instance) => <String, dynamic>{
      'lettre': instance.lettre,
      'lettreMaj': instance.lettreMaj,
      'lettreTifinagh': instance.lettreTifinagh,
      'prononciations': instance.prononciations,
    };

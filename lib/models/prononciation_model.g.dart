// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prononciation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Prononciation _$PrononciationFromJson(Map<String, dynamic> json) =>
    Prononciation(
      json['exemple'] as Map<String, dynamic>?,
      json['son'] as String?,
      json['image'] as String?,
      json['francais'] as String?,
      json['arabe'] as String?,
    );

Map<String, dynamic> _$PrononciationToJson(Prononciation instance) =>
    <String, dynamic>{
      'exemple': instance.exemple,
      'son': instance.son,
      'image': instance.image,
      'francais': instance.francais,
      'arabe': instance.arabe,
    };

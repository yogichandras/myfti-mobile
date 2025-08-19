// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) => ArticleModel(
      id: json['id'] as String?,
      date: json['date'] as String?,
      category: json['category'] as String?,
      place: json['tempat'] as String?,
      coverUrl: json['foto'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ArticleModelToJson(ArticleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'category': instance.category,
      'tempat': instance.place,
      'foto': instance.coverUrl,
      'description': instance.description,
    };

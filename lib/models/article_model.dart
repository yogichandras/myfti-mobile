import 'package:json_annotation/json_annotation.dart';

part 'article_model.g.dart';

@JsonSerializable()
class ArticleModel {
  final String? id;
  final String? date;
  final String? category;

  @JsonKey(name: 'tempat')
  final String? place;

  @JsonKey(name: 'foto')
  final String? coverUrl;

  final String? description;

  ArticleModel({
    this.id,
    this.date,
    this.category,
    this.place,
    this.coverUrl,
    this.description,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'information_model.g.dart';

@JsonSerializable()
class InformationModel {
  final String? id;
  final String? description;

  InformationModel({this.id, this.description});

  factory InformationModel.fromJson(Map<String, dynamic> json) =>
      _$InformationModelFromJson(json);
}

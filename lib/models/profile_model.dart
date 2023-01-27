import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  final String? id;

  @JsonKey(name: "nama")
  final String? name;

  final String? semester;

  @JsonKey(name: "jurusan")
  final String? major;

  final String? bio;
  final String? username;
  final String? email;

  @JsonKey(name: "npm")
  final String? identityNumber;

  @JsonKey(name: "foto")
  final String? imageUrl;

  ProfileModel({
    this.id,
    this.name,
    this.semester,
    this.major,
    this.bio,
    this.username,
    this.email,
    this.identityNumber,
    this.imageUrl,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}

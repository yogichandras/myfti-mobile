// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      id: json['id'] as String?,
      name: json['nama'] as String?,
      semester: json['semester'] as String?,
      major: json['jurusan'] as String?,
      bio: json['bio'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      identityNumber: json['npm'] as String?,
      imageUrl: json['foto'] as String?,
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama': instance.name,
      'semester': instance.semester,
      'jurusan': instance.major,
      'bio': instance.bio,
      'username': instance.username,
      'email': instance.email,
      'npm': instance.identityNumber,
      'foto': instance.imageUrl,
    };

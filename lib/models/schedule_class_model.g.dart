// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_class_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleClassModel _$ScheduleClassModelFromJson(Map<String, dynamic> json) =>
    ScheduleClassModel(
      id: json['id'] as String?,
      lecturer: json['dosen'] as String?,
      room: json['kelas'] as String?,
      time: json['jam'] as String?,
      subject: json['matkul'] as String?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
    );

Map<String, dynamic> _$ScheduleClassModelToJson(ScheduleClassModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dosen': instance.lecturer,
      'kelas': instance.room,
      'jam': instance.time,
      'matkul': instance.subject,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
    };

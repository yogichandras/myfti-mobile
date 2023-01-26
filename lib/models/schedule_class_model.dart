import 'package:json_annotation/json_annotation.dart';

part 'schedule_class_model.g.dart';

@JsonSerializable()
class ScheduleClassModel {
  final String? id;

  @JsonKey(name: 'dosen')
  final String? lecturer;

  @JsonKey(name: 'kelas')
  final String? room;

  @JsonKey(name: 'jam')
  final String? time;

  @JsonKey(name: 'matkul')
  final String? subject;

  @JsonKey(name: 'start_date')
  final String? startDate;

  @JsonKey(name: 'end_date')
  final String? endDate;

  ScheduleClassModel({
    this.id,
    this.lecturer,
    this.room,
    this.time,
    this.subject,
    this.startDate,
    this.endDate,
  });

  factory ScheduleClassModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduleClassModelFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleClassModelToJson(this);
}

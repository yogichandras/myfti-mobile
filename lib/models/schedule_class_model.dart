// ignore_for_file: non_constant_identifier_names

class ScheduleClassModel {
  final String? id;
  final String? lecturer;
  final String? room;
  final String? time;
  final String? subject;

  ScheduleClassModel(
      {this.id, this.lecturer, this.room, this.time, this.subject});

  factory ScheduleClassModel.fromDTO(ScheduleClassDTO dto) {
    return ScheduleClassModel(
      id: dto.id,
      lecturer: dto.dosen,
      room: dto.kelas,
      time: dto.jam,
      subject: dto.matkul,
    );
  }
}

class ScheduleClassDTO {
  final String? id;
  final String? start_date;
  final String? end_date;
  final String? jam;
  final String? kelas;
  final String? matkul;
  final String? dosen;

  ScheduleClassDTO(
      {this.id,
      this.start_date,
      this.end_date,
      this.jam,
      this.kelas,
      this.matkul,
      this.dosen});

  factory ScheduleClassDTO.fromJson(Map<String, dynamic> json) {
    return ScheduleClassDTO(
      id: json['id'],
      start_date: json['start_date'],
      end_date: json['end_date'],
      jam: json['jam'],
      kelas: json['kelas'],
      matkul: json['matkul'],
      dosen: json['dosen'],
    );
  }
}

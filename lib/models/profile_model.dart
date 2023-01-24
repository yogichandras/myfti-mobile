class ProfileModel {
  final String? id;
  final String? name;
  final String? semester;
  final String? major;
  final String? bio;
  final String? username;
  final String? email;
  final String? identityNumber;
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

  factory ProfileModel.fromDTO(ProfileDTO dto) {
    return ProfileModel(
      id: dto.id,
      name: dto.nama,
      semester: dto.semester,
      major: dto.jurusan,
      bio: dto.bio,
      username: dto.username,
      email: dto.email,
      identityNumber: dto.npm,
      imageUrl: dto.foto,
    );
  }
}

class ProfileDTO {
  final String? id;
  final String? nama;
  final String? semester;
  final String? jurusan;
  final String? bio;
  final String? username;
  final String? email;
  final String? npm;
  final String? foto;

  ProfileDTO({
    this.id,
    this.nama,
    this.semester,
    this.jurusan,
    this.bio,
    this.username,
    this.email,
    this.npm,
    this.foto,
  });

  factory ProfileDTO.fromJson(Map<String, dynamic> json) {
    return ProfileDTO(
      id: json['id'],
      nama: json['nama'],
      semester: json['semester'],
      jurusan: json['jurusan'],
      bio: json['bio'],
      username: json['username'],
      email: json['email'],
      npm: json['npm'],
      foto: json['foto'],
    );
  }
}

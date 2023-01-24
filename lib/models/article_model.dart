class ArticleModel {
  final String? id;
  final String? date;
  final String? category;
  final String? place;
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

  factory ArticleModel.fromDTO(ArticleDTO dto) {
    return ArticleModel(
      id: dto.id,
      date: dto.date,
      category: dto.category,
      place: dto.tempat,
      coverUrl: dto.foto,
      description: dto.description,
    );
  }
}

class ArticleDTO {
  final String? id;
  final String? date;
  final String? category;
  final String? tempat;
  final String? foto;
  final String? description;

  ArticleDTO({
    this.id,
    this.date,
    this.category,
    this.tempat,
    this.foto,
    this.description,
  });

  factory ArticleDTO.fromJson(Map<String, dynamic> json) {
    return ArticleDTO(
      id: json['id'],
      date: json['date'],
      category: json['category'],
      tempat: json['tempat'],
      foto: json['foto'],
      description: json['description'],
    );
  }
}

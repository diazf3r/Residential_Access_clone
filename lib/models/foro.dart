class Foro {
  final String title;
  final String description;
  final String? titleRespuesta;
  final String? respuesta;

  Foro(
      {required this.title,
      required this.description,
      this.titleRespuesta,
      this.respuesta});

  factory Foro.fromJson(Map<String, dynamic> json) {
    return Foro(
        title: json['title'],
        description: json['description'],
        titleRespuesta: json['titleRespuesta'],
        respuesta: json['respuesta']);
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
    };
  }
}

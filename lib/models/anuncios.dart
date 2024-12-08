class Anuncios {
  final String title;
  final String content;
  final String imageURL;
  final String? id;

  Anuncios(
      {required this.title,
      required this.content,
      required this.imageURL,
      this.id});

  factory Anuncios.fromJson(Map<String, dynamic> json) {
    return Anuncios(
      title: json['title'],
      content: json['content'],
      imageURL: json['image'],
      id: json['id'],
    );
  }
}

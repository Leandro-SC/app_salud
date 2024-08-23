class Therapy {
  final String id;
  final String title;
  final String description;

  Therapy({required this.id, required this.title, required this.description});

  factory Therapy.fromJson(Map<String, dynamic> json) {
    return Therapy(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
    );
  }
}

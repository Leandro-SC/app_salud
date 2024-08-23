class Resource {
  final String id;
  final String title;
  final String description;
  final String url;

  Resource({required this.id, required this.title, required this.description, required this.url});

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
    );
  }
}

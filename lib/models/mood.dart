class Mood {
  final String date;
  final String mood;

  Mood({required this.date, required this.mood});

  factory Mood.fromJson(Map<String, dynamic> json) {
    return Mood(
      date: json['date'],
      mood: json['mood'],
    );
  }
}

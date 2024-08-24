class Appointment {
  final String id;
  final String therapistName;
  final String date;

  Appointment({required this.id, required this.therapistName, required this.date, required DateTime dateTime, required String professionalId});

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['_id'],
      therapistName: json['therapistName'],
      date: json['date'],
    );
  }
}

class AppointmentDate {
  final DateTime dateTime;
  final String type; // 'in_person' o 'video_call'
  final String professionalId;

  AppointmentDate({required this.dateTime, required this.type, required this.professionalId});
}

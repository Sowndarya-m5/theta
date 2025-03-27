class Event {
  final String title;
  final String description;
  final String date;
  final String time;
  final String venue;
  final String imageUrl;
  final String organizer;
  final String registrationUrl;
  final String clusterName;
  final String actualDate; // ✅ Added actualDate field

  Event({
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.venue,
    required this.imageUrl,
    required this.organizer,
    required this.registrationUrl,
    required this.clusterName,
    required this.actualDate, // ✅ Constructor updated
  });
}

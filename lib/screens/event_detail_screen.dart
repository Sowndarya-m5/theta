import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/event.dart';
import 'package:url_launcher/url_launcher.dart';
import '../services/utils.dart';

class EventDetailScreen extends StatelessWidget {
  final Event event;

  const EventDetailScreen({Key? key, required this.event}) : super(key: key);

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    final Color color = utils.color;
    Size size = utils.getScreenSize;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          event.title,
          style: GoogleFonts.montserrat(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: TweenAnimationBuilder(
        duration: Duration(milliseconds: 600),
        tween: Tween<double>(begin: 0.8, end: 1),
        curve: Curves.easeOut,
        builder: (context, double scale, child) {
          return Transform.scale(
            scale: scale,
            child: Opacity(
              opacity: scale,
              child: child,
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ✅ Event Image with Animation
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  event.imageUrl,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),

              // ✅ Event Title
              Text(
                event.title,
                style: GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.bold, color: color),
                textAlign: TextAlign.center,
              ),

              // ✅ Event Organizer
              SizedBox(height: 8),
              Text(
                "Organized by: ${event.organizer}",
                style: GoogleFonts.lora(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),
              ),

              // ✅ Date, Time, Venue (in a Row)
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconText(icon: Icons.date_range, text: event.actualDate, iconColor: Colors.blue),
                  IconText(icon: Icons.access_time, text: event.time, iconColor: Colors.green),
                  IconText(icon: Icons.location_on, text: event.venue, iconColor: Colors.red),
                ],
              ),

              SizedBox(height: 16),

              // ✅ Event Description
              Text("Description", style: GoogleFonts.montserrat(fontSize: 20, color: color)),
              Text(event.description, style: GoogleFonts.lora(fontSize: 16, color: Colors.grey)),

              Spacer(),

              // ✅ Register Button Logic
              Center(
                child: ElevatedButton(
                  onPressed: event.registrationUrl.isNotEmpty
                      ? () => _launchURL(event.registrationUrl)
                      : null, // Disabled if no link
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    textStyle: GoogleFonts.lora(fontSize: 18, fontWeight: FontWeight.bold),
                    backgroundColor: event.registrationUrl.isNotEmpty ? Colors.blue : Colors.grey,
                  ),
                  child: Text(event.registrationUrl.isNotEmpty ? "Register Now" : "Stay Tuned", style: GoogleFonts.lora(color: Colors.black),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ✅ Reusable Widget for Icon + Text
class IconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const IconText({Key? key, required this.icon, required this.text, required this.iconColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: iconColor),
        SizedBox(width: 5),
        Text(text, style: GoogleFonts.lora(fontSize: 16, fontWeight: FontWeight.w500)),
      ],
    );
  }
}

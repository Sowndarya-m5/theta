import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/event.dart';
import '../services/utils.dart';

class EventDetailScreen extends StatelessWidget {
  final Event event;

  const EventDetailScreen({Key? key, required this.event}) : super(key: key);

  void _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final Color color = utils.color;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          event.title,
          style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: TweenAnimationBuilder(
        duration: const Duration(milliseconds: 600),
        tween: Tween<double>(begin: 0.8, end: 1),
        curve: Curves.easeOut,
        builder: (context, double scale, child) {
          return Transform.scale(
            scale: scale,
            child: Opacity(opacity: scale, child: child),
          );
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ✅ Image Slideshow
                imageSlideshow(event.imageUrl, size.width),

                SizedBox(height: size.height * 0.02),

                // ✅ Event Title
                Text(
                  event.title,
                  style: GoogleFonts.poppins(
                      fontSize: size.width * 0.06,
                      fontWeight: FontWeight.bold,
                      color: color),
                  textAlign: TextAlign.center,
                ),

                // ✅ Event Organizer
                SizedBox(height: size.height * 0.01),
                Text(
                  "Organized by: ${event.organizer}",
                  style: GoogleFonts.poppins(
                      fontSize: size.width * 0.04,
                      fontWeight: FontWeight.w500,
                      color:  Theme.of(context).brightness == Brightness.dark
                          ? Colors.white70
                          : Colors.black54,),
                ),

                // ✅ Date, Time, Venue
                SizedBox(height: size.height * 0.02),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ✅ Time & Date in One Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconText(
                          icon: Icons.access_time,
                          text: event.time,
                          iconColor: Colors.green,
                          textColor: color,
                        ),
                        IconText(
                          icon: Icons.date_range,
                          text: event.actualDate,
                          iconColor: Colors.blue,
                          textColor: color,
                        ),
                      ],
                    ),

                    SizedBox(height: 8), // Space between time-date and venue

                    // ✅ Venue in New Line
                    IconText(
                      icon: Icons.location_on,
                      text: event.venue,
                      iconColor: Colors.red,
                      textColor: color,
                    ),
                  ],
                ),

                SizedBox(height: size.height * 0.02),

                // ✅ Event Description
                Text("Description",
                    style: GoogleFonts.poppins(
                        fontSize: size.width * 0.05, color: color)),
                Text(event.description,
                    style: GoogleFonts.poppins(
                        fontSize: size.width * 0.04, color:  Theme.of(context).brightness == Brightness.dark
                        ? Colors.white70
                        : Colors.black54,)),

                SizedBox(height: size.height * 0.03),

                // ✅ Register Button
                Center(
                  child: ElevatedButton(
                    onPressed: event.registrationUrl.isNotEmpty
                        ? () => _launchURL(event.registrationUrl)
                        : null, // Disabled if no link
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.2, vertical: 12),
                      textStyle: GoogleFonts.poppins(
                          fontSize: size.width * 0.045,
                          fontWeight: FontWeight.bold),
                      backgroundColor: event.registrationUrl.isNotEmpty
                          ? Colors.blue
                          : Colors.grey,
                    ),
                    child: Text(
                      event.registrationUrl.isNotEmpty
                          ? "Register Now"
                          : "Stay Tuned",
                      style: GoogleFonts.poppins(color: color),
                    ),
                  ),
                ),

                SizedBox(height: size.height * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ✅ Image Slideshow Method with A4 Aspect Ratio
Widget imageSlideshow(List<String> imageUrls, double screenWidth) {
  double a4Height = screenWidth * 1.414; // A4 aspect ratio (1:1.414)

  return SizedBox(
    height: a4Height,
    child: PageView.builder(
      itemCount: imageUrls.length,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            imageUrls[index],
            width: double.infinity,
            height: a4Height,
            fit: BoxFit.fill,
          ),
        );
      },
    ),
  );
}



// ✅ Reusable Widget for Icon + Text
class IconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  final Color textColor;

  const IconText(
      {Key? key,
        required this.icon,
        required this.text,
        required this.iconColor,
        required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width * 0.04;
    return Row(
      children: [
        Icon(icon, size: fontSize * 1.2, color: iconColor),
        SizedBox(width: 5),
        Text(text,
            style: GoogleFonts.poppins(
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
                color: textColor)),
      ],
    );
  }
}

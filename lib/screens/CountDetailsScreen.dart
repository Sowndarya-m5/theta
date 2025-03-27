import 'package:flutter/material.dart';
import 'package:flutter_flip_clock/flutter_flip_clock.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/utils.dart';

class FullDetailsScreen extends StatefulWidget {
  final String eventName;
  final DateTime eventDate;
  final String eventImageUrl;
  final List<Map<String, String>> students;

  const FullDetailsScreen({
    Key? key,
    required this.eventName,
    required this.eventDate,
    required this.eventImageUrl,
    required this.students, // List of students
  }) : super(key: key);

  @override
  _FullDetailsScreenState createState() => _FullDetailsScreenState();
}

class _FullDetailsScreenState extends State<FullDetailsScreen> {
  late Duration timeRemaining;

  @override
  void initState() {
    super.initState();
    timeRemaining = widget.eventDate.difference(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {

    final Utils utils = Utils(context);
    // ignore: unused_local_variable
    final themeState = utils.getTheme;
    // ignore: unused_local_variable
    final Color color = Utils(context).color;
    // ignore: unused_local_variable
    Size size = Utils(context).getScreenSize;


    int days = timeRemaining.inDays;
    int hours = timeRemaining.inHours % 24;
    int minutes = timeRemaining.inMinutes % 60;
    int seconds = timeRemaining.inSeconds % 60;

    return Scaffold(
      appBar: AppBar(title: Text(widget.eventName,
          style: GoogleFonts.montserrat(
          color: color,
          fontWeight: FontWeight.w400,
          fontSize: 20,
      ),
      ),
    ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Event Image
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  widget.eventImageUrl,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 20),
        
              // Event Name
              Text(
                widget.eventName,
                style: GoogleFonts.montserrat(fontSize: 26, fontWeight: FontWeight.bold, color: color),
              ),
              SizedBox(height: 20),
        
              // Countdown Timer
              Column(
                children: [
                  Text(
                    "$days Days",
                    style: GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.bold,color: color),
                  ),
                  SizedBox(height: 8),
                  FlipClock.reverseCountdown(
                    duration: Duration(hours: hours, minutes: minutes, seconds: seconds),
                    digitColor: Colors.black,
                    backgroundColor: Colors.white,
                    digitSize: 30,
                    borderRadius: BorderRadius.circular(5),
                  ),

                ],
              ),
              SizedBox(height: 20),
              // Display 3 Students
              Column(
                children: widget.students.map((student) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              student['name']!,
                              style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.bold, color:color ),
                            ),
                            Text(
                              "Role: ${student['rollNumber']}",
                              style: GoogleFonts.lora(fontSize: 16, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
        
        
        
            ],
          ),
        ),
      ),
    );
  }
}

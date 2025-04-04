import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/event.dart';
import '../screens/event_detail_screen.dart';

class TimelineItem extends StatelessWidget {
  final Event event;
  final bool isLeft;

  TimelineItem({required this.event, required this.isLeft, Key? key}) : super(key: key);

  final List<Color> colors = [
    Colors.blueAccent,
    Colors.redAccent,
    Colors.orangeAccent,
    Colors.purpleAccent,
    Colors.deepOrangeAccent,
    Colors.deepPurpleAccent,
    Colors.indigoAccent,
    Colors.pinkAccent,
    Colors.brown,
    Colors.blueGrey,
    Colors.indigo,
    Colors.deepPurple,
    Colors.teal,
    Colors.lightGreen,
    Colors.orange,
    Colors.deepOrange,
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.green,
  ];



  @override
  Widget build(BuildContext context) {
    Color boxColor = colors[Random().nextInt(colors.length)]; // Assign a random color

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isLeft) Expanded(child: Container()), // Space for alternating effect

        Container(
          width: MediaQuery.of(context).size.width * 0.45,
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: boxColor, // Unique color for each box
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: Text(event.clusterName, style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold))),
              const SizedBox(height: 5),
              Center(child: Text(event.title, style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold))),
              const SizedBox(height: 5),
              Center(child: Text(event.time, style: GoogleFonts.poppins(color: Colors.white70))),
              const SizedBox(height: 10),

              // View More Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EventDetailScreen(event: event)),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // White button
                  foregroundColor: boxColor, // Text color same as box
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Text("View More", style: GoogleFonts.poppins(fontSize: 17),),
              ),
            ],
          ),
        ),

        if (!isLeft) Expanded(child: Container()), // Space for alternating effect
      ],
    );
  }
}

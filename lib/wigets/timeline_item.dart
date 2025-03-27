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
    Colors.amberAccent,
    Colors.deepOrangeAccent,
    Colors.deepPurpleAccent,
    Colors.indigoAccent,
    Colors.pinkAccent,
    Colors.yellowAccent,
    Colors.lightGreenAccent,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey,
    Colors.indigo,
    Colors.deepPurple,
    Colors.teal,
    Colors.lightGreen,
    Colors.lime,
    Colors.amber,
    Colors.orange,
    Colors.deepOrange,
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.blue,
    Colors.green,
  ];



  @override
  Widget build(BuildContext context) {
    Color boxColor = colors[Random().nextInt(colors.length)]; // Assign a random color

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isLeft) Expanded(child: Container()), // Space for alternating effect

        GestureDetector(
          onHorizontalDragEnd: (details) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EventDetailScreen(event: event)),
            );
          },
          child: Container(
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
                Text(event.clusterName, style: GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text(event.title, style: GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text(event.time, style: GoogleFonts.montserrat(color: Colors.white70)),
              ],
            ),
          ),
        ),

        if (!isLeft) Expanded(child: Container()), // Space for alternating effect
      ],
    );
  }
}

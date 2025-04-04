import 'package:flutter/material.dart';
import 'package:flutter_flip_clock/flutter_flip_clock.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'CountDetailsScreen.dart';

class CountdownCard extends StatefulWidget {
  final String eventName;
  final DateTime eventDate;
  final String eventImageUrl;
  final List<Map<String, String>> students;

  const CountdownCard({
    Key? key,
    required this.eventName,
    required this.eventDate,
    required this.eventImageUrl,
    required this.students,
  }) : super(key: key);

  @override
  _CountdownCardState createState() => _CountdownCardState();
}

class _CountdownCardState extends State<CountdownCard>
    with SingleTickerProviderStateMixin {
  late Duration timeRemaining;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    timeRemaining = widget.eventDate.difference(DateTime.now());

    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
      lowerBound: 0.9,
      upperBound: 1.0,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.9,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int days = timeRemaining.inDays;
    int hours = timeRemaining.inHours % 24;
    int minutes = timeRemaining.inMinutes % 60;
    int seconds = timeRemaining.inSeconds % 60;

    List<Color> cardColors = [

      Color(0xFF4DB6AC), // Mint Teal
      Color(0xFF7986CB), // Soft Blue
      Color(0xFFFFD54F), // Golden Yellow

    ];
    Color boxColor =
    cardColors[widget.eventName.length % cardColors.length];

    return GestureDetector(
      onTapDown: (_) => _controller.reverse(),
      onTapUp: (_) => _controller.forward(),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          padding: EdgeInsets.all(14),
          margin: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: boxColor,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 6, spreadRadius: 2),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      widget.eventImageUrl,
                      height: MediaQuery.of(context).size.width * 0.25,
                      width: MediaQuery.of(context).size.width * 0.22,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "$days Days",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 6),
                      FlipClock.reverseCountdown(
                        duration: Duration(
                          hours: hours,
                          minutes: minutes,
                          seconds: seconds,

                        ),
                        digitColor: Colors.black,
                        backgroundColor: Colors.white,
                        digitSize: 25,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                widget.eventName,
                style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              // SizedBox(height: 10),
              // Center(
              //   child: GestureDetector(
              //     onTap: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => FullDetailsScreen(
              //             eventName: widget.eventName,
              //             eventImageUrl: widget.eventImageUrl,
              //             students: widget.students,
              //             eventDate: widget.eventDate,
              //           ),
              //         ),
              //       );
              //     },
              //     child: AnimatedContainer(
              //       duration: Duration(milliseconds: 600),
              //       curve: Curves.easeOutBack,
              //       width: MediaQuery.of(context).size.width * 0.4,
              //       height: 35,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(12),
              //         // boxShadow: [
              //         //   BoxShadow(
              //         //     color: Colors.pink.withOpacity(0.4),
              //         //     blurRadius: 15,
              //         //     spreadRadius: 3,
              //         //   ),
              //         // ],
              //       ),
              //       alignment: Alignment.center,
              //       child: Shimmer.fromColors(
              //         baseColor: Colors.white,
              //         highlightColor: Colors.pinkAccent,
              //         child: Text(
              //           "View More",
              //           style: GoogleFonts.poppins(
              //             fontSize: 18,
              //             fontWeight: FontWeight.bold,
              //             color: Colors.white,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

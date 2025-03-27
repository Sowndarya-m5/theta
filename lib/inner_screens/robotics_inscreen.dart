import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../models/Robo_model.dart';
import '../screens/robo_screen.dart';
import '../services/utils.dart';
import '../wigets/text_widget.dart';

// ignore: must_be_immutable
class RoboInScreen extends StatelessWidget {
  RoboInScreen({Key? key}) : super(key: key);

  static List<String> Name = [
    //"Grace and Gleam",
  ];
  static List url = [
    //"asset/pexels-photo-13595689.jpeg",
  ];
  static List reglink = [
    // "https://forms.gle/YzKZTvcNYgYNpPV28",
  ];

  static List BoxColor = [
    //Color(0xFFFAE6D5),
  ];

  static List<String> desc = [
    //"Handmade with love, worn with pride. Bring your imagination into creation !. Embark on a journey of self-expression through jewelry making, where every design is a reflection of your individuality. Learn the art of shaping metals and stones into timeless treasures, guided by expert artisans. Join us and uncover the joy of creating wearable art that resonates with your soul.",
  ];
  static List<String> cname = [
    //"Equilibria Present Workshop",
  ];
  static List<String> date = [
    //"15.3.2025",
  ];
  static List<String> time = [
    //"9:30 AM - 4:30 PM",
  ];
  static List<String> venue = [
    //"201",
  ];
  static List coname = [
    //"JOOSHINI S",
  ];


  final List<RoboDataModel> robo = List.generate(
      Name.length,
      (index) => RoboDataModel('${Name[index]}', '${url[index]}',
          '${desc[index]}', '${BoxColor[index]}', '${cname[index]}',
          '${date[index]}',
          '${time[index]}',
          '${venue[index]}',
        '${reglink[index]}','${coname[index]}',
      ));

  // 🔹 Function to check if event is expired
  bool isEventUpcoming(String date, String time) {
    DateTime now = DateTime.now();
    DateTime eventDateTime = DateFormat("dd.MM.yyyy hh:mm a").parse("$date $time");

    return eventDateTime.isAfter(now); // Returns true if event is in the future
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    double _screenwidth = MediaQuery.of(context).size.width;

    // 🔹 Filter workshops and events based on date/time
    List<RoboDataModel> events = robo.where((item) => item.cname.contains("Events") && isEventUpcoming(item.date, item.time)).toList();
    List<RoboDataModel> workshops = robo.where((item) => item.cname.contains("Workshop") && isEventUpcoming(item.date, item.time)).toList();

    return DefaultTabController(
        length: 2,
        child: Scaffold(
      appBar: AppBar(
        leading: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            IconlyLight.arrowLeft2,
            color: color,
          ),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          "workshop and events",
          style: GoogleFonts.montserrat(
            color: color,
            fontSize: 24,
          ),
        ),bottom: TabBar(
        labelColor: color,
        indicatorColor: color,
        tabs: [
          Tab(text: "Events"),
          Tab(text: "Workshops"),

        ],
      ),
      ),
          body: TabBarView(
            children: [
              _buildGridView(events, _screenwidth, "No events available"),
              _buildGridView(workshops, _screenwidth, "No workshops available"),
            ],
          ),
        ),
    );
  }

  Widget _buildGridView(List<RoboDataModel> data, double screenWidth, String emptyMessage) {
    if (data.isEmpty) {
      return Center(
        child: Text(
          emptyMessage,
          style: GoogleFonts.lora(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      );
    }

    return GridView.builder(
      itemCount: data.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        crossAxisSpacing: 20,
        mainAxisSpacing: 30,
        childAspectRatio: 250 / 250,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => RoboDetails(roboDataModel: data[index]),
              ),
            );
          },
          child: Container(
            width: 150,
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: BoxColor[index],
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5), // Shadow color
                  offset: Offset(4, 4), // Shadow position (3D effect)
                  blurRadius: 6,
                ),
                BoxShadow(
                  color: Colors.white.withOpacity(0.6), // Light source effect
                  offset: Offset(-3, -3),
                  blurRadius: 6,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  data[index].cname,
                  style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 19),
                ),
                Container(
                  height: screenWidth * 0.625,
                  width: screenWidth * 0.99,
                  child: Image.asset(
                    data[index].ImageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  data[index].name,
                  style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 19),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../models/mathe_model.dart';
import '../screens/mm_screen.dart';
import '../services/utils.dart';
import '../wigets/text_widget.dart';

// ignore: must_be_immutable
class MMInScreen extends StatelessWidget {
  MMInScreen({Key? key}) : super(key: key);

  static List<String> Name = [
    "MYSTIC MIND",
    "RHYTHM QUEST",
    "NUMBER NINJAS",
  ];

  static List<String> reglink = [
    "https://forms.gle/YzKZTvcNYgYNpPV28",
    "https://forms.gle/v3cZoUYm1aTM71aS6",
    "https://forms.gle/YzKZTvcNYgYNpPV28",
  ];

  static List url = [
    "asset/pexels-photo-354962.jpeg",
    "asset/camer.jpg",
    "asset/bbing.jpg",
  ];

  static List BoxColor = [
    Color(0xffF7A593),
    Color(0xffF8A44c),
    Color(0xffD3B0E0),
  ];

  static List<String> desc = [
    " Round 1 - Link & lens \n Round 2 - Touch it..fell it...find it... \n Round 3 - Paper tower panic ", //waiting
    " Round 1 - Pass The flow, let it go \n Round 2 - Lyrics gone, sing it strong \n Round 3 - Tackle the task, crack the clue ", //waiting
    " Round 1 - Brain Age\n Round 2 -  Who Wants to be a millionaire? \n Round 3 - Lock Cracker ", //waiting
  ];
  static List<String> cname = [
    "Mathematica present Events",
    "Mathematica present Events",
    "Mathematica present Events",
  ];
  static List<String> date = [
    "11.4.2025",
    "12.4.2025",
    "12.4.2025",
  ];
  //waiting
  static List<String> time = [
    "9:30 AM - 4:30 PM",
    "9:30 AM - 4:30 PM",
    "9:30 AM - 4:30 PM",
  ];
  //waiting
  static List<String> venue = [
    "201",
    "Ground",
    "401",
  ];

  static List coname = [
    "JOOSHINI S",
    "AFREEN BANU T",
    "SOWMIYA R",//waiting
  ];

  final List<MMDataModel> mm = List.generate(
      Name.length,
      (index) => MMDataModel('${Name[index]}', '${url[index]}',
          '${desc[index]}', '${BoxColor[index]}', '${cname[index]}',
          '${date[index]}',
          '${time[index]}',
          '${venue[index]}', '${reglink[index]}','${coname[index]}',));

  bool isEventUpcoming(String date, String time) {
    try {
      DateTime now = DateTime.now();

      // Extract only the start time (before '-')
      String startTime = time.split("-")[0].trim();

      // Define the correct date format
      DateFormat inputFormat = DateFormat("d.M.yyyy h:mm a");

      // Parse the event's start date and time
      DateTime eventDateTime = inputFormat.parse("$date $startTime");

      // Keep the event details visible for 40 minutes after it starts
      DateTime eventExpiryTime = eventDateTime.add(Duration(minutes: 20));

      return eventExpiryTime.isAfter(now); // True if event is still valid
    } catch (e) {
      print("Error parsing date/time: $e");
      return false; // Default to false if there's an error
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    double _screenwidth = MediaQuery.of(context).size.width;

    // 🔹 Filter workshops and events based on date/time
    List<MMDataModel> events = mm.where((item) => item.cname.contains("Events") && isEventUpcoming(item.date, item.time)).toList();
    List<MMDataModel> workshops = mm.where((item) => item.cname.contains("Workshop") && isEventUpcoming(item.date, item.time)).toList();

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
            style: GoogleFonts.poppins(
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

  Widget _buildGridView(List<MMDataModel> data, double screenWidth, String emptyMessage) {
    if (data.isEmpty) {
      return Center(
        child: Text(
          emptyMessage,
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
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
                builder: (context) => MMDetails(mmDataModel: data[index]),
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
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 19),
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
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 19),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

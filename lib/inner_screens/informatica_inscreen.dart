import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../models/informaica_model.dart';
import '../screens/inform_screen.dart';
import '../services/utils.dart';
import '../wigets/text_widget.dart';

// ignore: must_be_immutable
class InfInScreen extends StatelessWidget {
  InfInScreen({Key? key}) : super(key: key);

  static List<String> Name = [
    "TECH THON",
    "CODE MASTER",
    "TECH TALENT",
  ];
  static List url = [
    "asset/mobile.webp",
    "asset/idea.jpg",
    "asset/mobile.webp",
  ];
  static List reglink = [
    "https://forms.gle/YzKZTvcNYgYNpPV28",
    "https://forms.gle/v3cZoUYm1aTM71aS6",
    "https://forms.gle/YzKZTvcNYgYNpPV28",
  ];

  static List BoxColor = [
    Color(0xFFEFCFE7),
    Color(0xffF7A593),
    Color(0xffD3B0E0),
  ];

  static List<String> desc = [
    " Round 1 -  \n Round 2 -  \n Round 3 -  ", //waiting
    " Round 1 -  \n Round 2 -  \n Round 3 -  ", //waiting
    " Round 1 -  \n Round 2 -  \n Round 3 -  ", //waiting
  ];
  static List<String> cname = [
    "Informatica Present Events",
    "Informatica Present Events",
    "Informatica Present Events",
  ];
  static List<String> date = [
    "11.4.2025",
    "12.4.2025",
    "13.4.2025",
  ];
  //waiting
  static List<String> time = [
    "9:30 AM - 4:30 PM",
    "9:30 AM - 4:30 PM",
    "9:30 AM - 4:30 PM",
  ];
  static List<String> venue = [
    "Lab 1",
    "Lab 2",
    "Lab 2",
  ];

  static List coname = [
    "RAMAGURU S",
    "SHOBIA R",
    "RAJASRI S",
  ];

  final List<InfDataModel> inf = List.generate(
      Name.length,
      (index) => InfDataModel(
          '${Name[index]}',
          '${url[index]}',
          '${desc[index]}',
          '${BoxColor[index]}',
          '${cname[index]}',
          '${date[index]}',
          '${time[index]}',
          '${venue[index]}',
        '${reglink[index]}','${coname[index]}',
      ));

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
    List<InfDataModel> events = inf.where((item) => item.cname.contains("Events") && isEventUpcoming(item.date, item.time)).toList();
    List<InfDataModel> workshops = inf.where((item) => item.cname.contains("Workshop") && isEventUpcoming(item.date, item.time)).toList();

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

  Widget _buildGridView(List<InfDataModel> data, double screenWidth, String emptyMessage) {
    if (data.isEmpty) {
      return Center(
        child: Text(
          emptyMessage,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
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
                builder: (context) => InfDetails(infDataModel: data[index]),
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
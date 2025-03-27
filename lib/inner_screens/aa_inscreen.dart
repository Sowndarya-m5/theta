import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../models/aa_model.dart';
import '../screens/aa_screen.dart';
import '../services/utils.dart';
import '../wigets/text_widget.dart';

class aaInScreen extends StatelessWidget {
  aaInScreen({Key? key}) : super(key: key);

  static List<String> Name = [
    "MYSTIC FABLES",
    "F CUBE",
    "Event 3", //waiting
  ];
  //waiting
  static List url = [
    "asset/pexels-photo-354962.jpeg",
    "asset/camer.jpg",
    "asset/bbing.jpg",
  ];

  static List BoxColor = [
    Color(0xFFFBDCDA),
    Color(0xFFD4EEF3),
    Color(0xFFFAE6D5),
  ];

  static List<String> desc = [
    " Round 1 - Balloon bluster \n Round 2 - Play with english \n Round 3 - Pyramid puzzle",
    " Round 1 - Find \n Round 2 - Fetch \n Round 3 - Fun ",
    " Round 1 -  \n Round 2 -  \n Round 3 -  ", //waiting
  ];
  static List<String> cname = [
    "Access India present Events",
    "Access India present Events",
    "Access India present Events",
  ];
  static List<String> date = [
    "11.4.2025",
    "12.4.2025",
    "12.4.2025", //waiting
  ];
  static List<String> time = [
    "9:30 AM - 12:30 PM",
    "9:30 AM - 12:30 PM",
    "7:30 AM - 4:30 PM", //waiting
  ];
  static List<String> venue = [
    "310",
    "Drawing Hall",
    "401",//waiting
  ];
  static List<String> reglink = [
    "https://forms.gle/YzKZTvcNYgYNpPV28",
    "https://forms.gle/v3cZoUYm1aTM71aS6",
    "https://forms.gle/YzKZTvcNYgYNpPV28",
  ];
  static List coname = [
    "JOOSHINI S",
    "AFREEN BANU T",
    "SOWMIYA R",//waiting
  ];

  final List<aaDataModel> aa = List.generate(
    Name.length,
        (index) => aaDataModel(
      '${Name[index]}',
      '${url[index]}',
      '${desc[index]}',
      '${BoxColor[index]}',
      '${cname[index]} ',
      '${date[index]}',
      '${time[index]}',
      '${venue[index]}',
          '${reglink[index]}','${coname[index]}',
    ),
  );

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
    List<aaDataModel> events = aa.where((item) => item.cname.contains("Events") && isEventUpcoming(item.date, item.time)).toList();
    List<aaDataModel> workshops = aa.where((item) => item.cname.contains("Workshop") && isEventUpcoming(item.date, item.time)).toList();

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
            "Workshops and Events",
            style: GoogleFonts.montserrat(
              color: color,
              fontSize: 24,
            ),
          ),

          bottom: TabBar(
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

  Widget _buildGridView(List<aaDataModel> data, double screenWidth, String emptyMessage) {
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
                builder: (context) => aaDetails(AADataModel: data[index]),
              ),
            );
          },
          child: Container(
            width: 150,
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration:             BoxDecoration(
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
                  style: GoogleFonts.lora(fontWeight: FontWeight.bold, fontSize: 19),
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
                  style: GoogleFonts.lora(fontWeight: FontWeight.bold, fontSize: 19),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

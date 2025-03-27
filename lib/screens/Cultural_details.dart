import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/cultural_model.dart';
import '../services/utils.dart';
import 'package:flutter/services.dart';

class CulturalDetails extends StatefulWidget {
  final CulturalDataModel culturalDataModel;
  const CulturalDetails({Key? key, required this.culturalDataModel})
      : super(key: key);

  @override
  State<CulturalDetails> createState() => _culturalDetailsState();
}

class _culturalDetailsState extends State<CulturalDetails> {

  DateTime registrationDeadline = DateTime(2025, 3, 7, 22, 34); // March 7, 2025, 3:59 PM

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  static List<String> Namec3 = ["Dance", "Music"];
  static List urlc3 = ["asset/cultural/dance.gif", "asset/cultural/music.gif"];
  static List BoxColorc3 = [Color(0xFFFBDCDA), Color(0xFFD4EEF3)];
  static List<String> descc3 = [
    "Dance Cultural College Cluster celebrates diverse dance forms, fostering creativity, expression, and cultural appreciation through performance, education, and community engagement.",
    "Immerse in a harmonious symphony of cultures at our college's vibrant music festival, where diverse melodies unite hearts and minds.",
  ];
  static List<String> reglink3 = [
    "https://forms.gle/YzKZTvcNYgYNpPV28",
    "https://forms.gle/v3cZoUYm1aTM71aS6",
  ];
  static List<List<String>> HeadNamesc3 = [
    ["Pravin S", "Naveshni B M", "Vikash E", "Kiruthiga K M"],
    ["Inbarajan K", "Joice Mendora M", "Yuvasree G R"],
  ];
  static List<List<String>> HeadClassc3 = [
    ["III - B.Com A", "III - BBA", "II - B.Sc Maths", "III - B.Sc Physics"],
    ["II - BCA B", "II - B.Com C", "II - B.Sc Micro"],
  ];
  static List<List<String>> HeadContactc3 = [
    ["6381163601", "9487328809", "9025246703", "8098538644"],
    ["6381719697", "9360945479", "9080485072"],
  ];
  final List<CulturalDataModel> cultural = List.generate(
    Namec3.length,
        (index) => CulturalDataModel(
      '${Namec3[index]}',
      '${urlc3[index]}',
      '${BoxColorc3[index]}',
      '${descc3[index]}',
      '${reglink3[index]}',
      '${HeadNamesc3[index]}',
      '${HeadClassc3[index]}',
      '${HeadContactc3[index]}',
    ),
  );


  @override
  Widget build(BuildContext context) {

    DateTime now = DateTime.now();
    bool isRegistrationClosed = now.isAfter(registrationDeadline);

    // Corrected: Format the time properly with AM/PM
    String formattedDeadline = DateFormat('hh:mm a').format(registrationDeadline);


    final Utils utils = Utils(context);
    // ignore: unused_local_variable
    final themeState = utils.getTheme;
    // ignore: unused_local_variable
    final Color color = Utils(context).color;
    // ignore: unused_local_variable
    Size size = Utils(context).getScreenSize;
    return Scaffold(
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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Text(
                          widget.culturalDataModel.name,
                          textAlign: TextAlign.start,
                          style: GoogleFonts.montserrat(
                            color: color,
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 200,
                width: 580,
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 200,
                      //width: 150,
                      margin: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            widget.culturalDataModel.ImageUrl,
                            height: 150,
                            width: 150,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 18),
            Padding(
              padding: EdgeInsets.all(11),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: GoogleFonts.montserrat(
                      color: color,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 18),
                  Text(
                    widget.culturalDataModel.desc,
                    style: GoogleFonts.lora(
                      color: color,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.all(11),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ExpansionTile(
                    initiallyExpanded: false,
                    title: Text(
                      'Committee Heads',
                      style: GoogleFonts.montserrat(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                    children: [
                      Builder(
                        builder: (context) {
                          int index = Namec3.indexOf(widget.culturalDataModel.name);

                          if (index == -1) {
                            return Center(
                              child: Text(
                                "No data available",
                                style: GoogleFonts.lora(fontSize: 18, color: color),
                              ),
                            );
                          }

                          return Column(
                            children: List.generate(
                              HeadNamesc3[index].length,
                                  (i) => Padding(
                                padding: EdgeInsets.only(bottom: 12.0),
                                child: Container(
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                      colors: [Colors.deepPurple.shade50, Colors.white],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.deepPurple.shade400,
                                        blurRadius: 5,
                                        offset: Offset(2, 3),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.person, color: Colors.deepPurple, size: 50),
                                      SizedBox(height: 10),
                                      Text(
                                        HeadNamesc3[index][i],
                                        style: GoogleFonts.montserrat(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        HeadClassc3[index][i],
                                        style: GoogleFonts.lora(fontSize: 18, color: Colors.grey[700]),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            HeadContactc3[index][i],
                                            style: GoogleFonts.lora(fontSize: 18, color: Colors.black87),
                                          ),
                                          SizedBox(width: 8),
                                          GestureDetector(
                                            onTap: () {
                                              Clipboard.setData(
                                                ClipboardData(text: HeadContactc3[index][i]),
                                              );
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  content: Text("Phone number copied!",
                                                    style: GoogleFonts.lora(fontSize: 18, color: Colors.black87),
                                                  ),
                                                  duration: Duration(seconds: 1),
                                                ),
                                              );
                                            },
                                            child: Icon(Icons.copy, color: Colors.blue, size: 24),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 50),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: isRegistrationClosed
                      ? Text(
                    "❌ Registration Closed!",
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  )
                      : ElevatedButton(
                    onPressed: () async {
                      String googleFormUrl =  widget.culturalDataModel.reglink; // Replace with actual link
                      if (await canLaunch(googleFormUrl)) {
                        await launch(googleFormUrl);
                      } else {
                        throw "Could not launch $googleFormUrl";
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Register Now",
                          style: GoogleFonts.lora(fontSize: 18, color: Colors.white),
                        ),
                        Text(
                          "(Closes at: $formattedDeadline)",
                          style: GoogleFonts.lora(fontSize: 14, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

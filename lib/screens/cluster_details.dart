import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/cluster_model.dart';

import '../services/global_method.dart';
import '../services/utils.dart';

import 'package:flutter/services.dart';

class ClusterDetails extends StatefulWidget {
  final ClusterDataModel clusterDataModel;
  const ClusterDetails({Key? key, required this.clusterDataModel})
      : super(key: key);

  @override
  State<ClusterDetails> createState() => _ClusterDetailsState();
}

class _ClusterDetailsState extends State<ClusterDetails> {

  DateTime registrationDeadline = DateTime(2025, 3, 7, 22, 34); // March 7, 2025, 3:59 PM

  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  static List<String> Name = [
    "Access India",
    "Biogenesis",
    "Electronica",
    "Informatica",
    "Mathematica",
    "Optica",
    "Robotics",
    "Sportiva",
    "Strategia",
  ];
  static List url = [
    "asset/clusterlogo/A.I.png",
    "asset/clusterlogo/biogenesis1.png",
    "asset/clusterlogo/Electronica Logo.png",
    "asset/clusterlogo/INFORMATICA Logo.png",
    "asset/clusterlogo/Mathematica Logo.png",
    "asset/clusterlogo/Optica Logo.png",
    "asset/clusterlogo/ROBOTICS CLUSTER_KA_LOGO (1).png",
    "asset/clusterlogo/Sportiva Logo.png",
    "asset/clusterlogo/Strategia Logo.jpg",
  ];
  static List BoxColor = [
    Color(0xFFFBDCDA),
    Color(0xFFD4EEF3),
    Color(0xFFFAE6D5),
    Color(0xFFEFCFE7),
    Color(0xffF7A593),
    Color(0xffF8A44c),
    Color(0xffD3B0E0),
    Color(0xffFDE598),
    Color(0xFFFBDCDA),
  ];
  static List<String> desc = [
    "Access India Cluster helps students strengthen their ability to work together, communicate effectively, and think creatively. It creates an environment where students learn to adapt, lead, and solve challenges as a team.",
    "Biogenesis Cluster explores the fascinating world of life sciences, covering topics like biotechnology, genetics, and molecular biology. It helps students understand the building blocks of life and discover advancements shaping the future of biology.",
    "Electronica Cluster focuses on the world of electronics, guiding students through circuits, microcontrollers, and innovative electronic systems. It explores the latest trends in electronic design and technology.",
    "Informatica is a student-run organization focused on bringing together like-minded individuals interested in computer science and technology. The club aims to provide its members with opportunities to develop their technical skills, participate in coding competitions, network with industry professionals, and learn about emerging trends in the field",
    "Mathematica Cluster delves into the world of numbers and patterns, helping students explore mathematical concepts, problem-solving strategies, and logical thinking.",
    "Optica Cluster, powered by the Physics Department, accelerates your curiosity with momentum! Dive into the dynamics of motion, unravel the mysteries of quantum states, and reflect on the wonders of the universe—because here, every action sparks an equal and opposite reaction!",
    "Robotica Cluster dives into the field of robotics, offering students insights into robotic design, automation, and real-world applications. It helps students explore the latest advancements in technology and engineering.",
    "Sportiva Cluster promotes the spirit of sports and fitness, encouraging students to build strength, resilience, and teamwork through various athletic and recreational activities.",
    "Strategia Cluster, driven by the Commerce Department, sharpens your financial foresight and strategic perception! Master the art of market dynamics, balance the books of uncertainty, and calculate your next move with precision—because in strategy, every decision counts!",
  ];
  static List<String> reglink = [
    "https://forms.gle/YzKZTvcNYgYNpPV28",
    "https://forms.gle/v3cZoUYm1aTM71aS6",
    "https://forms.gle/YzKZTvcNYgYNpPV28",
    "https://forms.gle/YzKZTvcNYgYNpPV28",
    "https://forms.gle/YzKZTvcNYgYNpPV28",
    "https://forms.gle/YzKZTvcNYgYNpPV28",
    "https://forms.gle/YzKZTvcNYgYNpPV28",
    "https://forms.gle/YzKZTvcNYgYNpPV28",
    "https://forms.gle/YzKZTvcNYgYNpPV28",
  ];
  static List<List<String>> HeadName = [
    ["Akshobyan B", "Princy S"],
    ["Thamizhazhagan M", "Swathi N"],
    ["Vengatesh M", "Kotta Jeevan Chandra"],
    ["Sai K P", "Harini J", "Atchaya B"],
    ["Ashika S", " Vimal V"],
    ["Sreenidhi K", "Kavinilavan K"],
    ["Jai Akash D", "Giridharan B"],
    ["Srinivas C", "Sujitha A"],
    ["Madhumitha S", "Muthusona C"],
  ];
  static List<List<String>> HeadClass = [
    ["II - B.Tech ECE B", "III - B.Com A"],
    ["III - B.Sc Micro", "III - B.Sc Bio", ],
    ["III - B.Tech ECE B", "III - B.Tech ECE B"],
    ["III - B.Tech CSE A", "III - BCA C", "III - B.Sc CS B"],
    ["III - B.Sc MCA", "II - B.Sc MCA",],
    ["III - B.Sc Physics", "III - B.Sc Physics"],
    ["III - B.Tech ECE A", "III - B.Tech ECE B"],
    ["III - B.Com D", "III - B.Com D"],
    ["III - B.Com B", "III - BBA"],
  ];
  static List<List<String>> HeadContact = [
    ["9360332870", "7448334941"],
    ["7200084078", "9965916421"],
    ["6382531822", "8688808773"],
    ["8309117021", "9894806387", "9944453014"],
    ["8754382557", "9042422438"],
    ["8056642457", "8778327002"],
    ["7339583856", "6379715711"],
    ["8300175715", "7418848259"],
    ["6383429026", "9626889278"],
  ];
  final List<ClusterDataModel> Cluster = List.generate(
    Name.length,
        (index) => ClusterDataModel(
        '${Name[index]}',
        '${url[index]}',
        '${desc[index]}',
        '${BoxColor[index]}',
        '${reglink[index]}',
        '${HeadName[index]}', '${HeadClass[index]}','${HeadContact[index]}'
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
    // ignore: unused_local_variable
    GlobalMethods globalMethods = GlobalMethods();
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
                          widget.clusterDataModel.name,
                          textAlign: TextAlign.start,
                          style: GoogleFonts.montserrat(
                              color: color,
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              fontStyle: FontStyle.italic),
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
                      //width: 10,
                      margin: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ClipOval(
                            child: Image.asset(
                              widget.clusterDataModel.ImageUrl,
                              height: 150,
                              width: 150,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            //SizedBox(height:1),
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
                    widget.clusterDataModel.desc,
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
                          int index = Name.indexOf(widget.clusterDataModel.name);

                          if (index == -1) {
                            return Center(
                              child: Text(
                                "No data available",
                                style: GoogleFonts.lora(fontSize: 18, color: Colors.red),
                              ),
                            );
                          }

                          return Column(
                            children: List.generate(
                              HeadName[index].length,
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
                                        HeadName[index][i],
                                        style: GoogleFonts.montserrat(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        HeadClass[index][i],
                                        style: GoogleFonts.lora(fontSize: 18, color: Colors.grey[700]),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            HeadContact[index][i],
                                            style: GoogleFonts.lora(fontSize: 18, color: Colors.black87),
                                          ),
                                          SizedBox(width: 8),
                                          GestureDetector(
                                            onTap: () {
                                              Clipboard.setData(
                                                ClipboardData(text: HeadContact[index][i]),
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
            Padding(
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
                    String googleFormUrl =  widget.clusterDataModel.reglink; // Replace with actual link
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
                        style: GoogleFonts.montserrat(fontSize: 18, color: Colors.white),
                      ),
                      Text(
                        "(Closes at: $formattedDeadline)",
                        style: GoogleFonts.montserrat(fontSize: 14, color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

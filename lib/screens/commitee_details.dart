import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/committe_model.dart';

import '../services/utils.dart';
import 'package:flutter/services.dart';


class CommiteeDetails extends StatefulWidget {
  final CommiteeDataModel commiteeDataModel;

  const CommiteeDetails({Key? key, required this.commiteeDataModel})
    : super(key: key);

  @override
  State<CommiteeDetails> createState() => _CommiteeDetailsState();
}

class _CommiteeDetailsState extends State<CommiteeDetails> {
  DateTime registrationDeadline = DateTime(
    2025,
    3,
    7,
    22,
    34,
  ); // March 7, 2025, 3:59 PM

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  static List<String> Namec2 = [
    "Anchoring",
    'Artminds',
    'Creatives',
    'Crowd Control',
    'Finance',
    'Hospitality',
    'Infrastructure & Logistics',
    'Organising',
    'Public Relations',
    'Prize distribution',
    'Promotion & Outreach',
    'Scheduling',
    'Sponsorship',
    'Stall Management',
  ];
  static List urlc2 = [
    "asset/commitee/Anchoring.gif",
    'asset/commitee/Artminds.gif',
    'asset/commitee/Creatives.gif',
    'asset/commitee/crowd.gif',
    'asset/commitee/Finance.gif',
    'asset/commitee/Hospitality.gif',
    'asset/commitee/Infrastructure.gif',
    'asset/commitee/Organizing.gif',
    'asset/commitee/PR.gif',
    'asset/commitee/Prize distribution.gif',
    'asset/commitee/promotion.gif',
    'asset/commitee/Scheduling.gif',
    'asset/commitee/Sponsorship.gif',
    'asset/commitee/stall.gif',
  ];
  static List BoxColorc2 = [
    Color(0xFFFBDCDA),
    Color(0xFFD4EEF3),
    Color(0xFFFAE6D5),
    Color(0xFFEFCFE7),
    Color(0xffF7A593),
    Color(0xffF8A44c),
    Color(0xffD3B0E0),
    Color(0xffFDE598),
    Color(0xFFFBDCDA),
    Color(0xFFD4EEF3),
    Color(0xFFFAE6D5),
    Color(0xFFEFCFE7),
    Color(0xffF7A593),
    Color(0xFFFBDCDA),
  ];
  static List<String> descc2 = [
    "Manages the hosting and anchoring of the event. They prepare scripts, engage the audience, and ensure smooth transitions between different segments.",
    "A creative team that focuses on artistic elements like designing posters, creating digital content, and adding an artistic touch to the event’s branding.",
    "Focuses on designing and decorating the event venue, including stage setup, banners, backdrops, and other creative elements to enhance the event's look and feel.",
    "Ensures smooth movement of the audience, prevents overcrowding, and maintains discipline at the event venue for safety and order.",
    "Manages the budget, expenses, and financial transactions related to the event. They track income, allocate funds, and ensure financial transparency.",
    "Responsible for welcoming guests, speakers, and participants. They arrange accommodations, food, and transportation when needed.",
    "Takes care of venue setup, seating arrangements, power supply, sound systems, and other necessary logistics to ensure a smooth event flow.",
    "The backbone of the event, responsible for overall planning, coordination, and execution. They ensure smooth communication between different committees and handle any major decision-making.",
    "Handles external communication, including press releases, media coverage, and interactions with guests and dignitaries. They maintain the event’s public image",
    "Handles the procurement, arrangement, and distribution of prizes, awards, and certificates to winners and participants.",
    "Manages promotional campaigns, including social media marketing, posters, banners, and word-of-mouth publicity to attract participants and audiences",
    "Plans and finalizes the event schedule, ensuring all activities are well-timed without overlaps. They coordinate with different teams to avoid conflicts in timing.",
    "Responsible for securing sponsorships from companies, brands, and organizations. They prepare sponsorship proposals and maintain relations with sponsors.",
    "Organizes and oversees stalls, including food, merchandise, and activity booths. They manage stall placements, payments, and crowd interactions.",
  ];
  static List<String> reglink2 = [
    "https://forms.gle/YzKZTvcNYgYNpPV28",
    "https://forms.gle/v3cZoUYm1aTM71aS6",
    "https://forms.gle/YzKZTvcNYgYNpPV28",
    "https://forms.gle/YzKZTvcNYgYNpPV28",
    "https://forms.gle/YzKZTvcNYgYNpPV28",
    "https://forms.gle/YzKZTvcNYgYNpPV28",
    "https://forms.gle/YzKZTvcNYgYNpPV28",
    "https://forms.gle/YzKZTvcNYgYNpPV28",
    "https://forms.gle/YzKZTvcNYgYNpPV28",
    "https://forms.gle/YzKZTvcNYgYNpPV28",
    "https://forms.gle/YzKZTvcNYgYNpPV28",
    "https://forms.gle/YzKZTvcNYgYNpPV28",
    "https://forms.gle/YzKZTvcNYgYNpPV28",
    "https://forms.gle/YzKZTvcNYgYNpPV28",
  ];
  static List<List<String>> HeadNamesc2 = [
    [" Vedasri S", "Karthick C"],
    ["Tharunya V R", "Vishnupriya S", "Yoganandhini R R"],
    ["Viveca B", "Madhumitha R", "Sakthikumar S", "Harinisri J"],
    ["Manikandan D", "Vijay Sankaran K", "Keerthivasan K"],
    ["Mirudhula K", "Swetha S", "Surya R", "Arulkumaran S"],
    ["Keerthanaa E", "Harini S"],
    ["Thenubhuvaneshwaran V", "Pravin M", "Vishwa Varma B", "Nithish"],
    ["Vignesh M", "Hemachandran G", "Abinash S", "Manimaran C", " Maadhesh B", "Maanasa Ananda Kumar", "Shanofar Marlia S", "Atshayanathan K", "Divya Prabha R"], // Multiple heads for Anchoring
    ["Abineshwaran P"],
    ["Dharshini K"],
    ["Yogesh M", " Sahul Hameed R"],
    ["Sivakarthikkaa S", "Theyjeswini K S", "Shruthi B M"],
    ["Athavan R", "Abishaek A G"],
    ["Hari Prasanna S", "Hariharan M"],
  ];
  static List<List<String>> HeadClassc2 = [
    ["III - B.Tech CSE A", "I - M.Sc Maths"],
    ["III - B.Com B", "III - BCA A", "III - BCA A"],
    ["IV - B.Tech CSE C", " I - M.Com", " III - B.Com A", "III - B.Tech ECE B"],
    ["III - B.Sc CS B", "III - B.Tech ECE B", "III - B.Sc CS A"],
    ["II - M.Com", "II - M.Com", " I - M.Com", " III - B.Com A"],
    ["III - B.Sc Micro", "II - B.Sc Bio"],
    ["III - B.Com A", "III - BBA", "III - B.Com A", "II - B.Com D"],
    ["IV - B. Tech CSE ", "IV - B.Tech CSE", " IV - B.Tech CSE", "III - B.Tech ECE", "III - B.Tech ECE", "III - B.Tech CSE", " I - M.Com" , " III - B.Com D", "II - B.Tech ECE" ],
    ["I - M.Com"],
    ["III - B.Sc Micro"],
    ["I - M.Com", "I - M.Com"],
    ["III - B.Sc Micro", "III - B.Tech CSE C", "III - B.Tech CSE C"],
    ["III - B.Sc MCA", "II - BBA"],
    ["II -  BBA", "II -  BBA"],
  ];
  static List<List<String>> HeadContactc2 = [
    ["7989349078", "9025160046"],
    ["9940068863", "8072546991", "8015453076"],
    ["9092585520", "9150849634", "9344835456", "7826038254"],
    ["6381279757", "8903752570", "8946095982"],
    ["9940481413", "8056615432", "9894474013", "9786499039"],
    ["8220475533", "9514997923"],
    ["8610998626", "9360119005", "8940551404", "9042773384"],
    ["9150292811", "8056357169", "9345642528", " 9500572059", "6383355114", "8300198798", "9384261977", "7339216366", "9361425189" ],
    ["9361412371"],
    ["8754267536"],
    ["8754350722", "7448400237"],
    ["9677449299", "9952770108", "7010013448"],
    ["8248763981", "9363374605"],
    ["9342813177", "9344934638"],
  ];

  final List<CommiteeDataModel> commitee = List.generate(
    Namec2.length,
    (index) => CommiteeDataModel(
      '${Namec2[index]}',
      '${urlc2[index]}',
      '${descc2[index]}',
      '${BoxColorc2[index]}',
      '${reglink2[index]}',
      '${HeadNamesc2[index]}',
      '${HeadClassc2[index]}',
      '${HeadContactc2[index]}',
    ),
  );

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    bool isRegistrationClosed = now.isAfter(registrationDeadline);

    // Corrected: Format the time properly with AM/PM
    String formattedDeadline = DateFormat(
      'hh:mm a',
    ).format(registrationDeadline);

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
          child: Icon(IconlyLight.arrowLeft2, color: color),
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
                          widget.commiteeDataModel.name,
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
            //img
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
                            widget.commiteeDataModel.ImageUrl,
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

            //SizedBox(height: 18),
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
                    widget.commiteeDataModel.desc,
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
                          int index = Namec2.indexOf(widget.commiteeDataModel.name);

                          if (index == -1) {
                            return Center(
                              child: Text(
                                "No data available",
                                style: TextStyle(fontSize: 18, color: Colors.red),
                              ),
                            );
                          }

                          return Column(
                            children: List.generate(
                              HeadNamesc2[index].length,
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
                                        HeadNamesc2[index][i],
                                        style: GoogleFonts.montserrat(
                                          color: color,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 20,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        HeadClassc2[index][i],
                                        style: GoogleFonts.lora(
                                          color: color,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 20,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            HeadContactc2[index][i],
                                            style: GoogleFonts.lora(
                                              color: color,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 20,
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          GestureDetector(
                                            onTap: () {
                                              Clipboard.setData(
                                                ClipboardData(text: HeadContactc2[index][i]),
                                              );
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  content: Text("Phone number copied!",
                                                    style: GoogleFonts.lora(
                                                      color: color,
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 20,
                                                    ),),
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
                  child:
                      isRegistrationClosed
                          ? Text(
                            "Registration Closed!",
                        style: GoogleFonts.lora(
                          color: color,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                          )
                          : ElevatedButton(
                            onPressed: () async {
                              String googleFormUrl =
                                  widget
                                      .commiteeDataModel
                                      .reglink; // Replace with actual link
                              if (await canLaunch(googleFormUrl)) {
                                await launch(googleFormUrl);
                              } else {
                                throw "Could not launch $googleFormUrl";
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              padding: EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 15,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "Register Now",
                                  style: GoogleFonts.lora(
                                    color: color,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  "(Closes at: $formattedDeadline)",
                                  style: GoogleFonts.lora(
                                    color: color,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                  ),
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

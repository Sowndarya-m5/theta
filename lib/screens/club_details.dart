import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/club_model.dart';
import '../services/utils.dart';
import 'package:flutter/services.dart';

class ClubDetails extends StatefulWidget {
  final ClubDataModel clubDataModel;

  const ClubDetails({Key? key, required this.clubDataModel}) : super(key: key);

  @override
  State<ClubDetails> createState() => _ClubDetailsState();
}

class _ClubDetailsState extends State<ClubDetails> {
  DateTime registrationDeadline = DateTime(2025, 3, 7, 22, 34);
  bool showHeadDetails = false;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  static List<String> Namec4 = [
    "Emulsion",
    "Equilibria",
    "Pixelq",
    "Vinodha Vaahini",
    "Webtek",
  ];
  static List urlc4 = [
    "asset/club/emulsion.gif",
    "asset/club/Equilibria.gif",
    "asset/club/pixelq.gif",
    "asset/club/v.gif",
    "asset/club/webtex.gif",
  ];
  static List BoxColorc4 = [
    Color(0xFFFBDCDA),
    Color(0xFFD4EEF3),
    Color(0xFFFAE6D5),
    Color(0xFFEFCFE7),
    Color(0xffF7A593),
  ];
  static List<String> descc4 = [
    "A club dedicated to photography and filmmaking. It focuses on capturing moments through creative photography, cinematography, and editing. The club organizes workshops, photo walks, short film contests, and exhibitions to enhance visual storytelling skills.",
    "A Tamil cultural and literary club that celebrates Tamil language, literature, and traditions. It organizes poetry recitals, debates, storytelling sessions, and cultural events to promote Tamil heritage and encourage linguistic creativity.",
    "A design and multimedia club specializing in graphic design, animation, UI/UX, and digital art. It provides a platform for students to explore creative software, participate in design challenges, and contribute to projects like branding and promotional materials for college events.",
    "A Telugu cultural club that promotes Telugu literature, arts, and traditions. It conducts storytelling sessions, poetry meets, drama performances, and language-based competitions to enrich students’ understanding of Telugu culture and heritage.",
    "A web development and technology club focusing on website design, development, and web-based innovations. It conducts coding workshops, hackathons, and technical sessions on frontend, backend, and full-stack development, helping students enhance their web development skills.",
  ];
  static List<String> reglink4 = [
    "https://forms.gle/YzKZTvcNYgYNpPV28",
    "https://forms.gle/v3cZoUYm1aTM71aS6",
    "https://forms.gle/YzKZTvcNYgYNpPV28",
    "https://forms.gle/YzKZTvcNYgYNpPV28",
    "https://forms.gle/YzKZTvcNYgYNpPV28",
  ];
  static List<List<String>> HeadNamesc4 = [
    ["Harish Kumar S", "Mohamed Shafeeq H"],
    ["Sarguru Ramakrishnan A", "Haripriya S", "Kapilsai"],
    ["Harish A S", "Deepa B", "Bavadharani S", "Baranidharan M"],
    ["Vedasri S", "Yaswanth A"],
    ["Mohamed Haaroon A"],
  ];
  static List<List<String>> HeadClassc4 = [
    ["III - B.Tech ECE A", "II - B.Sc CS A"],
    ["II - B.Sc Physics", "II - B.Com A", "I - B.Sc CS"],
    ["III - B.Sc CS B", "I - M.Com", "II - B.Com D", "II - B.Com D"],
    ["III - B.Tech CSE A", "III - B.Tech CSE B"],
    ["II - BCA A"],
  ];
  static List<List<String>> HeadContactc4 = [
    ["6379714145", "9150373948"],
    ["9445277652", "9150229427", "9626326800"],
    ["6369630911", "8778763571", "8122768628", "9360501915"],
    ["7989349078", "9059398206"],
    ["9500669628"],
  ];
  final List<ClubDataModel> club = List.generate(
    Namec4.length,
    (index) => ClubDataModel(
      '${Namec4[index]}',
      '${urlc4[index]}',
      '${descc4[index]}',
      '${BoxColorc4[index]}',
      '${reglink4[index]}',
      '${HeadNamesc4[index]}',
      '${HeadClassc4[index]}',
      '${HeadContactc4[index]}',
    ),
  );

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    bool isRegistrationClosed = now.isAfter(registrationDeadline);
    String formattedDeadline = DateFormat(
      'hh:mm a',
    ).format(registrationDeadline);

    final Utils utils = Utils(context);
    final Color color = Utils(context).color;
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
                          widget.clubDataModel.name,
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
                            widget.clubDataModel.ImageUrl,
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
                    style:GoogleFonts.montserrat(
                      color: color,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 18),
                  Text(
                    widget.clubDataModel.desc,
                    style: GoogleFonts.lora( // Apply Poppins font
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: color,
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
                          int index = Namec4.indexOf(widget.clubDataModel.name);

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
                              HeadNamesc4[index].length,
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
                                        HeadNamesc4[index][i],
                                        style: GoogleFonts.montserrat(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        HeadClassc4[index][i],
                                        style: GoogleFonts.lora(fontSize: 18, color: Colors.grey[700]),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            HeadContactc4[index][i],
                                            style: GoogleFonts.lora(fontSize: 18, color: Colors.black87),
                                          ),
                                          SizedBox(width: 8),
                                          GestureDetector(
                                            onTap: () {
                                              Clipboard.setData(
                                                ClipboardData(text: HeadContactc4[index][i]),
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
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  )
                      : ElevatedButton(
                    onPressed: () async {
                      String googleFormUrl = widget.clubDataModel.reglink;
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
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        Text(
                          "(Closes at: $formattedDeadline)",
                          style: TextStyle(fontSize: 14, color: Colors.white70),
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

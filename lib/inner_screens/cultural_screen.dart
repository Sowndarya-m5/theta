import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/cultural_model.dart';
import '../screens/Cultural_details.dart';
import '../services/utils.dart';
import '../wigets/text_widget.dart';

// ignore: must_be_immutable
class CulturalInScreen extends StatelessWidget {
  static const routeName = "/CulturalInScreen";

  CulturalInScreen({Key? key}) : super(key: key);
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
    // ignore: unused_local_variable
    Size size = Utils(context).getScreenSize;
    // ignore: unused_local_variable
    bool _isEmpty = false;
    // ignore: unused_local_variable
    final Color color = Utils(context).color;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(IconlyLight.arrowLeft2, color: color),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          "Cultural",
          style: GoogleFonts.montserrat(
            color: color,
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
        child: GridView.builder(
          padding: EdgeInsets.zero,
          itemCount: 2,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 20,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            CulturalDetails(culturalDataModel: cultural[index]),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(left: 5, right: 5),
                decoration: BoxDecoration(
                  color: BoxColorc3[index],
                  borderRadius: BorderRadius.circular(12),
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
                    Image.asset(
                      cultural[index].ImageUrl,
                      height: 100,
                      width: 100,
                      fit: BoxFit.contain,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(
                        cultural[index].name,
                        style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 19),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

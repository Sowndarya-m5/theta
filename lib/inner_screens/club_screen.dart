import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../models/club_model.dart';
import '../screens/club_details.dart';
import '../services/utils.dart';
import '../wigets/text_widget.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ClubInScreen extends StatelessWidget {
  static const routeName = "/ClubInScreen";
  ClubInScreen({Key? key}) : super(key: key);



  static List<String> Namec4 = [
    "Emulsion",
    "Equilibria",
    "Pixelq",
    "VinodhaVaahini",
    "Webtek",
  ];
  static List urlc4 = [
    "asset/club/EmulsionLogo.png",
    "asset/club/PothigaiMandramLogo.jpg",
    "asset/club/pixelQ.png",
    "asset/club/VinodhaVahiniLogo.jpg",
    "asset/club/Webtek Logo.png",
  ];
  static List BoxColorc4 = [
    Color(0xFFFF7043), // Deep Coral
    Color(0xFF26A69A), // Vibrant Teal
    Color(0xFFD4A373), // Warm Sand
    Color(0xFF6D4C41), // Rich Brown
    Color(0xFF42A5F5), // Bright Blue
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
          child: Icon(
            IconlyLight.arrowLeft2,
            color: color,
          ),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          "Club",
          style: GoogleFonts.poppins(
            color: color,
            fontSize: 24,
          ),
        ),
      ),
      body: GridView.builder(
        itemCount: 5,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 30,
          childAspectRatio: 200 / 250,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ClubDetails(
                    clubDataModel: club[index],
                  )));
            },
            child: Container(
              width: 150,
              margin: EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                color: BoxColorc4[index],
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
                  ClipOval(
                    child: Image.asset(
                      club[index].ImageUrl,
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    club[index].name,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

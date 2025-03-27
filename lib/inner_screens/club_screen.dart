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
    [" Vedasri S", "Karthick C"],
    ["Tharunya V R", "Vishnupriya S", "Yoganandhini R R"],
    ["Viveca B", "Madhumitha R", "Sakthikumar S", "Harinisri J"],
    ["Manikandan D", "Vijay Sankaran K", "Keerthivasan K"],
    ["Mirudhula K", "Swetha S", "Surya R", "Arulkumaran S"],
  ];
  static List<List<String>> HeadClassc4 = [
    ["III - B.Tech CSE A", "I - M.Sc Maths"],
    ["III - B.Com B", "III - BCA A", "III - BCA A"],
    ["IV - B.Tech CSE C", " I - M.Com", " III - B.Com A", "III - B.Tech ECE B"],
    ["III - B.Sc CS B", "III - B.Tech ECE B", "III - B.Sc CS A"],
    ["II - M.Com", "II - M.Com", " I - M.Com", " III - B.Com A"],
  ];
  static List<List<String>> HeadContactc4 = [
    ["7989349078", "9025160046"],
    ["9940068863", "8072546991", "8015453076"],
    ["9092585520", "9150849634", "9344835456", "7826038254"],
    ["6381279757", "8903752570", "8946095982"],
    ["9940481413", "8056615432", "9894474013", "9786499039"],

  ];
  final List<ClubDataModel> club = List.generate(
    Namec4.length,
        (index) => ClubDataModel(
      '${Namec4[index]}',
      '${urlc4[index]}',
      '${descc4[index]}',
      '${BoxColorc4[index]}',
      '${reglink4[index]}','${HeadNamesc4[index]}',
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
          style: GoogleFonts.montserrat(
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
                  Image.asset(
                    club[index].ImageUrl,
                    height: 120,
                    width: 120,
                  ),
                  Text(
                    club[index].name,
                    style: GoogleFonts.montserrat(
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

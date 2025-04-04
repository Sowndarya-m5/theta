import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/committe_model.dart';
import '../screens/commitee_details.dart';
import '../services/utils.dart';
import '../wigets/text_widget.dart';

// ignore: must_be_immutable
class CommiteeInScreen extends StatelessWidget {
  static const routeName = "/CommiteeInScreen";
  CommiteeInScreen({Key? key}) : super(key: key);

  static List<String> Namec2 = [
    'Infrastructure & Logistics',
    'Public Relations',
    "Anchoring",
    'Artminds',
    'Creatives',
    'Crowd Control',
    'Finance',
    'Hospitality',
    'Organising',
    'Prize distribution',
    'Promotion & Outreach',
    'Scheduling',
    'Sponsorship',
    'Stall Management',
  ];
  static List<String> descc2 = [
    "Responsible for welcoming guests, speakers, and participants. They arrange accommodations, food, and transportation when needed.",
    "The backbone of the event, responsible for overall planning, coordination, and execution. They ensure smooth communication between different committees and handle any major decision-making.",
    "Manages the hosting and anchoring of the event. They prepare scripts, engage the audience, and ensure smooth transitions between different segments.",
    "A creative team that focuses on artistic elements like designing posters, creating digital content, and adding an artistic touch to the event’s branding.",
    "Focuses on designing and decorating the event venue, including stage setup, banners, backdrops, and other creative elements to enhance the event's look and feel.",
    "Ensures smooth movement of the audience, prevents overcrowding, and maintains discipline at the event venue for safety and order.",
    "Manages the budget, expenses, and financial transactions related to the event. They track income, allocate funds, and ensure financial transparency.",
    "Takes care of venue setup, seating arrangements, power supply, sound systems, and other necessary logistics to ensure a smooth event flow.",
    "Handles external communication, including press releases, media coverage, and interactions with guests and dignitaries. They maintain the event’s public image",
    "Handles the procurement, arrangement, and distribution of prizes, awards, and certificates to winners and participants.",
    "Manages promotional campaigns, including social media marketing, posters, banners, and word-of-mouth publicity to attract participants and audiences",
    "Plans and finalizes the event schedule, ensuring all activities are well-timed without overlaps. They coordinate with different teams to avoid conflicts in timing.",
    "Responsible for securing sponsorships from companies, brands, and organizations. They prepare sponsorship proposals and maintain relations with sponsors.",
    "Organizes and oversees stalls, including food, merchandise, and activity booths. They manage stall placements, payments, and crowd interactions.",
  ];
  static List urlc2 = [
    'asset/commitee/Infrastructure.gif',
    'asset/commitee/PR.gif',
    "asset/commitee/Anchoring.gif",
    'asset/commitee/Artminds.gif',
    'asset/commitee/Creatives.gif',
    'asset/commitee/crowd.gif',
    'asset/commitee/Finance.gif',
    'asset/commitee/Hospitality.gif',
    'asset/commitee/Organizing.gif',
    'asset/commitee/Prize distribution.gif',
    'asset/commitee/promotion.gif',
    'asset/commitee/Scheduling.gif',
    'asset/commitee/Sponsorship.gif',
    'asset/commitee/stall.gif',
  ];
  static List BoxColorc2 = [
    Color(0xffD3B0E0), // Soft Purple
    Color(0xffFDE598), // Light Yellow
    Color(0xFF80CBC4), // Teal
    Color(0xFFB0BEC5), // Cool Grey
    Color(0xFFFFCC80), // Soft Orange
    Color(0xFFFFAB91), // Light Coral
    Color(0xFFCF93D9), // Lilac
    Color(0xFFA5D6A7), // Light Green
    Color(0xFFE6EE9C), // Pale Lime
    Color(0xFF90CAF9), // Sky Blue
    Color(0xFFB39DDB), // Muted Purple
    Color(0xFFFFF59D), // Soft Yellow
    Color(0xFFEF9A9A), // Pastel Red
    Color(0xFFCE93D8), // Light Violet
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
    ["Thenubhuvaneshwaran V", "Pravin M", "Vishwa Varma B", "Nithish"],
    ["Abineshwaran P"],
    [" Vedasri S", "Karthick C"],
    ["Tharunya V R", "Vishnupriya S", "Yoganandhini R R"],
    ["Viveca B", "Madhumitha R", "Sakthikumar S", "Harinisri J"],
    ["Manikandan D", "Vijay Sankaran K", "Keerthivasan K"],
    ["Mirudhula K", "Swetha S", "Surya R", "Arulkumaran S"],
    ["Keerthanaa E", "Harini S"],
    [
      "Vignesh M",
      "Hemachandran G",
      "Abinash S",
      "Manimaran C",
      " Maadhesh B",
      "Maanasa Ananda Kumar",
      "Shanofar Marlia S",
      "Atshayanathan K",
      "Divya Prabha R",
    ],
    ["Dharshini K"],
    ["Yogesh M", " Sahul Hameed R"],
    ["Sivakarthikkaa S", "Theyjeswini K S", "Shruthi B M"],
    ["Athavan R", "Abishaek A G"],
    ["Hari Prasanna S", "Hariharan M"],
  ];
  static List<List<String>> HeadClassc2 = [
    ["III - B.Com A", "III - BBA", "III - B.Com A", "II - B.Com D"],
    ["I - M.Com"],
    ["III - B.Tech CSE A", "I - M.Sc Maths"],
    ["III - B.Com B", "III - BCA A", "III - BCA A"],
    ["IV - B.Tech CSE C", " I - M.Com", " III - B.Com A", "III - B.Tech ECE B"],
    ["III - B.Sc CS B", "III - B.Tech ECE B", "III - B.Sc CS A"],
    ["II - M.Com", "II - M.Com", " I - M.Com", " III - B.Com A"],
    ["III - B.Sc Micro", "II - B.Sc Bio"],
    [
      "IV - B. Tech CSE ",
      "IV - B.Tech CSE",
      " IV - B.Tech CSE",
      "III - B.Tech ECE",
      "III - B.Tech ECE",
      "III - B.Tech CSE",
      " I - M.Com",
      " III - B.Com D",
      "II - B.Tech ECE",
    ],
    ["III - B.Sc Micro"],
    ["I - M.Com", "I - M.Com"],
    ["III - B.Sc Micro", "III - B.Tech CSE C", "III - B.Tech CSE C"],
    ["III - B.Sc MCA", "II - BBA"],
    ["II -  BBA", "II -  BBA"],
  ];
  static List<List<String>> HeadContactc2 = [
    ["8610998626", "9360119005", "8940551404", "9042773384"],
    ["9361412371"],
    ["7989349078", "9025160046"],
    ["9940068863", "8072546991", "8015453076"],
    ["9092585520", "9150849634", "9344835456", "7826038254"],
    ["6381279757", "8903752570", "8946095982"],
    ["9940481413", "8056615432", "9894474013", "9786499039"],
    ["8220475533", "9514997923"],
    [
      "9150292811",
      "8056357169",
      "9345642528",
      " 9500572059",
      "6383355114",
      "8300198798",
      "9384261977",
      "7339216366",
      "9361425189",
    ],
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
          "Committee",
          style: GoogleFonts.poppins(
            color: color,
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0), // Reduced left & right padding
        child: GridView.builder(
          padding: EdgeInsets.zero,
          itemCount: 14,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 20,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CommiteeDetails(
                          commiteeDataModel: commitee[index],
                        )));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(left: 5, right: 5),
                decoration: BoxDecoration(
                  color: BoxColorc2[index],
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
                      commitee[index].ImageUrl,
                      height: 120,
                      width: 120,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(
                        commitee[index].name,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
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

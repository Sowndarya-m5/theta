import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:theta/inner_screens/club_screen.dart';
import 'package:video_player/video_player.dart';
import '../inner_screens/cluster_screen.dart';
import '../inner_screens/committee_screen.dart';
import '../models/cluster_model.dart';
import '../models/committe_model.dart';
import '../models/club_model.dart';
import '../models/cultural_model.dart';
import '../services/global_method.dart';
import '../services/utils.dart';
import 'Countdown.dart';
import 'cluster_details.dart';
import 'commitee_details.dart';
import 'club_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  //cluster total 9

  static List<String> Name = [
    "AccessIndia",
    "Biogenesis",
    "Electronica",
    "Informatica",
    "Mathematica",
    "Optica",
    "Robotics",
    "Sportiva",
    "Strategia",
  ];
  static List<String> desc = [
    "AccessIndia Cluster helps students strengthen their ability to work together, communicate effectively, and think creatively. It creates an environment where students learn to adapt, lead, and solve challenges as a team.",
    "Biogenesis Cluster explores the fascinating world of life sciences, covering topics like biotechnology, genetics, and molecular biology. It helps students understand the building blocks of life and discover advancements shaping the future of biology.",
    "Electronica Cluster focuses on the world of electronics, guiding students through circuits, microcontrollers, and innovative electronic systems. It explores the latest trends in electronic design and technology.",
    "Informatica is a student-run organization focused on bringing together like-minded individuals interested in computer science and technology. The club aims to provide its members with opportunities to develop their technical skills, participate in coding competitions, network with industry professionals, and learn about emerging trends in the field",
    "Mathematica Cluster delves into the world of numbers and patterns, helping students explore mathematical concepts, problem-solving strategies, and logical thinking.",
    "Optica Cluster, powered by the Physics Department, accelerates your curiosity with momentum! Dive into the dynamics of motion, unravel the mysteries of quantum states, and reflect on the wonders of the universe—because here, every action sparks an equal and opposite reaction!",
    "Robotica Cluster dives into the field of robotics, offering students insights into robotic design, automation, and real-world applications. It helps students explore the latest advancements in technology and engineering.",
    "Sportiva Cluster promotes the spirit of sports and fitness, encouraging students to build strength, resilience, and teamwork through various athletic and recreational activities.",
    "Strategia Cluster, driven by the Commerce Department, sharpens your financial foresight and strategic perception! Master the art of market dynamics, balance the books of uncertainty, and calculate your next move with precision—because in strategy, every decision counts!",
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
    Color(0xFF8D6E63), // Earthy Mocha
    Color(0xFFFFA726), // Warm Orange
    Color(0xFFAB47BC), // Vibrant Purple
    Color(0xFF64B5F6), // Light Sky Blue
    Color(0xFFAED581), // Fresh Green
    Color(0xFF9575CD), // Muted Purple
    Color(0xFFFF8A65), // Peach
    Color(0xFFBCAAA4), // Warm Taupe
    Color(0xFF81C784), // Leaf Green
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
    ["III - B.Sc Micro", "III - B.Sc Bio"],
    ["III - B.Tech ECE B", "III - B.Tech ECE B"],
    ["III - B.Tech CSE A", "III - BCA C", "III - B.Sc CS B"],
    ["III - B.Sc MCA", "II - B.Sc MCA"],
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
      '${HeadName[index]}',
      '${HeadClass[index]}',
      '${HeadContact[index]}',
    ),
  );

  //commitee total 14

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

  //cultural total 2
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

  //club  total 5
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

  late VideoPlayerController _videoController;
  bool _isVideoReady = false;
  int _currentPage = 0; // Track current slide

  @override
  void initState() {
    super.initState();

    // Initialize Video
    _videoController = VideoPlayerController.asset('asset/banner/thetavideo1.mp4')
      ..initialize().then((_) {
        setState(() {
          _isVideoReady = true;
        });
        _videoController.setLooping(true);
      });
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });

    if (index == 0) {
      // Restart video when first slide appears
      _videoController.seekTo(Duration.zero);
      _videoController.play();
    } else {
      // Pause video on other slides
      _videoController.pause();
    }
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    double _screenwidth = MediaQuery.of(context).size.width;

    final Utils utils = Utils(context);
    // ignore: unused_local_variable
    final themeState = utils.getTheme;
    // ignore: unused_local_variable
    final Color color = Utils(context).color;
    // ignore: unused_local_variable
    Size size = utils.getScreenSize;
    // ignore: unused_local_variable
    GlobalMethods globalMethods = GlobalMethods();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 10),
                _isVideoReady
                    ? ImageSlideshow(
                  width: 400,
                  height: 270,
                  initialPage: 0,
                  indicatorColor: Colors.blue,
                  indicatorBackgroundColor: Colors.grey,
                  onPageChanged: _onPageChanged,
                  autoPlayInterval: 10000,
                  isLoop: true,
                  children: [
                    // Video Slide
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        AspectRatio(
                          aspectRatio: _videoController.value.aspectRatio,
                          child: VideoPlayer(_videoController),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: IconButton(
                            icon: Icon(
                              _videoController.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              color: color,
                              size: 30,
                            ),
                            onPressed: () {
                              setState(() {
                                if (_videoController.value.isPlaying) {
                                  _videoController.pause();
                                } else {
                                  _videoController.play();
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    // Image Slides
                    Image.asset('asset/banner/images2.jpg', fit: BoxFit.cover),
                    Image.asset('asset/banner/images5.jpg', fit: BoxFit.cover),
                    Image.asset('asset/banner/images6.jpg', fit: BoxFit.cover),
                    Image.asset('asset/banner/images7.jpg', fit: BoxFit.cover),
                    Image.asset('asset/banner/images8.jpg', fit: BoxFit.cover),
                  ],
                )
                    : CircularProgressIndicator(),

                SizedBox(height: 10),

                //count screen
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: Theme.of(context).brightness == Brightness.dark
                            ? Colors.deepOrange // Dark mode: Base color is white
                            : Colors.black, // Light mode: Base color is black
                        highlightColor: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white  // Dark mode: Highlight color is black
                            : Colors.white, // Light mode: Highlight color is white
                        child:
                        Text(
                          "Upcoming Event",
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),

                      //event deails
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CountdownCard(
                            eventName: "Swaraag",
                            eventDate: DateTime(2025, 4,11, 18, 0, 0),
                            eventImageUrl: "asset/clusterlogo/Swaraag Logo.png",
                            students: [
                              {"name": "Inbarajan.K", "rollNumber": "226027064",},
                              {"name": "Joice Mendora M", "rollNumber": " 226026080", },
                              {"name": "Yuvasree", "rollNumber": "226125062",},
                            ],
                          ),
                          CountdownCard(
                            eventName: "Recoil",
                            eventDate: DateTime(2025, 4,12, 18, 0, 0),
                            eventImageUrl: "asset/clusterlogo/Recoil Logo.jpg",
                            students: [
                              {"name": "Pravin S", "rollNumber": "225026144",},
                              {"name": "Naveshni B M", "rollNumber": "225025032",},
                              {"name": "Vikash E", "rollNumber": "226172053",},
                              {"name": "Kiruthiga K M", "rollNumber": "225170014",},
                            ],
                          ),
                          CountdownCard(
                            eventName: "Pro Nite",
                            eventDate: DateTime(2025, 4,13, 18, 0, 0),
                            eventImageUrl: "asset/cultural/onelove.png",
                            students: [
                              {"name": "Abrahaam Nithya Pandian", "rollNumber": "Vocals",},
                              {"name": "Jacob Cherian", "rollNumber": "Vocals",},
                              {"name": "Rowan Samuel Jerome", "rollNumber": "Keyboard",},
                              {"name": "Angello Joshua", "rollNumber": "Guitar",},
                              {"name": "Allen Joseph", "rollNumber": "Drums",},
                              {"name": "Franklin Paul", "rollNumber": "Percussion",},

                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Shimmer.fromColors(
                            baseColor: Theme.of(context).brightness == Brightness.dark
                                ? Colors.deepOrange // Dark mode: Base color is white
                                : Colors.black, // Light mode: Base color is black
                            highlightColor: Theme.of(context).brightness == Brightness.dark
                                ? Colors.white  // Dark mode: Highlight color is black
                                : Colors.white, // Light mode: Highlight color is white
                            child: Text(
                              "Cluster",
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,

                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          GlobalMethods.navigateTo(
                            context: context,
                            routeName: ClusterInScreen.routeName,
                          );
                        },
                        child: Text(
                          "See All",
                          style: GoogleFonts.poppins(
                            color: Colors.blue,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Flexible(
                      child: SizedBox(
                        height: 220,
                        child: ListView.builder(
                          itemCount: 9,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder:
                                        (context) => ClusterDetails(
                                          clusterDataModel: Cluster[index],
                                        ),
                                  ),
                                );
                              },
                              child: Container(
                                width: 150,
                                margin: EdgeInsets.only(left: 15),
                                decoration: BoxDecoration(
                                  color: BoxColor[index],
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      // Shadow color
                                      offset: Offset(4, 4),
                                      // Shadow position (3D effect)
                                      blurRadius: 6,
                                    ),
                                    BoxShadow(
                                      color: Colors.white.withOpacity(0.6),
                                      // Light source effect
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
                                        Cluster[index].ImageUrl,
                                        height: 120,
                                        width: 120,
                                        fit: BoxFit.cover, // Ensures the image covers the circle properly
                                      ),
                                    ),
                                    Text(
                                      Cluster[index].name,
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
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Shimmer.fromColors(
                            baseColor: Theme.of(context).brightness == Brightness.dark
                                ? Colors.deepOrange // Dark mode: Base color is white
                                : Colors.black, // Light mode: Base color is black
                            highlightColor: Theme.of(context).brightness == Brightness.dark
                                ? Colors.white  // Dark mode: Highlight color is black
                                : Colors.white, // Light mode: Highlight color is white
                            child: Text(
                              "Committee",
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          GlobalMethods.navigateTo(
                            context: context,
                            routeName: CommiteeInScreen.routeName,
                          );
                        },
                        child: Text(
                          "See All",
                          style: GoogleFonts.poppins(
                            color: Colors.blue,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2),
                Row(
                  children: [
                    Flexible(
                      child: SizedBox(
                        height: 220,
                        child: ListView.builder(
                          itemCount: 14,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder:
                                        (context) => CommiteeDetails(
                                          commiteeDataModel: commitee[index],
                                        ),
                                  ),
                                );
                              },
                              child: Container(
                                width: 150,
                                margin: EdgeInsets.only(left: 15),
                                decoration: BoxDecoration(
                                  color: BoxColorc2[index],
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      // Shadow color
                                      offset: Offset(4, 4),
                                      // Shadow position (3D effect)
                                      blurRadius: 6,
                                    ),
                                    BoxShadow(
                                      color: Colors.white.withOpacity(0.6),
                                      // Light source effect
                                      offset: Offset(-3, -3),
                                      blurRadius: 6,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                      commitee[index].ImageUrl,
                                      height: 120,
                                      width: 150,
                                    ),
                                    Text(
                                      commitee[index].name,
                                      textAlign: TextAlign.center,
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
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),

                //cultural

                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Row(
                //         children: [
                //           Shimmer.fromColors(
                //             baseColor: Theme.of(context).brightness == Brightness.dark
                //                 ? Colors.deepOrange // Dark mode: Base color is white
                //                 : Colors.black, // Light mode: Base color is black
                //             highlightColor: Theme.of(context).brightness == Brightness.dark
                //                 ? Colors.white  // Dark mode: Highlight color is black
                //                 : Colors.white, // Light mode: Highlight color is white
                //             child: Text(
                //               "Cultural",
                //               style: TextStyle(
                //                 fontSize: 22,
                //                 fontWeight: FontWeight.bold,
                //                 fontFamily: "Geoform",
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //       Spacer(),
                //       TextButton(
                //         onPressed: () {
                //           GlobalMethods.navigateTo(
                //             context: context,
                //             routeName: CulturalInScreen.routeName,
                //           );
                //         },
                //         child: Text(
                //           "See All",
                //           style: TextStyle(
                //             color: Colors.blue,
                //             fontSize: 15,
                //             fontWeight: FontWeight.bold,
                //             fontFamily: "Geoform",
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // const SizedBox(height: 2),
                // Row(
                //   children: [
                //     Flexible(
                //       child: SizedBox(
                //         height: 220,
                //         child: ListView.builder(
                //           itemCount: 2,
                //           scrollDirection: Axis.horizontal,
                //           itemBuilder: (context, index) {
                //             return InkWell(
                //               onTap: () {
                //                 Navigator.of(context).push(
                //                   MaterialPageRoute(
                //                     builder:
                //                         (context) => CulturalDetails(
                //                           culturalDataModel: cultural[index],
                //                         ),
                //                   ),
                //                 );
                //               },
                //               child: Container(
                //                 width: 150,
                //                 margin: EdgeInsets.only(left: 15),
                //                 decoration: BoxDecoration(
                //                   color: BoxColorc2[index],
                //                   borderRadius: BorderRadius.circular(10),
                //                   boxShadow: [
                //                     BoxShadow(
                //                       color: Colors.black.withOpacity(0.5),
                //                       // Shadow color
                //                       offset: Offset(4, 4),
                //                       // Shadow position (3D effect)
                //                       blurRadius: 6,
                //                     ),
                //                     BoxShadow(
                //                       color: Colors.white.withOpacity(0.6),
                //                       // Light source effect
                //                       offset: Offset(-3, -3),
                //                       blurRadius: 6,
                //                     ),
                //                   ],
                //                 ),
                //                 child: Column(
                //                   mainAxisAlignment:
                //                       MainAxisAlignment.spaceEvenly,
                //                   children: [
                //                     Image.asset(
                //                       cultural[index].ImageUrl,
                //                       height: 120,
                //                       width: 120,
                //                     ),
                //                     Text(
                //                       cultural[index].name,
                //                       style: TextStyle(
                //                         fontWeight: FontWeight.bold,
                //                         fontSize: 19,
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //             );
                //           },
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Shimmer.fromColors(
                            baseColor: Theme.of(context).brightness == Brightness.dark
                                ? Colors.deepOrange // Dark mode: Base color is white
                                : Colors.black, // Light mode: Base color is black
                            highlightColor: Theme.of(context).brightness == Brightness.dark
                                ? Colors.white  // Dark mode: Highlight color is black
                                : Colors.white, // Light mode: Highlight color is white
                            child: Text(
                              "Club",
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          GlobalMethods.navigateTo(
                            context: context,
                            routeName: ClubInScreen.routeName,
                          );
                        },
                        child: Text(
                          "See All",
                          style: GoogleFonts.poppins(
                            color: Colors.blue,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Flexible(
                      child: SizedBox(
                        height: 220,
                        child: ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder:
                                        (context) => ClubDetails(
                                          clubDataModel: club[index],
                                        ),
                                  ),
                                );
                              },
                              child: Container(
                                width: 150,
                                margin: EdgeInsets.only(left: 15),
                                decoration: BoxDecoration(
                                  color: BoxColorc4[index],
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      // Shadow color
                                      offset: Offset(4, 4),
                                      // Shadow position (3D effect)
                                      blurRadius: 6,
                                    ),
                                    BoxShadow(
                                      color: Colors.white.withOpacity(0.6),
                                      // Light source effect
                                      offset: Offset(-3, -3),
                                      blurRadius: 6,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                      textAlign: TextAlign.center,
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
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

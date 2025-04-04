import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/cluster_model.dart';
import '../screens/cluster_details.dart';
import '../services/utils.dart';
import '../wigets/text_widget.dart';

// ignore: must_be_immutable
class ClusterInScreen extends StatelessWidget {
  static const routeName = "/ClusterInScreen";
  ClusterInScreen({Key? key}) : super(key: key);

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
          "Cluster",
          style: GoogleFonts.poppins(
            color: color,
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0), // Reduced left & right padding
        child: GridView.builder(
          padding: EdgeInsets.zero,
          itemCount: 9,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10, // Adjusted spacing between columns
            mainAxisSpacing: 20, // Adjusted spacing between rows
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ClusterDetails(
                          clusterDataModel: Cluster[index],
                        )));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(left: 5, right: 5),
                decoration: BoxDecoration(
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
                    ClipOval(
                      child: Image.asset(
                        Cluster[index].ImageUrl,
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover, // Ensures the image covers the circle properly
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(
                        Cluster[index].name,
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

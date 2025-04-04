import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../provider/dark_theme_provider.dart';
import '../wigets/text_widget.dart';
import 'welcome_screen.dart';

// Notification Controller
class NotificationService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        print("View More button clicked!");
      },
    );
  }

  Future<void> showEventNotification(
    String eventId,
    String title,
    String body,
  ) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
          'event_channel_id',
          'Event Notifications',
          channelDescription: 'Notifications for upcoming events',
          importance: Importance.high,
          priority: Priority.high,
          ticker: 'ticker',
          actions: <AndroidNotificationAction>[
            AndroidNotificationAction(
              'view_more',
              'View More',
              showsUserInterface: true,
            ),
          ],
        );

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    await _flutterLocalNotificationsPlugin.show(
      eventId.hashCode,
      title,
      body,
      platformChannelSpecifics,
    );
  }
}

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {


  final Map<String, List<Map<String, String>>> socialAccounts = {
    "YouTube": [
      {"name": "Theta SRC", "url": "https://youtube.com/@thetasrc"},
      {"name": "Emulsion", "url": "https://youtube.com/@teamemulsion"},
    ],
    "Instagram": [
      {"name": "Theta SRC", "url": "https://www.instagram.com/theta_src"},
      {"name": "PixelQ", "url": "https://www.instagram.com/pixelq.src"},
      {"name": "Emulsion", "url": "https://www.instagram.com/team_emulsion"},
    ],
    "LinkedIn": [
      {"name": "Theta", "url": "https://in.linkedin.com/company/theta-src"},
    ],
  };

  final Map<String, String> socialImages = {
    "YouTube": "asset/youtube1.webp",
    "Instagram": "asset/Instagram.webp",
    "LinkedIn": "asset/LinkedIn.webp",
  };

  final Map<String, List<Color>> buttonColors = {
    "YouTube": [Colors.redAccent, Colors.white],
    "Instagram": [Colors.pinkAccent, Colors.orangeAccent],
    "LinkedIn": [Colors.blueAccent, Colors.white],
  };






  final List<String> logoPaths = [
    'asset/sponsor/cubb.png',
    'asset/sponsor/TempleCityy.png',
    'asset/sponsor/MRSs.png',
    'asset/sponsor/LeeBenzz.png',
    'asset/sponsor/FrozenBottlee.png',
    'asset/sponsor/TripleCc.png',
  ];


  final TextEditingController _addressTextController = TextEditingController(
    text: "",
  );

  @override
  void dispose() {
    _addressTextController.dispose();
    super.dispose();
  }

  String name = "Loading...";
  String email = "Loading...";
  bool _notificationsEnabled = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref("users");

  final NotificationService _notificationService = NotificationService();
  final DatabaseReference _eventsRef = FirebaseDatabase.instance.ref("events");

  @override
  void initState() {
    super.initState();
    loadUserData();
    _notificationService.initNotifications();
    fetchAndScheduleEvents();
    //_startAutoScroll();
  }

  void loadUserData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DatabaseReference userRef = _dbRef.child(user.uid);
      DatabaseEvent event = await userRef.once();

      if (event.snapshot.value != null) {
        Map<dynamic, dynamic> data =
            event.snapshot.value as Map<dynamic, dynamic>;
        setState(() {
          name = data["name"] ?? "No Name";
          email = data["email"] ?? "No Email";
        });
      }
    }
  }

  void fetchAndScheduleEvents() async {
    DatabaseEvent eventSnapshot = await _eventsRef.once();

    if (eventSnapshot.snapshot.value != null) {
      Map<dynamic, dynamic> events =
          eventSnapshot.snapshot.value as Map<dynamic, dynamic>;

      events.forEach((eventId, eventData) {
        String eventName = eventData["name"];
        String date = eventData["date"];
        String time = eventData["time"];
        String venue = eventData["venue"];
        String cluster = eventData["cluster"];

        String notificationTitle = "$cluster - $eventName";
        String notificationBody =
            "$date | $time | $venue\nRegistration closing soon!";

        _notificationService.showEventNotification(
          eventId,
          notificationTitle,
          notificationBody,
        );
      });
    }
  }

  bool _isCardVisible = false;

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  void _toggleDeveloperCard() {
    setState(() {
      _isCardVisible = !_isCardVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable

    final themeState = Provider.of<DarkThemeProvider>(context);
    //ignore: unused_local_variable
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    final User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: SingleChildScrollView(
        child:
            user != null
                ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      Center(
                        child: Image.asset(
                          'asset/SASTRA.png', // Replace with your actual image path
                          width: 450, // Adjust width as needed
                          height: 100, // Adjust height as needed
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Divider(thickness: 2),
                      const SizedBox(height: 10),
                      Text(
                        "$name",
                        style: GoogleFonts.poppins(
                          color: color,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '$email',
                        style: GoogleFonts.poppins(color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white70
                            : Colors.black54, fontSize: 20),
                      ),
                      const SizedBox(height: 10),
                      const Divider(thickness: 2),
                      const SizedBox(height: 10),

                      // Notifications Toggle
                      SwitchListTile(
                        title: Text('Notifications',style: GoogleFonts.poppins(fontSize: 18, color: color),),
                        subtitle: Text(
                          _notificationsEnabled ? "ON" : "OFF",
                          style: GoogleFonts.poppins(color: color,fontSize: 16,),
                        ),
                        secondary: Icon(IconlyLight.notification, color: color),
                        onChanged: (bool value) {
                          setState(() {
                            _notificationsEnabled = value;
                          });
                          if (value) {
                            fetchAndScheduleEvents();
                          }
                        },
                        value: _notificationsEnabled,
                      ),

                      //Theme
                      SwitchListTile(
                        title: Text("Theme",style: GoogleFonts.poppins(color: color, fontSize: 18),),

                        secondary: Icon(
                          themeState.getDarkTheme
                              ? Icons.dark_mode_outlined
                              : Icons.light_mode_outlined,
                          color: color,
                        ),
                        onChanged: (bool value) {
                          setState(() {
                            themeState.setDarkTheme = value;
                          });
                        },
                        value: themeState.getDarkTheme,
                      ),
                      //Developer
                      _listTiles(
                        title: "Developer",
                        icon: IconlyLight.discovery,
                        onPressed: () {
                          _showDeveloperCard();
                        },
                        color: color,
                      ),


                      SizedBox(height: 30),

                      //sponsors
                      Center(
                        child: Text(
                          "Our Reputed Sponsors",
                          style: GoogleFonts.poppins(
                            color: color,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Center(
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 20,
                          runSpacing: 20,
                          children: List.generate(logoPaths.length, (index) {
                            return AnimatedGlowingLogo(imagePath: logoPaths[index]);
                          }),
                        ),
                      ),
                      SizedBox(height: 50), // Reduce from 20 to 10
                      Center(
                        child: Text(
                          "Connect With Us!",
                          style: GoogleFonts.poppins(
                            color: color,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ), // Reduce from 20 to 10
                      GridView.count(
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        padding: EdgeInsets.all(5),
                        children: socialAccounts.keys.map((platform) {
                          return GestureDetector(
                            onTap: () => _showAccounts(context, platform),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  socialImages[platform]!,
                                  height: 36,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  platform,
                                  style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.bold,color: color),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 20),
                      //log out
                      _listTiles(
                        title: 'Logout',
                        icon: IconlyLight.logout,
                        onPressed: () {
                          _showLogoutDialog();
                        },
                        color: Colors.red,

                      ),

                    ],
                  ),
                )
                : Text("No user logged in"),
      ),
    );
  }

  Future<void> _showLogoutDialog() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(Icons.logout, color: Colors.black),
              const SizedBox(width: 8),
              Text('Log Out'),
            ],
          ),
          content: const Text('Do you really want Log out?'),
          actions: [
            TextButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: TextWidget(
                text: 'Cancel',
                color: Colors.cyan,
                textSize: 18,
              ),
            ),
            TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()),
                );
              },
              child: TextWidget(text: 'OK', color: Colors.red, textSize: 18),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showDeveloperCard() async {
    await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            clipBehavior: Clip.none, // Prevents clipping of positioned image
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.deepPurpleAccent, Colors.pinkAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white.withOpacity(0.8)
                          : Colors.black.withOpacity(0.8),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 70), // Space for the positioned image
                    Text(
                      'Sowndarya',
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'A Flutter-powered cultural app enabling seamless event registration, tracking, and real-time updates with secure authentication.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => _launchURL("https://github.com/Sowndarya-m5"),
                          child: ClipOval(
                            child: Image.asset(
                              'asset/github.png',
                              width: 30,
                              height: 30,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        GestureDetector(
                          onTap: () => _launchURL("https://www.linkedin.com/in/sowndarya05/"),
                          child: ClipOval(
                            child: Image.asset(
                              'asset/LinkedIn.webp',
                              width: 30,
                              height: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -100, // Adjust based on how high the image should be
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white.withOpacity(0.8)
                              : Colors.black.withOpacity(0.8),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'asset/sownddd.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showAccounts(BuildContext context, String platform) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Center(
          child: TweenAnimationBuilder(
            duration: Duration(milliseconds: 400),
            curve: Curves.easeOutBack,
            tween: Tween<double>(begin: 0.6, end: 1.0),
            builder: (context, double scale, child) {
              return Transform.scale(
                scale: scale,
                child: AlertDialog(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  title: Text(
                    "$platform",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: socialAccounts[platform]!.map((account) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: InkWell(
                          onTap: () => _launchURL(account['url']!),
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            width: 220,
                            height: 55,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: buttonColors[platform]!,
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 8,
                                  spreadRadius: 2,
                                  offset: Offset(2, 4),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                account['name']!,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }


  Widget _listTiles({
    required String title,
    required IconData icon,
    required Function onPressed,
    required Color color,
  }) {
    return ListTile(
      title:TextWidget(text: title, color: color, textSize: 18,   ),
      leading: Icon(icon, color: color),
      trailing: Icon(IconlyLight.arrowRight2, color: color),
      onTap: () {
        onPressed();
      },
    );
  }
}


class AnimatedGlowingLogo extends StatefulWidget {
  final String imagePath;

  const AnimatedGlowingLogo({required this.imagePath});

  @override
  _AnimatedGlowingLogoState createState() => _AnimatedGlowingLogoState();
}

class _AnimatedGlowingLogoState extends State<AnimatedGlowingLogo> {
  Color glowColor = Colors.white;
  Random random = Random();

  @override
  void initState() {
    super.initState();
    _changeGlowColor();
  }

  void _changeGlowColor() {
    Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        List<Color> colors = [
          Colors.blueGrey,
          Colors.deepPurpleAccent,
          Colors.amberAccent,
          Colors.lightBlueAccent,
          Colors.deepOrangeAccent,
          Colors.indigoAccent,
          Colors.limeAccent,
          Colors.pinkAccent,
          Colors.tealAccent,
          Colors.cyanAccent,
        ];
        glowColor = colors[random.nextInt(colors.length)];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: glowColor.withOpacity(0.8),
            blurRadius: 20,
            spreadRadius: 10,
          ),
        ],
      ),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        backgroundImage: AssetImage(widget.imagePath),
      ),
    );
  }
}
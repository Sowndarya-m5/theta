import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theta/screens/event_screen.dart';
import 'package:theta/screens/notification_screen.dart';
import 'package:theta/screens/signup_screen.dart';
import 'package:theta/splashscreen/splash_screen.dart';
import 'consts/theme_data.dart';
import 'inner_screens/cluster_screen.dart';
import 'inner_screens/committee_screen.dart';
import 'inner_screens/club_screen.dart';
import 'inner_screens/cultural_screen.dart';
import 'provider/dark_theme_provider.dart';



Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling background message: ${message.messageId}");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyC1AoPMkdPO9Jg50NrLMdkSgqGZIQYXZeU",
        appId: "1:432720370789:android:36fe7d081e3d2135987a8c",
        messagingSenderId: "432720370789",
        projectId: "thetaapp-8c407",
        storageBucket: "thetaapp-8c407.firebasestorage.app",
        databaseURL: "https://thetaapp-8c407-default-rtdb.firebaseio.com",
      ));


  runApp(MyApp());

}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider thmeeChangeProvider = DarkThemeProvider();

  get index => null;

  void getCurrentAppTheme() async {
    thmeeChangeProvider.setDarkTheme =
    await thmeeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  final name = TextEditingController();
  final email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return thmeeChangeProvider;
        })
      ],
      child:
      Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Theta',
          theme: Styles.themeData(themeProvider.getDarkTheme, context),
          home: SplashScreen(),
          //WelcomeScreen(),
          //BottomBarScreen(),

          routes: {
            ClusterInScreen.routeName: (context) => ClusterInScreen(),
            CommiteeInScreen.routeName: (context) => CommiteeInScreen(),
            CulturalInScreen.routeName: (context) => CulturalInScreen(),
            ClubInScreen.routeName: (context) => ClubInScreen(),
            '/signup': (context) => SignUpScreen(),
            '/events': (context) => EventScreen(),
            '/notifications': (context) => NotificationScreen(),
          },
        );
      }),
    );
  }
}
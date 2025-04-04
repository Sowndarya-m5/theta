import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:theta/inner_screens/Mathematica_inscreen.dart';
import 'package:theta/inner_screens/optica_inscreen.dart';
import 'package:theta/inner_screens/sportiva_inscreen.dart';
import 'package:theta/inner_screens/vv_InScreen.dart';
import '../inner_screens/aa_inscreen.dart';
import '../inner_screens/biogenesis_inscreen.dart';
import '../inner_screens/electronica_inscreen.dart';
import '../inner_screens/robotics_inscreen.dart';
import '../inner_screens/informatica_inscreen.dart';
import '../inner_screens/strategy_inscreen.dart';
import '../provider/dark_theme_provider.dart';

class CartScreen extends StatefulWidget {
  CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double _blurRadius = 15;

  double _spreadRadius = 5;

  Color _glowColor = Colors.blueAccent.withOpacity(0.6);

  @override
  void initState() {
    super.initState();
    _startGlowAnimation();
  }

  void _startGlowAnimation() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _blurRadius = _blurRadius == 15 ? 25 : 15; // Animate blur radius
        _spreadRadius = _spreadRadius == 5 ? 10 : 5; // Animate spread
        _glowColor = _glowColor == Colors.blueAccent.withOpacity(0.6)
            ? Colors.purpleAccent.withOpacity(0.6)
            : Colors.blueAccent.withOpacity(0.6); // Animate color
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    double _screenwidth = MediaQuery.of(context).size.width;
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          AppBar(
            title: Text(
              '         EVENTS AND WORKSHOPS',
              style: GoogleFonts.poppins(color: color),
            ),
            automaticallyImplyLeading: false,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          ),
          SizedBox(height: 15),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => aaInScreen(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 250,
                width: 420,
                child:AnimatedContainer(
                  duration: Duration(seconds: 1),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white.withOpacity(0.7), width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: _glowColor,
                        blurRadius: _blurRadius,
                        spreadRadius: _spreadRadius,
                        offset: Offset(0, 0), // Centered glow
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: AssetImage('asset/AA/india-us.jpg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => BioInScreen(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 250,
                width: 420,
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white.withOpacity(0.7), width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: _glowColor,
                        blurRadius: _blurRadius,
                        spreadRadius: _spreadRadius,
                        offset: Offset(0, 0), // Centered glow
                      ),
                    ],
                  ),
                  child: Stack(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: _screenwidth * 0.625,
                        width: _screenwidth * 0.99,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                              image: AssetImage('asset/clusterlogo/biogenesis1.png'),
                              fit: BoxFit.fill),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EleInScreen(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 250,
                width: 420,
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white.withOpacity(0.7), width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: _glowColor,
                        blurRadius: _blurRadius,
                        spreadRadius: _spreadRadius,
                        offset: Offset(0, 0), // Centered glow
                      ),
                    ],
                  ),
                  child: Stack(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: _screenwidth * 0.625,
                        width: _screenwidth * 0.99,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                              image: AssetImage('asset/clusterlogo/Electronica Logo.png'),
                              fit: BoxFit.fill),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => InfInScreen(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 250,
                width: 420,
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white.withOpacity(0.7), width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: _glowColor,
                        blurRadius: _blurRadius,
                        spreadRadius: _spreadRadius,
                        offset: Offset(0, 0), // Centered glow
                      ),
                    ],
                  ),
                  child: Stack(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: _screenwidth * 0.625,
                        width: _screenwidth * 0.99,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                              image: AssetImage('asset/clusterlogo/INFORMATICA Logo.png'),
                              fit: BoxFit.fill),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MMInScreen(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 250,
                width: 420,
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white.withOpacity(0.7), width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: _glowColor,
                        blurRadius: _blurRadius,
                        spreadRadius: _spreadRadius,
                        offset: Offset(0, 0), // Centered glow
                      ),
                    ],
                  ),
                  child: Stack(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: _screenwidth * 0.625,
                        width: _screenwidth * 0.99,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                              image: AssetImage('asset/clusterlogo/Mathematica Logo.png'),
                              fit: BoxFit.fill),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => OptInScreen(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 250,
                width: 420,
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white.withOpacity(0.7), width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: _glowColor,
                        blurRadius: _blurRadius,
                        spreadRadius: _spreadRadius,
                        offset: Offset(0, 0), // Centered glow
                      ),
                    ],
                  ),
                  child: Stack(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: _screenwidth * 0.625,
                        width: _screenwidth * 0.99,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                              image: AssetImage('asset/clusterlogo/Optica Logo.png'),
                              fit: BoxFit.fill),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 15),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RoboInScreen(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 250,
                width: 420,
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white.withOpacity(0.7), width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: _glowColor,
                        blurRadius: _blurRadius,
                        spreadRadius: _spreadRadius,
                        offset: Offset(0, 0), // Centered glow
                      ),
                    ],
                  ),
                  child: Stack(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: _screenwidth * 0.625,
                        width: _screenwidth * 0.99,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                              image: AssetImage('asset/clusterlogo/ROBOTICS CLUSTER_KA_LOGO (1).png'),
                              fit: BoxFit.fill),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SpoInScreen(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 250,
                width: 420,
                child:AnimatedContainer(
                  duration: Duration(seconds: 1),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white.withOpacity(0.7), width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: _glowColor,
                        blurRadius: _blurRadius,
                        spreadRadius: _spreadRadius,
                        offset: Offset(0, 0), // Centered glow
                      ),
                    ],
                  ),
                  child: Stack(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: _screenwidth * 0.625,
                        width: _screenwidth * 0.99,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                              image: AssetImage('asset/clusterlogo/Sportiva Logo.png'),
                              fit: BoxFit.fill),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => StrInScreen(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 250,
                width: 420,
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white.withOpacity(0.7), width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: _glowColor,
                        blurRadius: _blurRadius,
                        spreadRadius: _spreadRadius,
                        offset: Offset(0, 0), // Centered glow
                      ),
                    ],
                  ),
                  child: Stack(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: _screenwidth * 0.625,
                        width: _screenwidth * 0.99,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                              image: AssetImage('asset/clusterlogo/Strategia Logo.jpg'),
                              fit: BoxFit.fill),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => vvInScreen(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 250,
                width: 420,
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white.withOpacity(0.7), width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: _glowColor,
                        blurRadius: _blurRadius,
                        spreadRadius: _spreadRadius,
                        offset: Offset(0, 0), // Centered glow
                      ),
                    ],
                  ),
                  child: Stack(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: _screenwidth * 0.625,
                        width: _screenwidth * 0.99,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                              image: AssetImage('asset/spo.jpg'),
                              fit: BoxFit.fill),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




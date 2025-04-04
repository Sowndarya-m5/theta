import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theta/screens/event_screen.dart';
import '../provider/dark_theme_provider.dart';
import '../services/utils.dart';
import 'Cart_Screen.dart';
import 'CateogriesScreen.dart';
import 'home_screen.dart';
import 'secondscreen.dart';
import 'user.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;


  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    // Initialize _pages here because 'widget' is accessible inside initState
    _pages = [
      HomeScreen(),
      //CartScreen(),
      EventScreen(),
      //CategoriesScreen(),
      UserScreen(),
    ];
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final Utils utils = Utils(context);
    // ignore: unused_local_variable
    final Color color = Utils(context).color;
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool _isDark = themeState.getDarkTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'THETA 2k25',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
            fontFamily: 'Ethnocenteic',// Corrected font name
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsets.only(left: 12, top: 5, bottom: 5), // Adjusted padding
          child: SizedBox(
            width: 40, // Controlled size for the logo
            height: 40,
            child: Image.asset(
              Theme.of(context).brightness == Brightness.dark
                  ? 'asset/WhiteLogo.png' // Dark mode logo
                  : 'asset/BlackLogo.png', // Light mode logo
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),


      body: _pages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        height: 55,
        backgroundColor: Colors.transparent,
        color: _isDark ? Colors.white : Colors.black87,
        animationDuration: Duration(milliseconds: 300),
        animationCurve: Curves.easeInOut,
        onTap: _selectedPage,
        items: [
          // Icon(Icons.book, color: _isDark ? Colors.black : Colors.white),
          Icon(Icons.home, color: _isDark ? Colors.black : Colors.white),
          Icon(
            Icons.event_available,
            color: _isDark ? Colors.black : Colors.white,
          ),
          //Icon(Icons.category, color: _isDark ? Colors.black : Colors.white),
          Icon(Icons.person, color: _isDark ? Colors.black : Colors.white),
        ],
      ),
    );
  }
}

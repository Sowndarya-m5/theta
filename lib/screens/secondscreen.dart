import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';
import 'CateogriesScreen.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    double _screenwidth = MediaQuery.of(context).size.width;
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          SizedBox(height: 15),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CategoriesScreen(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 250,
                width: 420,
                child: Container(
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: color.withOpacity(0.7), width: 2),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        height: _screenwidth * 0.625,
                        width: _screenwidth * 0.99,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                              image: AssetImage('asset/time.jpg'),
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

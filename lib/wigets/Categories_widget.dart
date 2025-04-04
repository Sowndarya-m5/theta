import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';
import 'text_widget.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget(
      {Key? key,
      required this.catText,
      required this.imgPath,
      required this.passedcolor,
      required this.day,
      required this.date})
      : super(key: key);
  final String catText, imgPath, day, date;
  final Color passedcolor;

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    double _screenwidth = MediaQuery.of(context).size.width;
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return Container(
      decoration: BoxDecoration(
        color: passedcolor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: passedcolor.withOpacity(0.7), width: 2),
      ),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            day,
            style: GoogleFonts.poppins(
                color: color, fontSize: 20, fontWeight: FontWeight.w400),
          ),
          Text(
            date,
            style: GoogleFonts.poppins(
                color: color, fontSize: 20, fontWeight: FontWeight.w400),
          ),
          Container(
            height: _screenwidth * 0.5,
            width: _screenwidth * 0.8,
            decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(imgPath), fit: BoxFit.fill),
            ),
          ),
          TextWidget(
            text: catText,
            color: color,
            textSize: 20,
            isTitle: true,
          ),
        ],
      ),
    );
  }
}

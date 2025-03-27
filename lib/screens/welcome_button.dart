import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class welcomeButton extends StatelessWidget {
  const welcomeButton({
    super.key,
    this.buttontext,
    this.onTap,
    this.color,
    this.textColor,
  });
  final String? buttontext;
  final Widget? onTap;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (e) => onTap!,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: color!,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(80),
            // topRight: Radius.circular(50),
            bottomRight: Radius.circular(85),
            // bottomLeft: Radius.circular(50),
          ),
        ),
        child: Text(
          buttontext!,
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}

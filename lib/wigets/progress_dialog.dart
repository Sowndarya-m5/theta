import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ProgressDialog extends StatelessWidget {

  String? message;
  ProgressDialog({this.message});


  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Container(
        margin:  EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const SizedBox(width: 6.0),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              ),
              const SizedBox(width: 26.0),
              Text(
                message!,
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 12,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


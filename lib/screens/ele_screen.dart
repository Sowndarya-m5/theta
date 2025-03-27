import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/electronica_model.dart';
import '../services/global_method.dart';
import '../services/utils.dart';
class EleDetails extends StatefulWidget {
  final ElecDataModel eleDataModel;
  const EleDetails({Key? key, required this.eleDataModel}) : super(key: key);

  @override
  State<EleDetails> createState() => _EleDetailsState();
}

class _EleDetailsState extends State<EleDetails> {
  DateTime registrationDeadline = DateTime(2025, 3, 7, 22, 34); // March 7, 2025, 3:59 PM

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {});
      }
    });
  }
  @override
  Widget build(BuildContext context) {

    DateTime now = DateTime.now();

    // Convert event date and time to DateTime object
    DateTime eventDateTime = DateFormat(
      "dd.MM.yyyy hh:mm a",
    ).parse("${widget.eleDataModel.date} ${widget.eleDataModel.time}");

    // Add 30 minutes to event start time
    DateTime registrationDeadline = eventDateTime.add(Duration(minutes: 15));

    // Check if event start time is within 5 hours
    bool showClosingTime = eventDateTime.difference(now).inHours <= 5;

    // Format deadline time
    String formattedDeadline = DateFormat(
      'hh:mm a',
    ).format(registrationDeadline);



    final Utils utils = Utils(context);
    // ignore: unused_local_variable
    final themeState = utils.getTheme;
    // ignore: unused_local_variable
    final Color color = Utils(context).color;
    // ignore: unused_local_variable
    Size size = Utils(context).getScreenSize;
    // ignore: unused_local_variable
    GlobalMethods globalMethods = GlobalMethods();
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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Text(
                          widget.eleDataModel.name,
                          textAlign: TextAlign.start,
                          style: GoogleFonts.montserrat(
                            color: color,
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Image.asset(widget.eleDataModel.ImageUrl,),
            ),
            SizedBox(height: 18),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Event Coordinator',
                    style: GoogleFonts.montserrat(
                      color: color,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 18),
                  Text(
                    widget.eleDataModel.coname,
                    style: GoogleFonts.montserrat(
                      color: color,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 18),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: GoogleFonts.montserrat(
                      color: color,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 18),
                  Text(
                    widget.eleDataModel.desc,
                    style: GoogleFonts.lora(
                      color: color,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "Date",
                      style: GoogleFonts.montserrat(
                        fontSize: 17,
                        color: color,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      widget.eleDataModel.date,
                      style: GoogleFonts.lora(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 35,
                  width: 2,
                  color: color,
                ),
                Column(
                  children: [
                    Text(
                      "Time",
                      style: GoogleFonts.montserrat(
                        fontSize: 17,
                        color: color,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      widget.eleDataModel.time,
                      style: GoogleFonts.lora(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 35,
                  width: 2,
                  color: color,
                ),
                Column(
                  children: [
                    Text(
                      "Venue",
                      style: GoogleFonts.montserrat(
                        fontSize: 17,
                        color: color,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      widget.eleDataModel.venue,
                      style: GoogleFonts.lora(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  children: [
                    if (now.isBefore(registrationDeadline))
                      ElevatedButton(
                        onPressed: () async {
                          String googleFormUrl = widget.eleDataModel.reglink;
                          if (await canLaunch(googleFormUrl)) {
                            await launch(googleFormUrl);
                          } else {
                            throw "Could not launch $googleFormUrl";
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Register Now",
                          style: GoogleFonts.montserrat(fontSize: 18, color: Colors.white),
                        ),
                      )
                    else
                      Text(
                        "Registration is Closed",
                        style: GoogleFonts.montserrat(fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold),
                      ),

                    if (showClosingTime && now.isBefore(registrationDeadline))
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "(Closes at: $formattedDeadline)",
                          style: GoogleFonts.montserrat(fontSize: 14, color: Colors.red),
                        ),
                      ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

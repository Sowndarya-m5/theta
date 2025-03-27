import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/biogenesis_model.dart';
import '../services/global_method.dart';
import '../services/utils.dart';

class BioDetails extends StatefulWidget {
  final BioDataModel bioDataModel;

  const BioDetails({Key? key, required this.bioDataModel}) : super(key: key);

  @override
  State<BioDetails> createState() => _BioDetailsState();
}

class _BioDetailsState extends State<BioDetails> {
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
    ).parse("${widget.bioDataModel.date} ${widget.bioDataModel.time}");

    // Add 30 minutes to event start time
    DateTime registrationDeadline = eventDateTime.add(Duration(minutes: 15));

    // Check if event start time is within 5 hours
    bool showClosingTime = eventDateTime.difference(now).inHours <= 5;

    // Format deadline time
    String formattedDeadline = DateFormat(
      'hh:mm a',
    ).format(registrationDeadline);

    final Utils utils = Utils(context);
    final Color color = utils.color;
    Size size = Utils(context).getScreenSize;
    GlobalMethods globalMethods = GlobalMethods();

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(IconlyLight.arrowLeft2, color: color),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Text(
                          widget.bioDataModel.name,
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
                  SizedBox(height: 18),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Image.asset(widget.bioDataModel.ImageUrl),
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
                    widget.bioDataModel.coname,
                    style: GoogleFonts.lora(
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
                    widget.bioDataModel.desc,
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
                      widget.bioDataModel.date,
                      style: GoogleFonts.lora(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                  ],
                ),
                Container(height: 35, width: 2, color: color),
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
                      widget.bioDataModel.time,
                      style: GoogleFonts.lora(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                  ],
                ),
                Container(height: 35, width: 2, color: color),
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
                      widget.bioDataModel.venue,
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
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  children: [
                    if (now.isBefore(registrationDeadline))
                      ElevatedButton(
                        onPressed: () async {
                          String googleFormUrl = widget.bioDataModel.reglink;
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

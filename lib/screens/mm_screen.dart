import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/mathe_model.dart';
import '../services/global_method.dart';
import '../services/utils.dart';

class MMDetails extends StatefulWidget {
  final MMDataModel mmDataModel;
  const MMDetails({Key? key, required this.mmDataModel}) : super(key: key);

  @override
  State<MMDetails> createState() => _MMDetailsState();
}

class _MMDetailsState extends State<MMDetails> {
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
    ).parse("${widget.mmDataModel.date} ${widget.mmDataModel.time}");

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
                          widget.mmDataModel.name,
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
              child: Image.asset(widget.mmDataModel.ImageUrl,),
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
                    widget.mmDataModel.coname,
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
                    widget.mmDataModel.desc,
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
                      widget.mmDataModel.date,
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
                      widget.mmDataModel.time,
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
                      widget.mmDataModel.venue,
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
            // Form(
            //   key: _formkey,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       Text(
            //         "Register Form ",
            //         style: TextStyle(
            //             color: color,
            //             fontSize: 35,
            //             fontWeight: FontWeight.w800),
            //       ),
            //       SizedBox(height: 20),
            //       //rname
            //       Padding(
            //         padding:
            //             const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            //         child: TextFormField(
            //           style: TextStyle(color: color),
            //           controller: rname,
            //           validator: (value) {
            //             if (value == null || value.isEmpty) {
            //               return 'Please Enter Full Name';
            //             }
            //             return null;
            //           },
            //           decoration: InputDecoration(
            //             labelText: "Name",
            //             labelStyle: TextStyle(color: color),
            //             hintText: 'Enter Full Name',
            //             border: OutlineInputBorder(
            //               borderSide: BorderSide(
            //                 color: color, // Default border color
            //               ),
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //             enabledBorder: OutlineInputBorder(
            //               borderSide: BorderSide(
            //                 color: color, // Default border color
            //               ),
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //           ),
            //         ),
            //       ),
            //       SizedBox(height: 20),
            //       //rphone
            //       Padding(
            //         padding:
            //             const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            //         child: TextFormField(
            //           controller: rphone,
            //           style: TextStyle(color: color),
            //           validator: (value) {
            //             if (value == null || value.isEmpty) {
            //               return 'Please enter your phone number';
            //             }
            //             if (!RegExp(r'^\+?[0-9]{10,15}$').hasMatch(value)) {
            //               return 'Please enter a valid phone number';
            //             }
            //             return null;
            //           },
            //           decoration: InputDecoration(
            //             labelText: "Phone Number",
            //             labelStyle: TextStyle(color: color),
            //             hintText: 'Enter Phone Number',
            //             border: OutlineInputBorder(
            //               borderSide: BorderSide(
            //                 color: color, // Default border color
            //               ),
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //             enabledBorder: OutlineInputBorder(
            //               borderSide: BorderSide(
            //                 color: color, // Default border color
            //               ),
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //           ),
            //         ),
            //       ),
            //       SizedBox(height: 15),
            //       //rroll
            //       Padding(
            //         padding:
            //             const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            //         child: TextFormField(
            //           keyboardType: TextInputType.phone,
            //           style: TextStyle(color: color),
            //           controller: rroll,
            //           validator: (value) {
            //             if (value == null || value.isEmpty) {
            //               return 'Please Enter Register No';
            //             }
            //             return null;
            //           },
            //           decoration: InputDecoration(
            //             labelText: "Register No",
            //             labelStyle: TextStyle(color: color),
            //             hintText: '25051124',
            //             border: OutlineInputBorder(
            //               borderSide: BorderSide(
            //                 color: color, // Default border color
            //               ),
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //             enabledBorder: OutlineInputBorder(
            //               borderSide: BorderSide(
            //                 color: color, // Default border color
            //               ),
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //           ),
            //         ),
            //       ),
            //       SizedBox(height: 20),
            //       //rclass
            //       Padding(
            //         padding:
            //             const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            //         child: TextFormField(
            //           style: TextStyle(color: color),
            //           controller: rclass,
            //           validator: (value) {
            //             if (value == null || value.isEmpty) {
            //               return 'Please Enter your Year,Class and Section';
            //             }
            //             return null;
            //           },
            //           decoration: InputDecoration(
            //             labelText: "Class Details",
            //             labelStyle: TextStyle(color: color),
            //             hintText: '1 MSc cs - A',
            //             border: OutlineInputBorder(
            //               borderSide: BorderSide(
            //                 color: color, // Default border color
            //               ),
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //             enabledBorder: OutlineInputBorder(
            //               borderSide: BorderSide(
            //                 color: color, // Default border color
            //               ),
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //           ),
            //         ),
            //       ),
            //       SizedBox(height: 20),
            //       //rcollege
            //       Padding(
            //         padding:
            //             const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            //         child: TextFormField(
            //           style: TextStyle(color: color),
            //           controller: rcollege,
            //           validator: (value) {
            //             if (value == null || value.isEmpty) {
            //               return 'Please Enter your college name';
            //             }
            //             return null;
            //           },
            //           decoration: InputDecoration(
            //             labelText: "College Name",
            //             labelStyle: TextStyle(color: color),
            //             hintText: 'College Name',
            //             border: OutlineInputBorder(
            //               borderSide: BorderSide(
            //                 color: color, // Default border color
            //               ),
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //             enabledBorder: OutlineInputBorder(
            //               borderSide: BorderSide(
            //                 color: color, // Default border color
            //               ),
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //           ),
            //         ),
            //       ),
            //       SizedBox(height: 20),
            //       // Padding(
            //       //   padding:
            //       //       const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            //       //   child: ElevatedButton(
            //       //     onPressed: () async {
            //       //       if (_formkey.currentState!.validate()) {
            //       //         try {
            //       //           var _user = registers();
            //       //           _user.rname = rname.text;
            //       //           _user.rphone = rphone.text;
            //       //           _user.rroll = rroll.text;
            //       //           _user.rclass = rclass.text;
            //       //           _user.rcollege = rcollege.text;
            //       //           var result = await _userService.SaveUser(_user);
            //       //
            //       //           if (result != null) {
            //       //             //   Navigator.push(
            //       //             //     context,
            //       //             //     MaterialPageRoute(
            //       //             //         builder: (context) => const BottomBarScreen()),
            //       //             //   );
            //       //             // }
            //       //             await DatabaseHelpers().addOrder(
            //       //               widget.mmDataModel.name,
            //       //               widget.mmDataModel.cname,
            //       //               widget.mmDataModel.date,
            //       //               widget.mmDataModel.time,
            //       //               widget.mmDataModel.venue,
            //       //             );
            //       //             ScaffoldMessenger.of(context).showSnackBar(
            //       //               SnackBar(
            //       //                   content: Text(
            //       //                       '${widget.mmDataModel.name} register successfully')),
            //       //             );
            //       //           }
            //       //         } catch (e) {
            //       //           print('Error: $e');
            //       //         }
            //       //       }
            //       //     },
            //       //     child: Text('Register'),
            //       //   ),
            //       // ),
            //       SizedBox(height: 20),
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  children: [
                    if (now.isBefore(registrationDeadline))
                      ElevatedButton(
                        onPressed: () async {
                          String googleFormUrl = widget.mmDataModel.reglink;
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

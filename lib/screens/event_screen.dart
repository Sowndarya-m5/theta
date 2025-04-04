import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import '../models/event.dart';
import 'package:intl/intl.dart';

import '../services/notification_service.dart';
import '../services/utils.dart';
import '../wigets/timeline_item.dart';

class EventScreen extends StatefulWidget {
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {


  List<Event> events = [

    //Day 1

    Event(
      title: "Model Verse",
      description:" Round 1 - Detect the scenes \n Round 2 - Walker Bottle \n Round 3 - Ballon pyramid \n Round 4 - Building",
      date: "Day 1",
      actualDate: "11.4.2025",
      time:  "11:00 AM - 1:00 PM",
      venue: "Drawing Hall",
      imageUrl: [
        "asset/events/Biogenesis/Modelverse - Biogenesis_1/Modelverse-Biogenesis_1-1.png",
        "asset/events/Biogenesis/Modelverse - Biogenesis_1/Modelverse-Biogenesis_1-2.png",
        ],
      organizer: "Uvaijul Kalfan U",
      registrationUrl: "",
      clusterName: "Biogenesis present",
    ),//registerlink, orgname,des

    Event(
      title: "Robo soccer",
      description: " Round 1 - Find \n Round 2 - Fetch \n Round 3 - Fun ",
      date: "Day 1",
      actualDate: "11.4.2025",
      time: "11:00 AM - 12:00 PM",
      venue: "Basketball court",
      imageUrl: [
        "asset/events/Robotics/RoboSoccer-Robotics_1/RoboSoccer-Robotics_1-1.png",
        "asset/events/Robotics/RoboSoccer-Robotics_1/RoboSoccer-Robotics_1-2.png",
        ],
      organizer: "Afreen Banu T",
      registrationUrl: "",
      clusterName: "Robotics present",
    ),//reglink, des, orgname

    Event(
      title: "Tech Titans",
      description:" Round 1 - Rapid fire \n Round 2 - Fault-finding \n Round 3 - AI gaming ",
      date: "Day 1",
      actualDate: "11.4.2025",
      time: "11:00 AM - 01:00 PM",
      venue: "402",
      imageUrl: [
        "asset/events/Electronica/TechTitans-Electronica_1/TechTitans-Electronica_1-1.png",
        "asset/events/Electronica/TechTitans-Electronica_1/TechTitans-Electronica_1-2.png",
      ],
      organizer: "M.Yoshitha\nVaitheeshwaran",
      registrationUrl: "",
      clusterName: "Electronica present",
    ),// reglink ✅

    Event(
      title: "Illuminati ",
      description: " Round 1 - Blerg Bits  \n Round 2 - Wacky Wizzle \n Round 3 - Aurora Ascent",
      date: "Day 1",
      actualDate: "11.4.2025",
      time: "11:00 AM - 1:00 PM",
      venue: "509",
      imageUrl: ["asset/events/Optica/Event1/illuminati-Optica_1.jpg",
        "asset/events/Optica/Event1/illuminati-Optica_1(2).jpg",
      ],
      organizer: "Akshaya A",
      registrationUrl: "",
      clusterName: "Optica present",
    ),//waiting reglink  ✅

    Event(
      title: "KGF (Knock Guess Fix)",
      description: " Round 1 - Find \n Round 2 - Fetch \n Round 3 - Fun ",
      date: "Day 1",
      actualDate: "11.4.2025",
      time: "11:00 AM - 02:00 PM",
      venue: "309, 310",
      imageUrl: [
        "asset/events/AccessIndia/Event1/KGF-AccessIndia_1(1).png",
        "asset/events/AccessIndia/Event1/KGF-AccessIndia_1(2).png",
      ],
      organizer: "Afreen Banu T",
      registrationUrl: "",
      clusterName: "Access India present",
    ),// waiting reglink, orgname , des✅

    Event(
      title: "Tech Thon",
      description: " Round 1 -  \n Round 2 -  \n Round 3 -  ",
      date: "Day 1",
      actualDate: "11.4.2025",
      time: "11:00 AM - 1:00 PM",
      venue: "Lab 1",
      imageUrl: [
        "asset/events/Informatica/Event1/Tekathon-Informatica_1-1.png",
        "asset/events/Informatica/Event1/Tekathon-Informatica_1-2.png",
      ],
      organizer: "Ramaguru S",
      registrationUrl: "",
      clusterName: "Informatica present",
    ),//waiting des,  ,reglink ✅

    Event(
      title: "Tri Game Showdown",
      description: " Round 1 - Spot the price  \n Round 2 - Break the rope \n Round 3 - Guess the tagline ",
      date: "Day 1",
      actualDate: "11.4.2025",
      time: "11:00 AM - 3:00 PM",
      venue: "303",
      imageUrl: [
        "asset/events/Strategia/TriGame-Strategia_3/TriGame-Strategia_3-1.png",
        "asset/events/Strategia/TriGame-Strategia_3/TriGame-Strategia_3-2.png",
      ],
      organizer: "Theetchana S",
      registrationUrl: "",
      clusterName: "Strategia present",
    ),//waiting reglink, ✅

    Event(
      title: "Mystic Mind",
      description: " Round 1 - Link & lens \n Round 2 - Touch it..fell it...find it... \n Round 3 - Paper tower panic ",
      date: "Day 1",
      actualDate: "11.4.2025",
      time: "11:00 AM - 5:00 PM",
      venue: "202",
      imageUrl: [
        "asset/events/Mathematica/MysticMind-Mathematica_1/MysticMind-Mathematica_1-1.png",
        "asset/events/Mathematica/MysticMind-Mathematica_1/MysticMind-Mathematica_1-2.png",
        "asset/events/Mathematica/MysticMind-Mathematica_1/MysticMind-Mathematica_1-3.png",
      ],
      organizer: "Kaviyasri G",
      registrationUrl: "",
      clusterName: "Mathematica present",
    ),//waiting reglink, image  ✅

    Event(
      title: "Lucky Box",
      description: " Round 1 -  \n Round 2 - \n Round 3 - ",
      date: "Day 1",
      actualDate: "11.4.2025",
      time: "11:00 AM - 3:00 PM",
      venue: "Near basketball court",
      imageUrl: [ "asset/events/Sportiva/event1/LuckyBox-Sportiva_D1.png",],
      organizer: "Yamini M\nYazhini B\nNithiyasri",
      registrationUrl: "",
      clusterName: "Sportiva present",
    ),//waiting reglink, des ✅

    Event(
      title: "Uriyadi",
      description: " Round 1 -  \n Round 2 - \n Round 3 - ",
      date: "Day 1",
      actualDate: "11.4.2025",
      time: "11:00 AM - 2:30 PM",
      venue: "Near basketball court",
      imageUrl: ["asset/events/Sportiva/event1/Uriyadi-Sportiva_D1.png",],
      organizer: "Yuvaraj A\nSrinivas C\nManisai A",
      registrationUrl: "",
      clusterName: "Sportiva present",
    ),//waiting reglink,  des ✅

    Event(
      title: "One Hour Cricket",
      description: " Round 1 -  \n Round 2 - \n Round 3 - ",
      date: "Day 1",
      actualDate: "11.4.2025",
      time: "12:00 PM - 1:30 PM",
      venue: "Cricket Ground ",
      imageUrl: ["asset/events/Sportiva/event1/OneOver-Sportiva_D1.png",],
      organizer: "Aswin G\nPrasanth M\nManisai A\nKeerthivas I",
      registrationUrl: "",
      clusterName: "Sportiva present",
    ),//waiting reglink, , des ✅

    Event(
      title: "Shape cut",
      description: " Round 1 -  \n Round 2 - \n Round 3 - ",
      date: "Day 1",
      actualDate: "11.4.2025",
      time: "12:00 AM - 3:00 PM",
      venue: "Stall",
      imageUrl: [ "asset/events/Sportiva/event1/LuckyBox-Sportiva_D1.png",],
      organizer: "Yamini M\nYazhini B\nNithiyasri",
      registrationUrl: "",
      clusterName: "Sportiva present",
    ),//waiting reglink, image, des ✅

    Event(
      title: "Match the Bottle",
      description: " Round 1 -  \n Round 2 - \n Round 3 - ",
      date: "Day 1",
      actualDate: "11.4.2025",
      time: "12:00 PM - 2:30 PM",
      venue: "Stall",
      imageUrl: ["asset/events/Sportiva/event2/MatchtheBottle-Sportiva_D2.png",],
      organizer: "Kavya B\nVijaya kamachi A\nSujitha  A",
      registrationUrl: "",
      clusterName: "Sportiva present",
    ),//waiting reglink, des ✅

    Event(
      title: "Dodge Ball",
      description: " Round 1 -  \n Round 2 - \n Round 3 - ",
      date: "Day 1",
      actualDate: "11.4.2025",
      time: "12:00 PM - 2:30 PM",
      venue: "Stall",
      imageUrl: ["asset/events/Sportiva/event1/DodgeBall-Sportiva_D1.png",],
      organizer: "Monisha Kamala S\nGovindaraj A\nThirumal eswar A\nSriram S",
      registrationUrl: "",
      clusterName: "Sportiva present",
    ),//waiting reglink,  des ✅

    Event(
      title: "Beyond The Limits",
      description:" Round 1 - Detect the scenes \n Round 2 - Walker Bottle \n Round 3 - Ballon pyramid \n Round 4 - Building",
      date: "Day 1",
      actualDate: "11.4.2025",
      time:  "2:00 PM - 5:00 PM",
      venue: "Drawing Hall",
      imageUrl: [
        "asset/events/Biogenesis/Beyondthelimits-Biogenesis_2/Beyondthelimits-Biogenesis_2-1.png",
        "asset/events/Biogenesis/Beyondthelimits-Biogenesis_2/Beyondthelimits-Biogenesis_2-2.png",
      ],
      organizer: "Uvaijul Kalfan U",
      registrationUrl: "",
      clusterName: "Biogenesis present",
    ),// waiting reglink,   ✅

    Event(
      title: " Pattukondi chooddam [Treasure Hunt]",
      description: " Round 1 -   \n Round 2 - \n Round 3 -  ",
      date: "Day 1",
      actualDate: "11.4.2025",
      time: "2:00 PM - 3:30 PM",
      venue: "316",
      imageUrl: ["asset/events/VinodhaVaahini/TreasureHunt-VinodhaVaahini_1.png",],
      organizer: " A.Yaswanth \nS.Vedasri",
      registrationUrl: "",
      clusterName: "Vinodha Vahini present",
    ),//waiting reglink,  des ✅

    Event(
      title: "A Tamil drama",
      description: " Round 1 -   \n Round 2 - \n Round 3 -  ",
      date: "Day 1",
      actualDate: "11.4.2025",
      time: "2:00 PM - 3:00 PM",
      venue: "Auditorium",
      imageUrl: ["asset/events/Equilibria/Koothupatrai-Equilibria_3.png",],
      organizer: " A.Yaswanth \nS.Vedasri",
      registrationUrl: "",
      clusterName: "Equillibria  present",
    ),//waiting reglink, orgname, des ✅

    //Day 2

    Event(
      title: "Clash of Minds",
      description: " Round 1 -  \n Round 2 -  \n Round 3 - ",
      date: "Day 2",
      actualDate: "12.4.2025",
      time: "9:00 AM - 02:00 PM",
      venue: "402",
      imageUrl: [
        "asset/events/Electronica/ClashofMinds-Electronica_2/ClashofMinds-Electronica_2-1.png",
        "asset/events/Electronica/ClashofMinds-Electronica_2/ClashofMinds-Electronica_2-2.png",
        "asset/events/Electronica/ClashofMinds-Electronica_2/ClashofMinds-Electronica_2-3.png",
        ],
      organizer: "K.Nirmal\nK.Revanth",
      registrationUrl: "",
      clusterName: "Electronica present",
    ), //waiting time, reglink, image  ✅

    Event(
      title: "Rhythm Quest",
      description: " Round 1 - Pass The flow, let it go  \n Round 2 - Lyrics gone, sing it strong \n Round 3 - Tackle the task, crack the clue ",
      date: "Day 2",
      actualDate: "12.4.2025",
      time: "9:30 AM - 4:00 PM",
      venue: "202",
      imageUrl: [
        "asset/events/Mathematica/RhythmQuest-Mathematica_2/RhythmQuest-Mathematica_2-1.png",
        "asset/events/Mathematica/RhythmQuest-Mathematica_2/RhythmQuest-Mathematica_2-2.png",
        "asset/events/Mathematica/RhythmQuest-Mathematica_2/RhythmQuest-Mathematica_2-3.png",
        "asset/events/Mathematica/RhythmQuest-Mathematica_2/RhythmQuest-Mathematica_2-4.png",
      ],
      organizer: "Srinidhi C",
      registrationUrl: "",
      clusterName: "Mathematica present",
    ),//waiting reglink, image ✅

    Event(
      title: "Number Ninjas",
      description: " Round 1 - Brain Age  \n Round 2 - Myth-busting \n Round 3 - Lock Cracker ",
      date: "Day 2",
      actualDate: "12.4.2025",
      time: "9:30 AM - 4:00 PM",
      venue: "211",
      imageUrl: [
        "asset/events/Mathematica/NumberNinjas-Mathematica_3/NumberNinjas-Mathematica_3-1.png",
        "asset/events/Mathematica/NumberNinjas-Mathematica_3/NumberNinjas-Mathematica_3-2.png",
        "asset/events/Mathematica/NumberNinjas-Mathematica_3/NumberNinjas-Mathematica_3-3.png",
        "asset/events/Mathematica/NumberNinjas-Mathematica_3/NumberNinjas-Mathematica_3-4.png",
      ],
      organizer: "Bhadhra Priya R",
      registrationUrl: "",
      clusterName: "Mathematica present",
    ),//waiting reglink, image ✅

    Event(
      title: "F Cube",
      description: " Round 1 - Find \n Round 2 - Fetch \n Round 3 - Fun ",
      date: "Day 2",
      actualDate: "12.4.2025",
      time: "9:30 AM - 12:30 PM",
      venue: "Drawing Hall",
      imageUrl: [
        "asset/events/AccessIndia/Event2/FCube-AccessIndia_2.png",
        "asset/events/AccessIndia/Event2/FCube-AccessIndia_2(2).png",
      ],
      organizer: "Afreen Banu T",
      registrationUrl: "",
      clusterName: "Access India present",
    ),// waiting reglink,image ✅

    Event(
      title: "RRR[Reverse, React, Recognize]",
      description: " Round 1 -  Guess the song  \n Round 2 -  Cup Chasing \n Round 3 - Find the logo ",
      date: "Day 2",
      actualDate: "12.4.2025",
      time: "10:00 AM - 2:00 PM",
      venue: "303",
      imageUrl: [
        "asset/events/Strategia/RRR-Strategia_1/RRR-Strategia_1-1.png",
        "asset/events/Strategia/RRR-Strategia_1/RRR-Strategia_1-2.png",
      ],
      organizer: "Sheikha Farveena A",
      registrationUrl: "",
      clusterName: "Strategia present",
    ),//waiting reglink, image ✅

    Event(
      title: "Code Master",
      description: " Round 1 - Easy \n Round 2 - Medium \n Round 3 - Hard",
      date: "Day 2",
      actualDate: "12.4.2025",
      time: "10:00 AM - 1:00 PM",
      venue: "Lab 1",
      imageUrl: ["asset/events/Informatica/Event2/CODEMASTER-Informatica_2.png",],
      organizer: "Shobia R",
      registrationUrl: "",
      clusterName: "Informatica present",
    ),//waiting reglink,image ✅

    Event(
      title: "Apt APt",
      description: " Round 1 - Macho Matchacho  \n Round 2 - The Silent Chick\n Round 3 - Tales From the tool box",
      date: "Day 2",
      actualDate: "12.4.2025",
      time: "10:00 AM - 12:00 PM",
      venue: "510",
      imageUrl: [
        "asset/events/Optica/Event2/AptApt-Optica_2.png",
        "asset/events/Optica/Event2/AptApt-Optica_2(1).png",
      ],
      organizer: "Porkodi P G",
      registrationUrl: "",
      clusterName: "Optica present",
    ),//waiting reglink, image  ✅

    Event(
      title: "Power Lift",
      description: " Round 1 -  \n Round 2 - \n Round 3 - ",
      date: "Day 2",
      actualDate: "12.4.2025",
      time: "10:30 AM - 12:30 PM",
      venue: "Stall",
      imageUrl: ["asset/events/Sportiva/event2/PowerLifting-Sportiva_D2.png",],
      organizer: "Yuvaraj A\nGovindaraj A\nSriram S",
      registrationUrl: "",
      clusterName: "Sportiva present",
    ),//waiting reglink, image, des ✅

    Event(
      title: "Foot Ball",
      description: " Round 1 -  \n Round 2 - \n Round 3 - ",
      date: "Day 2",
      actualDate: "12.4.2025",
      time: "10:30 AM - 12:30 PM",
      venue: "Football court",
      imageUrl: ["asset/events/Sportiva/event2/Football-Sportiva_D2.png",],
      organizer: "Aswin G\nPrasanth M\nManisai A",
      registrationUrl: "",
      clusterName: "Sportiva present",
    ),//waiting reglink, image, des ✅

    Event(
      title: "Tug Of War",
      description: " Round 1 -  \n Round 2 - \n Round 3 - ",
      date: "Day 2",
      actualDate: "12.4.2025",
      time: "11:30 AM - 2:30 PM",
      venue: "Kabadi court",
      imageUrl: ["asset/events/Sportiva/event2/Thugofwar-Sportiva_D2.png",],
      organizer: "Srinivas C\nKeerthivas I\nSujitha A\nMonisha kamala S",
      registrationUrl: "",
      clusterName: "Sportiva present",
    ),//waiting reglink, image, des ✅

    Event(
      title: "Tech Talent",
      description: " Round 1 - Easy  \n Round 2 - Medium \n Round 3 - Hard ",
      date: "Day 2",
      actualDate: "12.4.2025",
      time: "2:00 PM - 4:00 PM",
      venue: "Lab 1",
      imageUrl: ["asset/events/Informatica/Event3/TECHTALENT-Informatica_3.png",],
      organizer: "RajaSri S",
      registrationUrl: "",
      clusterName: "Informatica present",
    ),//waiting reglink  ✅

    Event(
      title: "Balloon blasters",
      description: " Round 1 -  \n Round 2 -  \n Round 3 - ",
      date: "Day 1",
      actualDate: "11.4.2025",
      time: "2:00 PM - 3:00 PM",
      venue: "Basketball court",
      imageUrl: [
        "asset/events/Robotics/BallonBlaster-Robotics_2/BallonBlaster-Robotics_2-1.png",
        "asset/events/Robotics/BallonBlaster-Robotics_2/BallonBlaster-Robotics_2-2.png",
          ],
      organizer: "K.Nirmal\nK.Revanth",
      registrationUrl: "",
      clusterName: "Robotics present",
    ), //waiting reglink ✅

    Event(
      title: "Wit Wizard War",
      description: " Round 1 - Handy cortex \n Round 2 - Witty word play \n Round 3 - Mime and Maze",
      date: "Day 2",
      actualDate: "12.4.2025",
      time: "2:00 PM - 5:00 PM",
      venue: "T&P Hall",
      imageUrl: [
        "asset/events/Biogenesis/Witwizardwar-Biogenesis_3/Witwizardwar-Biogenesis_3-1.png",
        "asset/events/Biogenesis/Witwizardwar-Biogenesis_3/Witwizardwar-Biogenesis_3-2.png",
      ],
      organizer: "Sowmiya R",
      registrationUrl: "",
      clusterName: "Biogenesis present",
    ),//waiting reglink  ✅

    Event(
      title: "Pattimandram",
      description: " Round 1 - Handy cortex \n Round 2 - Witty word play \n Round 3 - Mime and Maze",
      date: "Day 2",
      actualDate: "12.4.2025",
      time: "2:30 PM - 5:30 PM",
      venue: "Auditorium",
      imageUrl: [
        "asset/events/Equilibria/Pattimandram-Equlibria-1.png",
          ],
      organizer: "Sowmiya R",
      registrationUrl: "",
      clusterName: "Equillibria present",
    ),//waiting reglink, image   ✅

    //Day 3

    Event(
      title: "The Great Treasure Hunt",
      description: " Round 1 -  \n Round 2 -  \n Round 3 - ",
      date: "Day 3",
      actualDate: "13.4.2025",
      time: "9:30 AM - 12:30 PM",
      venue: "402",
      imageUrl: [
        "asset/events/Electronica/GreatTreasureHunt-Electronica_3/GreatTreasureHunt-Electronica_3-1.png",
        "asset/events/Electronica/GreatTreasureHunt-Electronica_3/GreatTreasureHunt-Electronica_3-2.png",
      ],
      organizer: "K.Nirmal\nK.Revanth",
      registrationUrl: "",
      clusterName: "Electronica present",
    ), //waiting time, reglink, image  ✅

    Event(
      title: "Robo race",
      description: " Round 1 -  \n Round 2 - \n Round 3 - ",
      date: "Day 3",
      actualDate: "13.4.2025",
      time: "10:00 AM - 11:00 PM",
      venue: "Basketball court",
      imageUrl: [
        "asset/events/Robotics/RoboRace-Robotics_3/RoboRace-Robotics_3-1.png",
        "asset/events/Robotics/RoboRace-Robotics_3/RoboRace-Robotics_3-2.png",
      ],
      organizer: "Kaviya B\nYamini M\nAarthi H",
      registrationUrl: "",
      clusterName: "Robotics present",
    ),//waiting reglink, image, des ✅

    Event(
      title: "Double Trouble",
      description: " Round 1 -  \n Round 2 - \n Round 3 - ",
      date: "Day 3",
      actualDate: "13.4.2025",
      time: "10:00 AM - 12:00 PM",
      venue: "512",
      imageUrl: ["asset/events/Sportiva/event2/PowerLifting-Sportiva_D2.png",],
      organizer: "Kaviya B\nYamini M\nAarthi H",
      registrationUrl: "",
      clusterName: "Optica present",
    ),//waiting reglink, image, des ✅

    Event(
      title: "Cups Lifting",
      description: " Round 1 -  \n Round 2 - \n Round 3 - ",
      date: "Day 2",
      actualDate: "12.4.2025",
      time: "10:30 AM - 12:30 PM",
      venue: "Stall",
      imageUrl: ["asset/events/Sportiva/event2/PowerLifting-Sportiva_D2.png",],
      organizer: "Kaviya B\nYamini M\nAarthi H",
      registrationUrl: "",
      clusterName: "Sportiva present",
    ),//waiting reglink, image, des ✅

    //access india



    //Biogenesis





    //electronica





    //Informatica






    //Mathematica






    //Strategia


    Event(
      title: "Brain Snap Challenge",
      description: " Round 1 - Picture Quest  \n Round 2 -  Mind maze \n Round 3 - Momentary memory ",
      date: "Day 2",
      actualDate: "12.4.2025",
      time: "9:30 AM - 1:30 PM",
      venue: "310",
      imageUrl: [
        "asset/events/Strategia/BrainSnap-Strategia_2/BrainSnap-Strategia_2-1.png",
        "asset/events/Strategia/BrainSnap-Strategia_2/BrainSnap-Strategia_2-2.png",
      ],
      organizer: "Atchaya S",
      registrationUrl: "",
      clusterName: "Strategia present",
    ),//waiting reglink, image ✅




    //Optica






    //Vinodha Vahini


    //Robotics


    //Sportiva







  ];

  @override
  void initState() {
    super.initState();
    _removePastEvents();
    NotificationService.scheduleEventNotifications(events);
  }



  void _removePastEvents() {
    DateTime now = DateTime.now();
    setState(() {
      events.removeWhere((event) {
        DateTime eventDateTime = _parseEventDateTime(event.actualDate, event.time);
        return eventDateTime.isBefore(now);
      });
    });
  }

  DateTime _parseEventDateTime(String date, String time) {
    try {
      DateFormat dateFormat = DateFormat("d.M.yyyy h:mm a");
      return dateFormat.parse("$date $time");
    } catch (e) {
      return DateTime(3000); // Fallback to a future date if parsing fails
    }
  }

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    // ignore: unused_local_variable
    final themeState = utils.getTheme;
    // ignore: unused_local_variable
    final Color color = Utils(context).color;
    // ignore: unused_local_variable
    Size size = Utils(context).getScreenSize;

    Map<String, List<Event>> groupedEvents = {};
    for (var event in events) {
      groupedEvents.putIfAbsent(event.date, () => []).add(event);
    }

    return Scaffold(
      appBar: AppBar(
        title:  Center(
          child: Text(
            "Event Timeline",
            style: GoogleFonts.poppins(color: color, fontWeight: FontWeight.bold),

          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: groupedEvents.entries.map((entry) {
            if (entry.value.isEmpty) return SizedBox();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ✅ Day Label (Outside Box, Left-Aligned)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Shimmer.fromColors(
                    baseColor: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white  // Dark mode: Base color is white
                        : Colors.black, // Light mode: Base color is black
                    highlightColor: Theme.of(context).brightness == Brightness.dark
                        ? Colors.black  // Dark mode: Highlight color is black
                        : Colors.white, // Light mode: Highlight color is white
                    child: Text(
                      entry.key, // "Day 1", "Day 2", etc.
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        //color: color,
                      ),
                    ),
                  ),
                ),

                // ✅ Events for the day (Alternating positions)
                Column(
                  children: entry.value.asMap().entries.map((e) {
                    int index = e.key;
                    return TweenAnimationBuilder(
                      duration: Duration(milliseconds: 700 + (index * 100)),
                      tween: Tween<double>(begin: 0, end: 1),
                      curve: Curves.easeOut,
                      builder: (context, double value, child) {
                        return Transform.translate(
                          offset: Offset((index % 2 == 0 ? 50 : -50) * (1 - value), 0),
                          child: Opacity(opacity: value, child: child),
                        );
                      },
                      child: Align(
                        alignment: index % 2 == 0 ? Alignment.centerRight : Alignment.centerLeft,
                        child: TimelineItem(
                          event: e.value,
                          isLeft: index % 2 == 0, // ✅ First event right, second left, alternating
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

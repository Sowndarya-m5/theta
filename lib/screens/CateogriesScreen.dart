import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/utils.dart';
import '../wigets/Categories_widget.dart';

// ignore: must_be_immutable
class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);

  List<Color> gridColors = [
    Colors.amber,
    Colors.blue,
    Colors.brown,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.green,
    Colors.indigo,
    Colors.lime,
    Colors.red,
    Colors.yellow,
    Colors.teal,
    Colors.indigo,
  ];
  List<Map<String, dynamic>> date = [
    {
      'date': '24.05.2025',
    },
    {
      'date': '24.05.2025',
    },
    {
      'date': '24.05.2025',
    },
    {
      'date': '24.05.2025',
    },
    {
      'date': '25.05.2025',
    },
    {
      'date': '25.05.2025',
    },
    {
      'date': '25.05.2025',
    },
    {
      'date': '25.05.2025',
    },
    {
      'date': '25.05.2025',
    },
    {
      'date': '26.05.2025',
    },
    {
      'date': '26.05.2025',
    },
    {
      'date': '26.05.2025',
    },
  ];
  List<Map<String, dynamic>> day = [
    {
      'day': 'Day1',
    },
    {
      'day': 'Day1',
    },
    {
      'day': 'Day1',
    },
    {
      'day': 'Day1',
    },
    {
      'day': 'Day2',
    },
    {
      'day': 'Day2',
    },
    {
      'day': 'Day2',
    },
    {
      'day': 'Day2',
    },
    {
      'day': 'Day2',
    },
    {
      'day': 'Day3',
    },
    {
      'day': 'Day3',
    },
    {
      'day': 'Day3',
    },
  ];
  List<Map<String, dynamic>> catInfo = [
    {
      'imgPath': 'asset/istockphoto-1095808852-612x612.jpg',
      'catText': 'Inauguration - 9:30 A.M',
    },
    {
      'imgPath': 'asset/events.jpg',
      'catText': 'Cluster Events',
    },
    {
      'imgPath': 'asset/dj.jpg',
      'catText': 'DJ Music - 5:00 PM',
    },
    {
      'imgPath': 'asset/Swaraag.jpg',
      'catText': 'Swaraag - 6:00 PM',
    },
    {
      'imgPath': 'asset/events.jpg',
      'catText': 'Cluster Events',
    },
    {
      'imgPath': 'asset/movies.jpg',
      'catText': 'Emulsion - 9:00 AM',
    },
    {
      'imgPath': 'asset/Pattimandram.png',
      'catText': 'Pattimandram - 2:00 PM',
    },
    {
      'imgPath': 'asset/dj.jpg',
      'catText': 'DJ Music - 5:00 PM',
    },
    {
      'imgPath': 'asset/dance.jpg',
      'catText': 'Team Recoil = 6:00 PM',
    },
    {
      'imgPath': 'asset/events.jpg',
      'catText': 'Cluster Events',
    },
    {
      'imgPath': 'asset/pro.jpg',
      'catText': 'Pro Shows',
    },
    {
      'imgPath': "asset/cultural/onelove.png",
      'catText': 'Pro Nite - 6:00 PM',
    },
  ];
  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    Color color = utils.color;
    return Scaffold(
      appBar: AppBar(
        // leading: InkWell(
        //   borderRadius: BorderRadius.circular(12),
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        //   child: Icon(
        //     IconlyLight.arrowLeft2,
        //     color: color,
        //   ),
        // ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Theta 3 days celebration ',
          style: GoogleFonts.poppins(
              color: color, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
       body: Padding(
         padding: const EdgeInsets.all(8.0),
         child: LayoutBuilder(
           builder: (context, constraints) {
             double width = constraints.maxWidth;
             int crossAxisCount = width > 600 ? 2 : 1; // 2 columns for larger screens

             return GridView.builder(
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: crossAxisCount,
                 crossAxisSpacing: 15,
                 mainAxisSpacing: 15,
                 childAspectRatio: 1.2, // Adjust aspect ratio for better fit
               ),
               itemCount: 12,
               itemBuilder: (context, index) {
                 return CategoriesWidget(
                   day: day[index]['day'],
                   date: date[index]['date'],
                   catText: catInfo[index]['catText'],
                   imgPath: catInfo[index]['imgPath'],
                   passedcolor: gridColors[index],
                 );
               },
             );
           },
         ),
       ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// import '../models/User.dart';
// import '../register/datahelp.dart';
// import '../services/userService.dart';
// import 'viewUser.dart';
// // The file where DatabaseHelper is located
//
// class memScreen extends StatefulWidget {
//   @override
//   _memScreenState createState() => _memScreenState();
// }
//
// class _memScreenState extends State<memScreen> {
//   late List<registers> _userList;
//   final _userService = userService();
//
//   getAllUsers() async {
//     var users = await _userService.readAllUsers();
//     _userList = <registers>[];
//     users.forEach((user) {
//       setState(() {
//         var userModel = registers();
//         userModel.id = user['id'];
//         userModel.rname = user['rname'];
//         userModel.rroll = user['rroll'];
//         userModel.rphone = user['rphone'];
//         userModel.rclass = user['rclass'];
//         userModel.rcollege = user['rcollege'];
//         _userList.add(userModel);
//       });
//     });
//   }
//
//   late Future<List<Map<String, dynamic>>> memberData;
//
//   @override
//   void initState() {
//     super.initState();
//     getAllUsers();
//     memberData = DatabaseHelp().getMembers();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Orders and Members'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Display the 'reg' table data
//
//             // Display the 'member' table data
//             FutureBuilder<List<Map<String, dynamic>>>(
//               future: memberData,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return CircularProgressIndicator();
//                 } else if (snapshot.hasError) {
//                   return Text('Error!');
//                 } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                   return Text('No Members Available');
//                 } else {
//                   final members = snapshot.data!;
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         ListView.builder(
//                           shrinkWrap: true,
//                           physics: NeverScrollableScrollPhysics(),
//                           itemCount: members.length,
//                           itemBuilder: (context, index) {
//                             final member = members[index];
//                             return GestureDetector(
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => viewUser(
//                                       user: _userList[index],
//                                     ),
//                                   ),
//                                 );
//                               },
//                               child: Card(
//                                 margin: EdgeInsets.symmetric(vertical: 8),
//                                 child: ListTile(
//                                   title: Center(child: Text(member['name'])),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                   );
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

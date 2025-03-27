//
// import 'package:flutter/material.dart';
//
// import '../services/userService.dart';
// import 'viewUser.dart';
//
// class OrderScreen extends StatefulWidget {
//   @override
//   _OrderScreenState createState() => _OrderScreenState();
// }
//
// class _OrderScreenState extends State<OrderScreen> {
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
//   List<Map<String, dynamic>> _orders = [];
//   bool _isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     getAllUsers();
//     _fetchOrders();
//   }
//
//   Future<void> _fetchOrders() async {
//     try {
//       final orders = await DatabaseHelpers().getOrders();
//       ;
//       setState(() {
//         _orders = orders;
//         _isLoading = false;
//       });
//     } catch (e) {
//       // Handle errors if needed
//       setState(() {
//         _isLoading = false;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to load orders!')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Your Register')),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : _orders.isEmpty
//               ? Center(
//                   child: Text(
//                   'No orders yet.',
//                   style: TextStyle(fontSize: 18, color: Colors.grey),
//                 ))
//               : ListView.builder(
//                   padding: const EdgeInsets.all(8.0),
//                   itemCount: _orders.length,
//                   itemBuilder: (context, index) {
//                     final order = _orders[index];
//                     return GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => viewUser(
//                               user: _userList[index],
//                             ),
//                           ),
//                         );
//                       },
//                       child: Card(
//                         elevation: 5,
//                         margin: const EdgeInsets.symmetric(
//                             vertical: 8.0, horizontal: 10.0),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Center(
//                                 child: Text(
//                                   '${order['cname']}',
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.teal,
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 8),
//                               Text('${order['name']}',
//                                   style: TextStyle(fontSize: 16)),
//                               SizedBox(height: 8),
//                               Text('Date: ${order['date']}',
//                                   style: TextStyle(
//                                       fontSize: 14, color: Colors.grey)),
//                               Text('Time: ${order['time']}',
//                                   style: TextStyle(
//                                       fontSize: 14, color: Colors.grey)),
//                               Text('Venue: ${order['venue']}',
//                                   style: TextStyle(
//                                       fontSize: 14, color: Colors.grey)),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//     );
//   }
// }

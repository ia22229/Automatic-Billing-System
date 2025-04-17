// import 'package:automaticbilling/vehicle/vehiclehome.dart';
// import 'package:flutter/material.dart';
// import 'dart:convert';
//
// import 'package:fluttertoast/fluttertoast.dart';
// // import 'package:hks/editprofile.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
//
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: '',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//     );
//   }
// }
//
// class userProfile_new1 extends StatefulWidget {
//   const userProfile_new1({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<userProfile_new1> createState() => _userProfile_new1State();
// }
//
// class _userProfile_new1State extends State<userProfile_new1> {
//   @override
//   void initState() {
//     super.initState();
//     senddata();
//   }
//
//   String name = '';
//   String gender = '';
//   String dob = '';
//   String post = '';
//   String place = '';
//   String pin = '';
//   String photo = '';
//   String email = '';
//   String phone = '';
//   String state = '';
//   String district = '';
//
//   Future<bool> _onWillPop() async {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => VehicleHomeNewPage(title: 'Home')),
//     );
//     return false; // Prevent default back action
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: _onWillPop, // Custom back button handler
//       child: Scaffold(
//         backgroundColor: Colors.grey.shade300,
//         body: SingleChildScrollView(
//           child: Stack(
//             children: [
//               SizedBox(
//                 height: 280,
//                 width: double.infinity,
//                 child: Image.network(
//                   photo,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.fromLTRB(16.0, 240.0, 16.0, 16.0),
//                 child: Column(
//                   children: [
//                     Stack(
//                       children: [
//                         Container(
//                           padding: EdgeInsets.all(16.0),
//                           margin: EdgeInsets.only(top: 16.0),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(20.0),
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                 margin: const EdgeInsets.only(left: 110.0),
//                                 child: Row(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       mainAxisAlignment: MainAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           ' $name',
//                                           style: Theme.of(context).textTheme.headline6,
//                                         ),
//                                         SizedBox(
//                                           height: 40,
//                                         ),
//                                       ],
//                                     ),
//                                     Spacer(),
//                                     CircleAvatar(
//                                       backgroundColor: Colors.blueAccent,
//                                       child: IconButton(
//                                         onPressed: () {
//                                           // Navigator.push(
//                                           //   context,
//                                           //   MaterialPageRoute(
//                                           //     builder: (context) => MyEditPage(title: 'Edit Profile'),
//                                           //   ),
//                                           // );
//                                         },
//                                         icon: Icon(
//                                           Icons.edit_outlined,
//                                           color: Colors.white,
//                                           size: 18,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(height: 10.0),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           height: 90,
//                           width: 90,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20.0),
//                             image: DecorationImage(
//                               image: NetworkImage(photo),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           margin: EdgeInsets.only(left: 20.0),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 20.0),
//                     Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(20.0),
//                       ),
//                       child: Column(
//                         children: [
//                           ListTile(
//                             title: Text("Profile Information"),
//                           ),
//                           Divider(),
//                           ListTile(
//                             title: Text("Gender"),
//                             subtitle: Text(gender),
//                             leading: Icon(Icons.calendar_view_day),
//                           ),
//                           ListTile(
//                             title: Text("Pin"),
//                             subtitle: Text(pin),
//                             leading: Icon(Icons.phone),
//                           ),
//                           ListTile(
//                             title: Text('Email'),
//                             subtitle: Text(email),
//                             leading: Icon(Icons.mail_outline),
//                           ),
//                           ListTile(
//                             title: Text("Phone"),
//                             subtitle: Text(phone),
//                             leading: Icon(Icons.phone),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Positioned(
//                 top: 60,
//                 left: 20,
//                 child: MaterialButton(
//                   minWidth: 0.2,
//                   elevation: 0.2,
//                   color: Colors.white,
//                   child: const Icon(
//                     Icons.arrow_back_ios_outlined,
//                     color: Colors.indigo,
//                   ),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30.0),
//                   ),
//                   onPressed: () {
//                     // Custom back navigation here, for instance, navigate to the home screen
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => VehicleHomeNewPage(title: 'Home',)));
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void senddata() async {
//     SharedPreferences sh = await SharedPreferences.getInstance();
//     String url = sh.getString('url').toString();
//     String lid = sh.getString('lid').toString();
//     final urls = Uri.parse(url + "/ViewProfile/");
//     try {
//       final response = await http.post(urls, body: {
//         'lid': lid,
//       });
//       if (response.statusCode == 200) {
//         String status = jsonDecode(response.body)['status'];
//         if (status == 'ok') {
//           Fluttertoast.showToast(msg: 'Success');
//
//           name = jsonDecode(response.body)['name'].toString();
//           gender = jsonDecode(response.body)['gender'].toString();
//           dob = jsonDecode(response.body)['dob'].toString();
//           post = jsonDecode(response.body)['post'].toString();
//           place = jsonDecode(response.body)['place'].toString();
//           pin = jsonDecode(response.body)['pin'].toString();
//           email = jsonDecode(response.body)['email'].toString();
//           phone = jsonDecode(response.body)['phone'].toString();
//
//           setState(() {
//             photo = sh.getString('imgurl').toString() + jsonDecode(response.body)['photo'];
//           });
//         } else {
//           Fluttertoast.showToast(msg: 'Not Found');
//         }
//       } else {
//         Fluttertoast.showToast(msg: 'Network Error');
//       }
//     } catch (e) {
//       Fluttertoast.showToast(msg: e.toString());
//     }
//   }
// }

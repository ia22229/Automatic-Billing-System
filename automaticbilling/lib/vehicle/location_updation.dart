// import 'dart:convert';
// import 'package:automaticbilling/vehicle/vehiclehome.dart';
// import 'package:http/http.dart' as http;
//
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:shared_preferences/shared_preferences.dart';
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
//       title: 'Flutter Demo',
//       theme: ThemeData(
//
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const DriverLocation(title: 'Update Location'),
//     );
//   }
// }
//
// class DriverLocation extends StatefulWidget {
//   const DriverLocation({super.key, required this.title});
//
//
//
//   final String title;
//
//   @override
//   State<DriverLocation> createState() => _DriverLocationState();
// }
// List<String> list=<String>[];
// class _DriverLocationState extends State<DriverLocation> {
//   _DriverLocationState(){
//     getdata();
//   }
//   // TextEditingController buscontroller=new TextEditingController();
//   List<int>Bus_id=<int>[];
//   List<String>Bus_name=<String>[];
//   String dropdownValue1="";
//   TextEditingController longitudecontroller=new TextEditingController();
//   TextEditingController latitudecontroller=new TextEditingController();
//   TextEditingController placecontroller=new TextEditingController();
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//
//         title: Text(widget.title),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//
//           child: Column(
//
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               // Row(
//               //   mainAxisAlignment: MainAxisAlignment.center,
//               //   children: [
//               //     Text('Bus:         '),
//               //     DropdownButton<String>(
//               //       value: dropdownValue1,
//               //       onChanged: (String? value) {
//               //
//               //         print(dropdownValue1);
//               //         print("Hiiii");
//               //         setState(() {
//               //           dropdownValue1 = value!;
//               //         });
//               //       },
//               //       items: Bus_name.map((String value) {
//               //         return DropdownMenuItem(
//               //           value: value,
//               //           child: Text(value),
//               //         );
//               //       }).toList(),
//               //     ),
//               //   ],
//               // ),
//               // Padding(
//               //
//               //   padding: EdgeInsets.all(10),
//               //   child: TextField(
//               //     controller: buscontroller,
//               //     decoration: InputDecoration(border: OutlineInputBorder(),
//               //         labelText: 'bus'
//               //     ),
//               //   ),
//               // ),
//               Padding(
//                 padding: EdgeInsets.all(10),
//                 child: TextField(
//                   controller: placecontroller,
//                   decoration: InputDecoration(border: OutlineInputBorder(),
//                       labelText: 'place'
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(10),
//                 child: TextField(
//                   controller: latitudecontroller,
//                   decoration: InputDecoration(border: OutlineInputBorder(),
//                       labelText: 'latitude'
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(10),
//                 child: TextField(
//                   controller: longitudecontroller,
//                   decoration: InputDecoration(border: OutlineInputBorder(),
//                       labelText: 'longitude'
//                   ),
//                 ),
//               ),
//
//               ElevatedButton(onPressed: (){sendata();}, child: Text('update'))
//
//             ],
//           ),
//         ),
//       ),
//
//     );
//   }
//   void getdata()async{
//     List<int>Bus_id=<int>[];
//     List<String>Bus_name=<String>[];
//     SharedPreferences sh = await SharedPreferences.getInstance();
//     String url = sh.getString('url').toString();
//     final urls = Uri.parse('$url/view_bus_in_driver/');
//     var data=await http.post(urls,body: {});
//     var jsondata=json.decode(data.body);
//     String status=jsondata['status'];
//     var arr=jsondata["data"];
//     for(int i=0;i<arr.length;i++){
//       Bus_id=Bus_id;
//       Bus_name=Bus_name;
//       dropdownValue1=Bus_name.first;
//
//     }
//   }
//   void sendata()async{
//     String latitude=latitudecontroller.text;
//     String longitude=longitudecontroller.text;
//     String place=placecontroller.text;
//
//     SharedPreferences sh = await SharedPreferences.getInstance();
//     String url = sh.getString('url').toString();
//     String lid=sh.getString("lid").toString();
//
//     final urls = Uri.parse('$url/updatelocation/');
//     try {
//       final response = await http.post(urls, body: {
//         'latitude':latitude,
//         'longitude':longitude,
//         'lid':sh.getString("lid").toString(),
//         'place':place,
//
//
//
//         //'Bus_name':Bus_id[Bus_name.indexOf(dropdownValue1)].toString()
//
//       });
//       print(jsonDecode(response.body));
//       if (response.statusCode == 200) {
//         String status = jsonDecode(response.body)['status'];
//         print(status);
//         if (status=='ok') {
//
//
//           Navigator.push(context, MaterialPageRoute(
//             builder: (context) => VehicleHomeNewPage(title: "Home"),));
//         }else {
//           Fluttertoast.showToast(msg: 'Not Found');
//         }
//       }
//       else {
//         Fluttertoast.showToast(msg: 'Network Error');
//       }
//     }
//     catch (e){
//       Fluttertoast.showToast(msg: e.toString());
//     }
//
//   }
// }
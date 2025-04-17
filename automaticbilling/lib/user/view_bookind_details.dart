// import 'package:automaticbilling/user/home.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
//
//
// void main() {
//   runApp(const ViewBooking());
// }
//
// class ViewBooking extends StatelessWidget {
//   const ViewBooking({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'View Reply',
//       theme: ThemeData(
//
//         colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 18, 82, 98)),
//         useMaterial3: true,
//       ),
//       home: const ViewBookingPage(title: 'View Reply'),
//     );
//   }
// }
//
// class ViewBookingPage extends StatefulWidget {
//   const ViewBookingPage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<ViewBookingPage> createState() => _ViewBookingPageState();
// }
//
// class _ViewBookingPageState extends State<ViewBookingPage> {
//
//   _ViewBookingPageState(){
//     ViewBooking();
//   }
//
//   List<String> id_ = <String>[];
//   List<String> date_= <String>[];
//   List<String> name_= <String>[];
//   List<String> vehicle_= <String>[];
//   List<String> rp1_= <String>[];
//   List<String> rp2_= <String>[];
//   List<String> chkin_= <String>[];
//   List<String> chkout_= <String>[];
//
//   Future<void> ViewBooking() async {
//     List<String> id = <String>[];
//     List<String> date = <String>[];
//     List<String> name = <String>[];
//     List<String> vehicle = <String>[];
//     List<String> rp1 = <String>[];
//     List<String> rp2 = <String>[];
//     List<String> chkin = <String>[];
//     List<String> chkout = <String>[];
//
//
//     try {
//       SharedPreferences sh = await SharedPreferences.getInstance();
//       String urls = sh.getString('url').toString();
//       String lid = sh.getString('lid').toString();
//       String url = '$urls/view_booking_details/';
//
//       var data = await http.post(Uri.parse(url), body: {
//
//         'lid':lid
//
//       });
//       var jsondata = json.decode(data.body);
//       String statuss = jsondata['status'];
//
//       var arr = jsondata["data"];
//
//       print(arr.length);
//
//       for (int i = 0; i < arr.length; i++) {
//         id.add(arr[i]['id'].toString());
//         date.add(arr[i]['date'].toString());
//         name.add(arr[i]['name'].toString());
//         vehicle.add(arr[i]['vehicle'].toString());
//         rp1.add(arr[i]['routpoint1'].toString());
//         rp2.add(arr[i]['routpoint2'].toString());
//         chkin.add(arr[i]['checkintime'].toString());
//         chkout.add(arr[i]['checkouttime'].toString());
//       }
//
//       setState(() {
//         id_ = id;
//         date_ = date;
//         name_ = name;
//         vehicle_ = vehicle;
//         rp1_ = rp1;
//         rp2_ = rp2;
//         chkin_ = chkin;
//         chkout_ = chkout;
//       });
//
//       print(statuss);
//     } catch (e) {
//       print("Error ------------------- " + e.toString());
//       //there is error during converting file image to base64 encoding.
//     }
//   }
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//
//
//     return WillPopScope(
//       onWillPop: () async{ return true; },
//       child: Scaffold(
//         appBar: AppBar(
//           leading: BackButton( onPressed:() {
//
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => HomeNewPage(title: 'Home',)),);
//
//           },),
//           backgroundColor: Theme.of(context).colorScheme.primary,
//           title: Text(widget.title),
//         ),
//         body: ListView.builder(
//           physics: BouncingScrollPhysics(),
//           // padding: EdgeInsets.all(5.0),
//           // shrinkWrap: true,
//           itemCount: id_.length,
//           itemBuilder: (BuildContext context, int index) {
//             return ListTile(
//               onLongPress: () {
//                 print("long press" + index.toString());
//               },
//               title: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       Card(
//                         child:
//                         Row(
//                             children: [
//                               Column(
//                                 children: [
//                                   Padding(
//                                     padding: EdgeInsets.all(5),
//                                     child: Text("Date :" +date_[index]),
//                                   ),
//                                   Padding(
//                                     padding: EdgeInsets.all(5),
//                                     child: Text("Name :"+name_[index]),
//                                   ),    Padding(
//                                     padding: EdgeInsets.all(5),
//                                     child: Text("Vehicle :"+vehicle_[index]),
//                                   ),
//                                   Padding(
//                                     padding: EdgeInsets.all(5),
//                                     child: Text("Source:"+rp1_[index]),
//                                   ),
//                                   Padding(
//                                     padding: EdgeInsets.all(5),
//                                     child: Text("Destination :"+rp2_[index]),
//                                   ),
//                                   Padding(
//                                     padding: EdgeInsets.all(5),
//                                     child: Text("In Time :"+chkin_[index]),
//                                   ),
//                                   Padding(
//                                     padding: EdgeInsets.all(5),
//                                     child: Text("Out Time :"+chkout_[index]),
//                                   ),
//                                 ],
//                               ),
//
//                             ]
//                         ),
//
//                         elevation: 8,
//                         margin: EdgeInsets.all(10),
//                       ),
//                     ],
//                   )),
//             );
//           },
//         ),
//
//
//       ),
//     );
//   }
// }






import 'package:automaticbilling/user/home.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const ViewBooking());
}

class ViewBooking extends StatelessWidget {
  const ViewBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'View Bookings',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 18, 82, 98)),
        useMaterial3: true,
      ),
      home: const ViewBookingPage(title: 'View Bookings'),
    );
  }
}

class ViewBookingPage extends StatefulWidget {
  const ViewBookingPage({super.key, required this.title});

  final String title;

  @override
  State<ViewBookingPage> createState() => _ViewBookingPageState();
}

class _ViewBookingPageState extends State<ViewBookingPage> {
  _ViewBookingPageState() {
    ViewBooking();
  }

  List<String> id_ = <String>[];
  List<String> date_ = <String>[];
  List<String> name_ = <String>[];
  List<String> vehicle_ = <String>[];
  List<String> rp1_ = <String>[];
  List<String> rp2_ = <String>[];
  List<String> chkin_ = <String>[];
  List<String> chkout_ = <String>[];

  Future<void> ViewBooking() async {
    List<String> id = <String>[];
    List<String> date = <String>[];
    List<String> name = <String>[];
    List<String> vehicle = <String>[];
    List<String> rp1 = <String>[];
    List<String> rp2 = <String>[];
    List<String> chkin = <String>[];
    List<String> chkout = <String>[];

    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String lid = sh.getString('lid').toString();
      String url = '$urls/view_booking_details/';

      var data = await http.post(Uri.parse(url), body: {
        'lid': lid
      });
      var jsondata = json.decode(data.body);
      String statuss = jsondata['status'];
      var arr = jsondata["data"];

      for (int i = 0; i < arr.length; i++) {
        id.add(arr[i]['id'].toString());
        date.add(arr[i]['date'].toString());
        name.add(arr[i]['name'].toString());
        vehicle.add(arr[i]['vehicle'].toString());
        rp1.add(arr[i]['routpoint1'].toString());
        rp2.add(arr[i]['routpoint2'].toString());
        chkin.add(arr[i]['checkintime'].toString());
        chkout.add(arr[i]['checkouttime'].toString());
      }

      setState(() {
        id_ = id;
        date_ = date;
        name_ = name;
        vehicle_ = vehicle;
        rp1_ = rp1;
        rp2_ = rp2;
        chkin_ = chkin;
        chkout_ = chkout;
      });

    } catch (e) {
      print("Error ------------------- " + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeNewPage(title: 'Home')),
              );
            },
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: id_.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Date: ${date_[index]}",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent,
                              ),
                            ),
                            Text(
                              "Vehicle: ${vehicle_[index]}",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.person, color: Colors.orangeAccent),
                            SizedBox(width: 8),
                            Text(
                              "Name: ${name_[index]}",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: Colors.red),
                            SizedBox(width: 8),
                            Text(
                              "Source: ${rp1_[index]}",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: Colors.green),
                            SizedBox(width: 8),
                            Text(
                              "Destination: ${rp2_[index]}",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.access_time, color: Colors.blue),
                            SizedBox(width: 8),
                            Text(
                              "In Time: ${chkin_[index]}",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.access_time, color: Colors.red),
                            SizedBox(width: 8),
                            Text(
                              "Out Time: ${chkout_[index]}",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Divider(color: Colors.grey),
                        SizedBox(height: 8),
                        // Align(
                        //   alignment: Alignment.centerRight,
                        //   child: ElevatedButton(
                        //     onPressed: () {
                        //       Fluttertoast.showToast(msg: "More details coming soon...");
                        //     },
                        //     child: Text("View Details"),
                        //     style: ElevatedButton.styleFrom(
                        //       primary: Colors.blueAccent,
                        //       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        //       shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(10),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

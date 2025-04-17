// import 'package:automaticbilling/user/home.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main() {
//   runApp(const ViewPayment());
// }
//
// class ViewPayment extends StatelessWidget {
//   const ViewPayment({super.key});
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
//       home: const ViewPaymentPage(title: 'View Reply'),
//     );
//   }
// }
//
// class ViewPaymentPage extends StatefulWidget {
//   const ViewPaymentPage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<ViewPaymentPage> createState() => _ViewPaymentPageState();
// }
//
// class _ViewPaymentPageState extends State<ViewPaymentPage> {
//
//   _ViewPaymentPageState(){
//     ViewPayment();
//   }
//
//   List<String> id_ = <String>[];
//   List<String> date_= <String>[];
//   List<String> amount_= <String>[];
//   List<String> status_= <String>[];
//
//   Future<void> ViewPayment() async {
//     List<String> id = <String>[];
//     List<String> date = <String>[];
//     List<String> amount = <String>[];
//     List<String> status = <String>[];
//
//
//     try {
//       SharedPreferences sh = await SharedPreferences.getInstance();
//       String urls = sh.getString('url').toString();
//       String lid = sh.getString('lid').toString();
//       String url = '$urls/view_payment/';
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
//         amount.add(arr[i]['amount'].toString());
//         status.add(arr[i]['status'].toString());
//       }
//
//       setState(() {
//         id_ = id;
//         date_ = date;
//         amount_ = amount;
//         status_ = status;
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
//                                     child: Text(date_[index]),
//                                   ),
//                                   Padding(
//                                     padding: EdgeInsets.all(5),
//                                     child: Text(amount_[index]),
//                                   ),     Padding(
//                                     padding: EdgeInsets.all(5),
//                                     child: Text(status_[index]),
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
import 'package:automaticbilling/user/view_bookind_details.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const ViewPayment());
}

class ViewPayment extends StatelessWidget {
  const ViewPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'View Payments',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 18, 82, 98)),
        useMaterial3: true,
      ),
      home: const ViewPaymentPage(title: 'View Payments'),
    );
  }
}

class ViewPaymentPage extends StatefulWidget {
  const ViewPaymentPage({super.key, required this.title});

  final String title;

  @override
  State<ViewPaymentPage> createState() => _ViewPaymentPageState();
}

class _ViewPaymentPageState extends State<ViewPaymentPage> {
  _ViewPaymentPageState() {
    ViewPayment();
  }

  List<String> id_ = <String>[];
  List<String> date_ = <String>[];
  List<String> amount_ = <String>[];
  List<String> status_ = <String>[];

  Future<void> ViewPayment() async {
    List<String> id = <String>[];
    List<String> date = <String>[];
    List<String> amount = <String>[];
    List<String> status = <String>[];

    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String lid = sh.getString('lid').toString();
      String url = '$urls/view_payment/';

      var data = await http.post(Uri.parse(url), body: {
        'lid': lid,
      });

      var jsondata = json.decode(data.body);
      String statuss = jsondata['status'];
      var arr = jsondata["data"];

      for (int i = 0; i < arr.length; i++) {
        id.add(arr[i]['id'].toString());
        date.add(arr[i]['date'].toString());
        amount.add(arr[i]['amount'].toString());
        status.add(arr[i]['status'].toString());
      }

      setState(() {
        id_ = id;
        date_ = date;
        amount_ = amount;
        status_ = status;
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
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: id_.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
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
                              "\$${amount_[index]}",
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
                            Icon(
                              Icons.payment,
                              color: status_[index] == "Paid" ? Colors.green : Colors.red,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "Status: ${status_[index]}",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: status_[index] == "Paid" ? Colors.green : Colors.red,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Divider(color: Colors.grey),
                        SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: () {
                              Fluttertoast.showToast(msg: "More details coming soon...");
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) => ViewBookingPage(title: '',),));

                            },
                            child: Text("View Details"),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blueAccent,
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
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

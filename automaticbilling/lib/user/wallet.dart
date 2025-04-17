// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';
//
//
// void main() {
//   runApp(const ViewWallet());
// }
//
// class ViewWallet extends StatelessWidget {
//   const ViewWallet({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ViewWalletPage(
//         title: '',
//       ),
//     );
//
//   }
// }
//
// class ViewWalletPage extends StatefulWidget {
//   const ViewWalletPage({super.key, required this.title});
//
//   final String title;
//
//   // const UserView_house({Key? key}) : super(key: key);
//
//   @override
//   State<ViewWalletPage> createState() => ViewWalletPageState();
// }
//
// class ViewWalletPageState extends State<ViewWalletPage> {
//
//   TextEditingController da=TextEditingController();
//
//   final DateFormat _dateFormatter = DateFormat('yyyy-MM-dd');
//
//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1900),
//       lastDate: DateTime(2100),
//     );
//
//     if (picked != null) {
//       setState(() {
//         da.text = _dateFormatter.format(picked);
//         view_payment2(da.text);
//       });
//     }
//   }
//   ViewWalletPageState() {
//
//     // view_payment("");
//   }
//
//   List<String> id_ = <String>[];
//   List<String> amount_ = <String>[];
//
//
//   void initState(){
//     super.initState();
//     view_payment();
//   }
//
//
//
//   Future<void> view_payment() async {
//     List<String> id = <String>[];
//     List<String> amount = <String>[];
//
//
//     try {
//       SharedPreferences sh = await SharedPreferences.getInstance();
//       String urls = sh.getString('url').toString();
//       String lid = sh.getString('lid').toString();
//       String url = '$urls/ViewWalletPage_report/';
//       // String img = sh.getString('img_url').toString();
//
//       var data = await http.post(Uri.parse(url), body: {
//         'lid': lid
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
//         amount.add(arr[i]['amount'].toString());
//
//
//
//       }
//
//       setState(() {
//         id_ = id;
//         amount_ = amount;
//
//       });
//     } catch (e) {
//       print("Error ------------------- " + e.toString());
//     }
//   }
//   Future<void> view_payment2(value) async {
//     List<String> id = <String>[];
//     List<String> amount = <String>[];
//
//     try {
//       SharedPreferences sh = await SharedPreferences.getInstance();
//       String urls = sh.getString('url').toString();
//       String lid = sh.getString('lid').toString();
//       String url = '$urls/user_view_wallet_payment/';
//
//       var data = await http.post(Uri.parse(url), body: {
//         'lid': lid,
//         'date': value,
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
//         amount.add(arr[i]['amount'].toString());
//
//
//       }
//
//       setState(() {
//         id_ = id;
//         amount_ = amount;
//
//
//       });
//     } catch (e) {
//       print("Error ------------------- " + e.toString());
//     }
//   }
//
//   @override
//
//
//
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//         actions: [
//
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ListView.builder(
//               physics: BouncingScrollPhysics(),
//
//               shrinkWrap: true,
//               itemCount: id_.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return Card(
//                   child: ListTile(
//                     title: Row(
//
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//
//                       ],
//                     ),
//                     subtitle: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//
//                         Text("Date: ${amount_[index]}", style: TextStyle(fontWeight: FontWeight.bold)),
//                         Divider(),
//
//                       ],
//                     ),
//                   ),
//                   elevation: 8,
//                   margin: EdgeInsets.all(10),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }









// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';
//
// void main() {
//   runApp(const ViewWallet());
// }
//
// class ViewWallet extends StatelessWidget {
//   const ViewWallet({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ViewWalletPage(
//         title: '',
//       ),
//     );
//   }
// }
//
// class ViewWalletPage extends StatefulWidget {
//   const ViewWalletPage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<ViewWalletPage> createState() => ViewWalletPageState();
// }
//
// class ViewWalletPageState extends State<ViewWalletPage> {
//   TextEditingController da = TextEditingController();
//   final DateFormat _dateFormatter = DateFormat('yyyy-MM-dd');
//
//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1900),
//       lastDate: DateTime(2100),
//     );
//
//     if (picked != null) {
//       setState(() {
//         da.text = _dateFormatter.format(picked);
//         view_payment2(da.text);
//       });
//     }
//   }
//
//   ViewWalletPageState() {
//     // view_payment("");
//   }
//
//   List<String> id_ = <String>[];
//   List<String> amount_ = <String>[];
//
//   void initState() {
//     super.initState();
//     view_payment();
//   }
//
//   Future<void> view_payment() async {
//     List<String> id = <String>[];
//     List<String> amount = <String>[];
//
//     try {
//       SharedPreferences sh = await SharedPreferences.getInstance();
//       String urls = sh.getString('url').toString();
//       String lid = sh.getString('lid').toString();
//       String url = '$urls/ViewWalletPage_report/';
//
//       var data = await http.post(Uri.parse(url), body: {
//         'lid': lid
//       });
//       var jsondata = json.decode(data.body);
//       String statuss = jsondata['status'];
//
//       var arr = jsondata["data"];
//
//       for (int i = 0; i < arr.length; i++) {
//         id.add(arr[i]['id'].toString());
//         amount.add(arr[i]['amount'].toString());
//       }
//
//       setState(() {
//         id_ = id;
//         amount_ = amount;
//       });
//     } catch (e) {
//       print("Error ------------------- " + e.toString());
//     }
//   }
//
//   Future<void> view_payment2(value) async {
//     List<String> id = <String>[];
//     List<String> amount = <String>[];
//
//     try {
//       SharedPreferences sh = await SharedPreferences.getInstance();
//       String urls = sh.getString('url').toString();
//       String lid = sh.getString('lid').toString();
//       String url = '$urls/user_view_wallet_payment/';
//
//       var data = await http.post(Uri.parse(url), body: {
//         'lid': lid,
//         'date': value,
//       });
//       var jsondata = json.decode(data.body);
//       String statuss = jsondata['status'];
//
//       var arr = jsondata["data"];
//
//       for (int i = 0; i < arr.length; i++) {
//         id.add(arr[i]['id'].toString());
//         amount.add(arr[i]['amount'].toString());
//       }
//
//       setState(() {
//         id_ = id;
//         amount_ = amount;
//       });
//     } catch (e) {
//       print("Error ------------------- " + e.toString());
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ListView.builder(
//               physics: BouncingScrollPhysics(),
//               shrinkWrap: true,
//               itemCount: id_.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return Card(
//                   child: ListTile(
//                     title: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [],
//                     ),
//                     subtitle: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Amount: ${amount_[index]}",
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         Divider(),
//                       ],
//                     ),
//                   ),
//                   elevation: 8,
//                   margin: EdgeInsets.all(10),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       // Add the FloatingActionButton here
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Define your recharge functionality here
//           // For example, navigate to a new page or show a dialog
//           Fluttertoast.showToast(msg: "Recharge");
//         },
//         child: Icon(Icons.add),
//         backgroundColor: Colors.green,
//       ),
//     );
//   }
// }






import 'dart:convert';
import 'package:automaticbilling/user/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';


void main() {
  runApp(const ViewWallet());
}

class ViewWallet extends StatelessWidget {
  const ViewWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ViewWalletPage(
        title: '',
      ),
    );
  }
}

class ViewWalletPage extends StatefulWidget {
  const ViewWalletPage({super.key, required this.title});

  final String title;

  @override
  State<ViewWalletPage> createState() => ViewWalletPageState();
}

class ViewWalletPageState extends State<ViewWalletPage> {

  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    view_payment();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }



  String amount="";
  void _openCheckout(amt) {
    SharedPreferences.getInstance().then((sh) {
      String amtt = sh.getString('amt') ?? '0'; // Default to '0' if not found
      double am = double.tryParse(amt) ?? 0.0; // Convert to double

      var options = {
        'key': 'rzp_test_HKCAwYtLt0rwQe', // Replace with your Razorpay API key
        'amount': am*100,
        'name': 'Flutter Razorpay Example',
        'description': 'Payment for the product',
        'prefill': {'contact': '9747360170', 'email': 'tlikhil@gmail.com'},
        'external': {
          'wallets': ['paytm']
        }
      };

      try {
        _razorpay.open(options);
      } catch (e) {
        debugPrint('Error: ${e.toString()}');
      }





    });
  }


  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    print("Payment Successful: ${response.paymentId}");
    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();
    String lid = sh.getString('lid').toString();
    String bid = sh.getString('bid').toString();
    String amt = sh.getString('amt').toString();

    final urls = Uri.parse('$url/flutt_send_payment/');
    try {
      final response = await http.post(urls, body: {
        'amt': amt,
        'lid': lid,

      });
      print(jsonDecode(response.body));
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        print(status);
        if (status == 'ok') {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeNewPage(title: "Home page"),
              ));
        } else if (status == "exists") {
          Fluttertoast.showToast(msg: 'Already have a nomination');
        }
      } else {
        Fluttertoast.showToast(msg: 'Network Error');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("Error in Payment: ${response.code} - ${response.message}");
    Fluttertoast.showToast(msg: "Payment failed: ${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print("External Wallet: ${response.walletName}");
  }




  TextEditingController da = TextEditingController();
  final DateFormat _dateFormatter = DateFormat('yyyy-MM-dd');
  TextEditingController amountController = TextEditingController(); // TextEditingController for the amount input

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        da.text = _dateFormatter.format(picked);
        view_payment2(da.text);
      });
    }
  }

  List<String> id_ = <String>[];
  List<String> amount_ = <String>[];

  Future<void> view_payment() async {
    List<String> id = <String>[];
    List<String> amount = <String>[];

    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String lid = sh.getString('lid').toString();
      String url = '$urls/ViewWalletPage_report/';

      var data = await http.post(Uri.parse(url), body: {
        'lid': lid
      });
      var jsondata = json.decode(data.body);
      String statuss = jsondata['status'];

      var arr = jsondata["data"];

      for (int i = 0; i < arr.length; i++) {
        id.add(arr[i]['id'].toString());
        amount.add(arr[i]['amount'].toString());
      }

      setState(() {
        id_ = id;
        amount_ = amount;
      });
    } catch (e) {
      print("Error ------------------- " + e.toString());
    }
  }

  Future<void> view_payment2(value) async {
    List<String> id = <String>[];
    List<String> amount = <String>[];

    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String lid = sh.getString('lid').toString();
      String url = '$urls/user_view_wallet_payment/';

      var data = await http.post(Uri.parse(url), body: {
        'lid': lid,
      });
      var jsondata = json.decode(data.body);
      String statuss = jsondata['status'];

      var arr = jsondata["data"];

      for (int i = 0; i < arr.length; i++) {
        id.add(arr[i]['id'].toString());
        amount.add(arr[i]['amount'].toString());
      }

      setState(() {
        id_ = id;
        amount_ = amount;
      });
    } catch (e) {
      print("Error ------------------- " + e.toString());
    }
  }

  // Method to show the alert dialog for payment
  void _showPaymentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Recharge Wallet"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: amountController,
                decoration: InputDecoration(
                  labelText: 'Enter Amount',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                String amount = amountController.text.trim();
                if (amount.isNotEmpty) {
                  Fluttertoast.showToast(msg: "Recharged with \$${amount}");
                  Navigator.of(context).pop();
                  SharedPreferences sh = await SharedPreferences.getInstance();
                  sh.setString('amt', amount);

                  _openCheckout(amount);

                  // Close the dialog
                  // Here you can add your API call to process the recharge
                } else {
                  Fluttertoast.showToast(msg: "Please enter a valid amount");
                }
              },
              child: Text("Payment"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: id_.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Amount: ${amount_[index]}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Divider(),
                      ],
                    ),
                  ),
                  elevation: 8,
                  margin: EdgeInsets.all(10),
                );
              },
            ),
          ],
        ),
      ),
      // Floating action button to show the recharge dialog
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showPaymentDialog(); // Show the payment dialog when the button is pressed
        },
        backgroundColor: Colors.green, // Blue color for the button
        child: Container(
          width: 160, // Customize the width of the button
          height: 60, // Customize the height of the button
          decoration: BoxDecoration(
            color: Colors.green, // Blue color for the button
            borderRadius: BorderRadius.circular(30), // Rounded corners for the button
          ),
          child: Center(
            child: Text(
              'Pay',
              style: TextStyle(
                color: Colors.white, // White text color
                fontWeight: FontWeight.bold, // Bold font
                fontSize: 18, // Font size
              ),
            ),
          ),
        ),
      ),


    );
  }


}

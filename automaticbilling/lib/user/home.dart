
import 'package:automaticbilling/login.dart';
import 'package:automaticbilling/user/edit_profile.dart';
import 'package:automaticbilling/user/profile.dart';
import 'package:automaticbilling/user/view_bookind_details.dart';
import 'package:automaticbilling/user/view_payment_details.dart';
import 'package:automaticbilling/user/wallet.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shared_preferences/shared_preferences.dart';
void main() {
  runApp(const HomeNew());
}

class HomeNew extends StatelessWidget {
  const HomeNew({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 18, 82, 98)),
        useMaterial3: true,
      ),
      home: const HomeNewPage(title: 'Home'),
    );
  }
}

class HomeNewPage extends StatefulWidget {
  const HomeNewPage({super.key, required this.title});

  final String title;

  @override
  State<HomeNewPage> createState() => _HomeNewPageState();
}

class _HomeNewPageState extends State<HomeNewPage> {


  _HomeNewPageState() {
    senddata();
   }

  TextEditingController unameController = new TextEditingController();
  TextEditingController passController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async{ return true; },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 18, 82, 98),

          title: Text(widget.title),
        ),
        body:
        SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                height: 280,
                width: double.infinity,
                child: Image.network(
                  photo,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(16.0, 240.0, 16.0, 16.0),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16.0),
                          margin: EdgeInsets.only(top: 16.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 110.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          ' $name',
                                          style: Theme.of(context).textTheme.headline6,
                                        ),
                                        SizedBox(
                                          height: 40,
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    CircleAvatar(
                                      backgroundColor: Colors.blueAccent,
                                      child: IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => MyEditPage(title: 'Edit Profile'),
                                            ),
                                          );
                                        },
                                        icon: Icon(
                                          Icons.edit_outlined,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10.0),
                            ],
                          ),
                        ),
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            image: DecorationImage(
                              image: NetworkImage(photo),
                              fit: BoxFit.cover,
                            ),
                          ),
                          margin: EdgeInsets.only(left: 20.0),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text("Profile Information"),
                          ),
                          Divider(),
                          ListTile(
                            title: Text("Gender"),
                            subtitle: Text(gender),
                            leading: Icon(Icons.person),
                          ),
                          ListTile(
                            title: Text("Pin"),
                            subtitle: Text(pin),
                            leading: Icon(Icons.pin),
                          ),
                          ListTile(
                            title: Text('Email'),
                            subtitle: Text(email),
                            leading: Icon(Icons.mail_outline),
                          ),
                          ListTile(
                            title: Text("Phone"),
                            subtitle: Text(phone),
                            leading: Icon(Icons.phone),
                          ),
                          ListTile(
                            title: Text("Post"),
                            subtitle: Text(post),
                            leading: Icon(Icons.location_on),
                          ),
                          ListTile(
                            title: Text("State"),
                            subtitle: Text(state),
                            leading: Icon(Icons.location_city),
                          ),
                          ListTile(
                            title: Text("District"),
                            subtitle: Text(district),
                            leading: Icon(Icons.map),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 60,
                left: 20,
                child: MaterialButton(
                  minWidth: 0.2,
                  elevation: 0.2,
                  color: Colors.white,
                  child: const Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Colors.indigo,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  onPressed: () {
                    // Custom back navigation here, for instance, navigate to the home screen
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeNewPage(title: 'Home')));
                  },
                ),
              ),
            ],
          ),
        ),

        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 18, 82, 98),
                ),
                child:
                Column(children: [

                  Text(
                    'Auto Billing',
                    style: TextStyle(fontSize: 20,color: Colors.white),

                  ),

                ])


                ,
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeNewPage(title: 'Home',),));
                },
              ),
              // ListTile(
              //   leading: Icon(Icons.person_pin),
              //   title: const Text(' View Profile '),
              //   onTap: () {
              //     Navigator.pop(context);
              //     Navigator.push(context, MaterialPageRoute(builder: (context) => userProfile_new1(title: 'Profile',),));
              //   },
              // ),
              ListTile(
                leading: Icon(Icons.wallet),
                title: const Text(' View Wallet Amount '),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewWalletPage(title: 'Current Amount',),));
                },
              ),
              // ListTile(
              //   leading: Icon(Icons.wallet),
              //   title: const Text('Booking Details'),
              //   onTap: () {
              //     Navigator.pop(context);
              //     Navigator.push(context, MaterialPageRoute(builder: (context) => ViewBookingPage(title: 'Booking Details',),));
              //   },
              // ),
              ListTile(
                leading: Icon(Icons.payment),
                title: const Text('Payment Details'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewPaymentPage(title: 'Payment Details',),));
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: const Text('Log Out'),
                onTap: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyLoginPage(title: '',),));
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                },
              ),
            ],
          ),
        ),





      ),
    );


  }


  String name = '';
  String gender = '';
  String dob = '';
  String post = '';
  String place = '';
  String pin = '';
  String photo = '';
  String email = '';
  String phone = '';
  String state = '';
  String district = '';


  void senddata() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();
    String lid = sh.getString('lid').toString();
    // String img = sh.getString('img_url').toString();
    final urls = Uri.parse(url + "/view_user_profile/");
    try {
      final response = await http.post(urls, body: {
        'lid': lid,
      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        if (status == 'ok') {
          Fluttertoast.showToast(msg: 'Success');

          name = jsonDecode(response.body)['uname'].toString();
          dob = jsonDecode(response.body)['dob'].toString();
          post = jsonDecode(response.body)['post'].toString();
          place = jsonDecode(response.body)['place'].toString();
          pin = jsonDecode(response.body)['pin'].toString();
          email = jsonDecode(response.body)['email'].toString();
          phone = jsonDecode(response.body)['phone'].toString();
          state = jsonDecode(response.body)['state'].toString();
          district = jsonDecode(response.body)['district'].toString();

          setState(() {
            photo = sh.getString('img_url').toString() + jsonDecode(response.body)['photo'];
            gender = jsonDecode(response.body)['gender'].toString();

          });
        } else {
          Fluttertoast.showToast(msg: 'Not Found');
        }
      } else {
        Fluttertoast.showToast(msg: 'Network Error');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }


  void _send_data() async{


    String uname=unameController.text;
    String password=passController.text;


    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();

    final urls = Uri.parse('$url/myapp/user_login_post/');
    try {
      final response = await http.post(urls, body: {
        'username':uname,
        'password':password,


      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        if (status=='ok') {
          String lid=jsonDecode(response.body)['lid'];
          sh.setString("lid", lid);
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => HomeNewPage(title: "Home"),));
        }else {
          Fluttertoast.showToast(msg: 'Not Found');
        }
      }
      else {
        Fluttertoast.showToast(msg: 'Network Error');
      }
    }
    catch (e){
      Fluttertoast.showToast(msg: e.toString());
    }
  }

}









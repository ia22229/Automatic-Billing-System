

import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:automaticbilling/main.dart';
import 'package:automaticbilling/vehicle/vehiclehome.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geolocator/geolocator.dart';


import 'user/signup.dart';

import 'user/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(255, 255, 255, 1.0),
        ),
      ),
      home: MyLoginPage(title: '',),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  MyLoginPage({Key? key, required String title}) : super(key: key);

  @override
  State<MyLoginPage> createState() => _LoginState();
}

class _LoginState extends State<MyLoginPage> {
  final FocusNode _focusNodePassword = FocusNode();
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _controllerUsername.text = "";
    _controllerPassword.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyIpPage(title: '',)));
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _formKey,
          child: Container(
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.all(30.0),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 150),
                    Text(
                      "Welcome back",
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Login to your account",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 60),
                    TextFormField(
                      controller: _controllerUsername,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: "Username",
                        labelStyle: const TextStyle(color: Colors.white),
                        prefixIcon:
                        const Icon(Icons.person_outline, color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                      onEditingComplete: () => _focusNodePassword.requestFocus(),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter username.";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _controllerPassword,
                      focusNode: _focusNodePassword,
                      obscureText: _obscurePassword,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: const TextStyle(color: Colors.white),
                        prefixIcon:
                        const Icon(Icons.password_outlined, color: Colors.white),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Colors.white,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter password.";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 60),
                    Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _sendData();
                            }
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account?",
                              style: TextStyle(color: Colors.white),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MyMySignupPage(title: 'Signup')));
                              },
                              child: const Text(
                                'User Register here',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNodePassword.dispose();
    _controllerUsername.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  void _sendData() async {
    String username = _controllerUsername.text;
    String password = _controllerPassword.text;

    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url') ?? '';

    final urls = Uri.parse('$url/user_login_post/');
    try {
      final response = await http.post(urls, body: {
        'uname': username,
        'password': password,
      });

      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];

        if (status == 'ok') {
          String type = jsonDecode(response.body)['type'];
          String lid = jsonDecode(response.body)['lid'].toString();

          sh.setString('lid', lid);

          if (type == 'user') {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeNewPage(title: 'Home Page')));
          } else if (type == 'vehicle') {
            // String locationpath = jsonDecode(response.body)['locationpath'].toString();
            // sh.setString("locpath",locationpath);
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
            Timer.periodic(Duration(seconds: 5),(timer) {
              updateLoc(lid);
            },);
          }
        } else {
          Fluttertoast.showToast(msg: 'Invalid credentials');
        }
      } else {
        Fluttertoast.showToast(msg: 'Error: ${response.statusCode}');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }


  void updateLoc(String lid) async {
    SharedPreferences sh = await SharedPreferences.getInstance();

    PermissionStatus status = await Permission.location.request();

    if (status.isGranted) {
      // If permission is granted, get the current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      String lat = position.latitude.toString();
      String lon = position.longitude.toString();

      sh.setString('lat', lat);
      sh.setString('lon', lon);

      print('Latitude: $lat, Longitude: $lon');
    } else {
      // Handle the case where permission is denied
      print('Location permission de');
    }
    String url = sh.getString('url') ?? '';
    final urls = Uri.parse('$url/updatelocation/');

    try {
      final response = await http.post(urls, body: {
        'lid': lid,
        'lat': sh.getString('lat'), // Add lat and lon here
        'lon': sh.getString('lon'), // Make sure to provide these values
      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        if (status != "ok") {
          Fluttertoast.showToast(msg: "Location update failed");
        }
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

}

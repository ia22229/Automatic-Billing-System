
import 'package:automaticbilling/components/authentication_button.dart';
import 'package:automaticbilling/components/custom_text_field.dart';
import 'package:google_fonts/google_fonts.dart';


import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart ';

import 'package:permission_handler/permission_handler.dart';

import 'home.dart';




void main() {
  runApp(const MyEdit());
}

class MyEdit extends StatelessWidget {
  const MyEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edit Profile',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyEditPage(title: 'Edit Profile'),
    );
  }
}

class MyEditPage extends StatefulWidget {
  const MyEditPage({super.key, required this.title});

  final String title;

  @override
  State<MyEditPage> createState() => _MyEditPageState();
}

class _MyEditPageState extends State<MyEditPage> {

  _MyEditPageState()
  {
    _get_data();
  }

  String gender = "Male";
  String uphoto='';
  TextEditingController nameController= new TextEditingController();
  TextEditingController dobController= new TextEditingController();
  // TextEditingController genderController= new TextEditingController();
  TextEditingController placeController= new TextEditingController();
  TextEditingController postController= new TextEditingController();
  TextEditingController pinController= new TextEditingController();
  TextEditingController emailController= new TextEditingController();
  TextEditingController phoneController= new TextEditingController();
  TextEditingController stateController= new TextEditingController();
  TextEditingController districtController= new TextEditingController();


  void _get_data() async{



    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();
    String lid = sh.getString('lid').toString();

    final urls = Uri.parse('$url/view_user_profile/');
    try {
      final response = await http.post(urls, body: {
        'lid':lid



      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'].toString();
        if (status=='ok') {
          String namee=jsonDecode(response.body)['uname'].toString();
          String dob=jsonDecode(response.body)['dob'].toString();
          String ugender=jsonDecode(response.body)['gender'].toString();
          String email=jsonDecode(response.body)['email'].toString();
          String phone=jsonDecode(response.body)['phone'].toString();
          String place=jsonDecode(response.body)['place'].toString();
          String pin=jsonDecode(response.body)['pin'].toString();
          String district=jsonDecode(response.body)['district'].toString();
          String photo =sh.getString("img_url").toString()+ jsonDecode(response.body)['photo'].toString();
          String post=jsonDecode(response.body)['post'].toString();
          String state=jsonDecode(response.body)['state'].toString();


          nameController.text=namee;
          dobController.text=dob;
          emailController.text=email;
          phoneController.text=phone;
          placeController.text=place;
          pinController.text=pin;
          districtController.text=district;
          postController.text=post;
          stateController.text=state;

          setState(() {
            uphoto=photo;
            gender=ugender;
          });





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

  @override
  Widget build(BuildContext context) {




    return WillPopScope(
      onWillPop: () async{ return true; },
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 0.0,
            leadingWidth: 0.0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey.shade300,
                  radius: 20.0,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    splashRadius: 1.0,
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      size: 24.0,
                    ),
                  ),
                ),
                Text(
                  'Edit Profile',
                  style: GoogleFonts.poppins(

                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  width: 40.0,
                  child: IconButton(
                    onPressed: () {},
                    splashRadius: 1.0,
                    icon: Icon(
                      Icons.more_vert,
                      color: Colors.white,
                      size: 34.0,
                    ),
                  ),
                ),
              ],
            ),
          ),

          body: SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(
                // maxHeight: MediaQuery.of(context).size.height * 0.9,
              ),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10.0),
                        SizedBox(height: 40.0),
                        if (_selectedImage != null) ...{
                          InkWell(
                            child: CircleAvatar(
                              radius: 70.0, // Adjust the radius as needed
                              backgroundImage: FileImage(_selectedImage!),
                            ),

                            onTap: _checkPermissionAndChooseImage,
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                        } else ...{

                          InkWell(
                            onTap: _checkPermissionAndChooseImage,
                            child: Column(

                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        uphoto),
                                    radius: 70,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 90),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        },
                        CustomTextField(
                          controller: nameController,
                          hintText: 'Full Name',
                          icon: Icons.person,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your full name';
                            }
                            return null; // Return null if the input is valid
                          },
                        ),
                        CustomTextField(
                          controller: emailController,
                          hintText: 'Email',
                          icon: Icons.mail,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Fill';
                            }
                            return null; // Return null if the input is valid
                          },
                        ),
                        CustomTextField(
                          controller: phoneController,
                          hintText: 'Phone',
                          icon: Icons.phone,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Fill';
                            }
                            return null; // Return null if the input is valid
                          },
                        ),
                        CustomTextField(
                          controller: dobController,
                          hintText: 'Dob',
                          icon: Icons.date_range,
                          keyboardType: TextInputType.datetime,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Fill';
                            }
                            return null; // Return null if the input is valid
                          },
                        ),

                        RadioListTile(value: "Male", groupValue: gender, onChanged: (value) { setState(() {gender="Male";}); },title: Text("Male"),),
                        RadioListTile(value: "Female", groupValue: gender, onChanged: (value) { setState(() {gender="Female";}); },title: Text("Female"),),
                        RadioListTile(value: "Other", groupValue: gender, onChanged: (value) { setState(() {gender="Other";}); },title: Text("Other"),),

                        CustomTextField(
                          controller: placeController,
                          hintText: 'Place',
                          icon: Icons.place,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Fill';
                            }
                            return null; // Return null if the input is valid
                          },
                        ),

                        CustomTextField(
                          controller: pinController,
                          hintText: 'Pincode',
                          icon: Icons.pin,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Fill';
                            }
                            return null; // Return null if the input is valid
                          },
                        ),    CustomTextField(
                          controller: postController
                          ,
                          hintText: 'post',
                          icon: Icons.pin,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Fill';
                            }
                            return null; // Return null if the input is valid
                          },
                        ),  CustomTextField(
                          controller: stateController
                          ,
                          hintText: 'state',
                          icon: Icons.pin,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Fill';
                            }
                            return null; // Return null if the input is valid
                          },
                        ),
                        CustomTextField(
                          controller: districtController,
                          hintText: 'District',
                          icon: Icons.local_activity,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Fill';
                            }
                            return null; // Return null if the input is valid
                          },
                        ),
                        const SizedBox(height: 15.0),

                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: AuthenticationButton(
                          label: 'Edit',
                          onPressed: () {
                            _send_data();
                          }
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )


      ),
    );
  }
  void _send_data() async{





    String name=nameController.text;
    String dob=dobController.text;
    String email=emailController.text;
    String phone=phoneController.text;
    String place=placeController.text;
    String pin=pinController.text;
    String district=districtController.text;
    String post=postController.text;
    String state=stateController.text;
    String genders=gender;


    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();
    String lid = sh.getString('lid').toString();

    final urls = Uri.parse('$url/edit_user_profile/');
    try {

      final response = await http.post(urls, body: {
        "photo":photo,
        'name':name,
        'dob':dob,
        'gender':genders,
        'email':email,
        'phone':phone,
        'place':place,
        'pin':pin,
        'district':district,
        'state':state,
        'post':post,
        'lid':lid,

      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        if (status=='ok') {

          Fluttertoast.showToast(msg: 'Updated Successfully');
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => HomeNewPage(title: "Profile"),));
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
  File? _selectedImage;
  String? _encodedImage;
  Future<void> _chooseAndUploadImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
        _encodedImage = base64Encode(_selectedImage!.readAsBytesSync());
        photo = _encodedImage.toString();
      });
    }
  }

  Future<void> _checkPermissionAndChooseImage() async {
    final PermissionStatus status = await Permission.mediaLibrary.request();
    if (status.isGranted) {
      _chooseAndUploadImage();
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Permission Denied'),
          content: const Text(
            'Please go to app settings and grant permission to choose an image.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  String photo = '';

}

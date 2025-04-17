//
//
// import 'dart:io';
//
// import 'package:date_picker_plus/date_picker_plus.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:image_picker/image_picker.dart ';
//
// import 'package:permission_handler/permission_handler.dart';
// import '../login.dart';
//
//
// void main() {
//   runApp(const MyMySignup());
// }
//
// class MyMySignup extends StatelessWidget {
//   const MyMySignup({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'MySignup',
//       theme: ThemeData(
//
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyMySignupPage(title: 'MySignup'),
//     );
//   }
// }
//
// class MyMySignupPage extends StatefulWidget {
//   const MyMySignupPage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyMySignupPage> createState() => _MyMySignupPageState();
// }
//
// class _MyMySignupPageState extends State<MyMySignupPage> {
//
//   String gender = "Male";
//   File? uploadimage;
//   TextEditingController nameController= new TextEditingController();
//   TextEditingController dobController= new TextEditingController();
//   // TextEditingController genderController= new TextEditingController();
//   TextEditingController placeController= new TextEditingController();
//   TextEditingController postController= new TextEditingController();
//   TextEditingController pinController= new TextEditingController();
//   TextEditingController emailController= new TextEditingController();
//   TextEditingController phoneController= new TextEditingController();
//   TextEditingController stateController= new TextEditingController();
//   TextEditingController districtController= new TextEditingController();
//   TextEditingController passwordController= new TextEditingController();
//   TextEditingController confirmpasswordController= new TextEditingController();
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     return WillPopScope(
//       onWillPop: () async{ return true; },
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//           title: Text(widget.title),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               if (_selectedImage != null) ...{
//                 InkWell(
//                   child:
//                   Image.file(_selectedImage!, height: 400,),
//                   radius: 399,
//                   onTap: _checkPermissionAndChooseImage,
//                   // borderRadius: BorderRadius.all(Radius.circular(200)),
//                 ),
//               } else ...{
//                 // Image(image: NetworkImage(),height: 100, width: 70,fit: BoxFit.cover,),
//                 InkWell(
//                   onTap: _checkPermissionAndChooseImage,
//                   child:Column(
//                     children: [
//                       Image(image: NetworkImage('https://cdn.pixabay.com/photo/2017/11/10/05/24/select-2935439_1280.png'),height: 200,width: 200,),
//                       Text('Select Image',style: TextStyle(color: Colors.cyan))
//                     ],
//                   ),
//                 ),
//               },
//               Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: TextField(
//                   controller: nameController,
//                   decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Name")),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: TextField(
//                   controller: dobController,
//                   decoration: InputDecoration(border: OutlineInputBorder(),label: Text("DoB")),
//                   onTap: () async {
//                     final date = await showDatePickerDialog(
//                       context: context,
//                       minDate: DateTime(1990, 1, 1),
//                       maxDate: DateTime(3000, 12, 31),
//                     );
//
//                     if (date != null) {
//                       setState(() {
//                         dobController.text = date.year.toString()+"-"+date.month.toString()+"-"+date.day.toString();
//                       });
//                     }
//                   },
//
//
//                 ),
//
//               ),
//
//               RadioListTile(value: "Male", groupValue: gender, onChanged: (value) { setState(() {gender="Male";}); },title: Text("Male"),),
//               RadioListTile(value: "Female", groupValue: gender, onChanged: (value) { setState(() {gender="Female";}); },title: Text("Female"),),
//               RadioListTile(value: "Other", groupValue: gender, onChanged: (value) { setState(() {gender="Other";}); },title: Text("Other"),),
//               Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: TextField(
//                   controller: emailController,
//                   decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Email")),
//                 ),
//               ),   Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: TextField(
//                   controller: phoneController,
//
//                   decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Phone")),
//                 ),
//               ),   Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: TextField(
//                   controller: placeController,
//                   decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Place")),
//                 ),
//               ),   Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: TextField(
//                   controller: postController,
//                   decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Post")),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: TextField(
//                   controller: pinController,
//                   decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Pin")),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: TextField(
//                  controller: districtController,
//                   decoration: InputDecoration(border: OutlineInputBorder(),label: Text("District")),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: TextField(
//                   controller: stateController,
//                   decoration: InputDecoration(border: OutlineInputBorder(),label: Text("state")),
//                 ),
//               ),
//
//               Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: TextField(
//
//                   controller: passwordController,
//                   decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Password")),
//                 ),
//               ),     Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: TextField(
//                   controller: confirmpasswordController,
//                   decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Confirm Password")),
//                 ),
//               ),
//
//               ElevatedButton(
//                 onPressed: () {
//
//                  _send_data() ;
//
//                 },
//                 child: Text("Signup"),
//               ),TextButton(
//                 onPressed: () {},
//                 child: Text("Login"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   void _send_data() async{
//
//     String uname=nameController.text;
//     String dob=dobController.text;
//     String genders=gender;
//     String place=placeController.text;
//     String post=postController.text;
//     String pin=pinController.text;
//     String email=emailController.text;
//     String phone=phoneController.text;
//     String state=stateController.text;
//     String district=districtController.text;
//     String password=passwordController.text;
//     String confirmpassword=confirmpasswordController.text;
//
//
//
//     SharedPreferences sh = await SharedPreferences.getInstance();
//     String url = sh.getString('url').toString();
//
//     final urls = Uri.parse('$url/signup_post/');
//     try {
//
//       final response = await http.post(urls, body: {
//         "photo":photo,
//         "uname":uname,
//         "dob":dob,
//         "gender":genders,
//         "place":place,
//         "post":post,
//         "pin":pin,
//         "email":email,
//         "phone":phone,
//         "state":state,
//         "district":district,
//         "password":password,
//         "confirmpassword":confirmpassword,
//
//
//
//
//       });
//       if (response.statusCode == 200) {
//         String status = jsonDecode(response.body)['status'];
//         if (status=='ok') {
//
//           Fluttertoast.showToast(msg: 'Registration Successfull');
//           Navigator.push(context, MaterialPageRoute(
//             builder: (context) => MyLoginPage(title: '',),));
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
//   }
//   File? _selectedImage;
//   String? _encodedImage;
//   Future<void> _chooseAndUploadImage() async {
//     final picker = ImagePicker();
//     final pickedImage = await picker.pickImage(source: ImageSource.gallery);
//
//     if (pickedImage != null) {
//       setState(() {
//         _selectedImage = File(pickedImage.path);
//         _encodedImage = base64Encode(_selectedImage!.readAsBytesSync());
//         photo = _encodedImage.toString();
//       });
//     }
//   }
//
//   Future<void> _checkPermissionAndChooseImage() async {
//     final PermissionStatus status = await Permission.mediaLibrary.request();
//     if (status.isGranted) {
//       _chooseAndUploadImage();
//     } else {
//       showDialog(
//         context: context,
//         builder: (BuildContext context) => AlertDialog(
//           title: const Text('Permission Denied'),
//           content: const Text(
//             'Please go to app settings and grant permission to choose an image.',
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text('OK'),
//             ),
//           ],
//         ),
//       );
//     }
//   }
//
//   String photo = '';
//
// }



import 'dart:io';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../login.dart';

void main() {
  runApp(const MyMySignup());
}

class MyMySignup extends StatelessWidget {
  const MyMySignup({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MySignup',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyMySignupPage(title: 'MySignup'),
    );
  }
}

class MyMySignupPage extends StatefulWidget {
  const MyMySignupPage({super.key, required this.title});

  final String title;

  @override
  State<MyMySignupPage> createState() => _MyMySignupPageState();
}

class _MyMySignupPageState extends State<MyMySignupPage> {
  final _formKey = GlobalKey<FormState>();
  String gender = "Male";
  File? uploadimage;
  TextEditingController nameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController postController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  String photo = '';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (_selectedImage != null) ...{
                    InkWell(
                      child: Image.file(
                        _selectedImage!,
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                      onTap: _checkPermissionAndChooseImage,
                    ),
                  } else ...{
                    InkWell(
                      onTap: _checkPermissionAndChooseImage,
                      child: Column(
                        children: [
                          Image(
                            image: NetworkImage(
                                'https://cdn.pixabay.com/photo/2017/11/10/05/24/select-2935439_1280.png'),
                            height: 200,
                            width: 200,
                          ),
                          Text('Select Image', style: TextStyle(color: Colors.cyan))
                        ],
                      ),
                    ),
                  },
                  // Form Fields with Validation
                  _buildTextFormField(nameController, "Name", "Please enter your name"),
                  _buildDateField(),
                  _buildRadioButton(),
                  _buildTextFormField(emailController, "Email", "Please enter a valid email",
                      isEmail: true),
                  _buildTextFormField(phoneController, "Phone", "Please enter a valid phone number"),
                  _buildTextFormField(placeController, "Place", "Please enter your place"),
                  _buildTextFormField(postController, "Post", "Please enter your post"),
                  _buildTextFormField(pinController, "Pin", "Please enter your pin"),
                  _buildTextFormField(districtController, "District", "Please enter your district"),
                  _buildTextFormField(stateController, "State", "Please enter your state"),
                  _buildTextFormField(passwordController, "Password", "Please enter your password",
                      isPassword: true),
                  _buildTextFormField(confirmpasswordController, "Confirm Password",
                      "Password and Confirm Password must match", isPassword: true),
                  ElevatedButton(
                    onPressed: _validateAndSubmit,
                    child: Text("Signup"),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("Login"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper Method to build a text form field
  Widget _buildTextFormField(TextEditingController controller, String label, String validationMessage,
      {bool isEmail = false, bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return validationMessage;
          }
          if (isEmail && !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$").hasMatch(value)) {
            return "Please enter a valid email";
          }
          if (isPassword && value.length < 6) {
            return "Password must be at least 6 characters long";
          }
          return null;
        },
        obscureText: isPassword,
      ),
    );
  }

  // Date Picker for Date of Birth
  Widget _buildDateField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: dobController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "DoB",
        ),
        onTap: () async {
          final date = await showDatePickerDialog(
            context: context,
            minDate: DateTime(1990, 1, 1),
            maxDate: DateTime(3000, 12, 31),
          );

          if (date != null) {
            setState(() {
              dobController.text =
              "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
            });
          }
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please select your date of birth";
          }
          return null;
        },
      ),
    );
  }

  // Gender Radio Buttons
  Widget _buildRadioButton() {
    return Column(
      children: [
        RadioListTile(
          value: "Male",
          groupValue: gender,
          onChanged: (value) {
            setState(() {
              gender = "Male";
            });
          },
          title: Text("Male"),
        ),
        RadioListTile(
          value: "Female",
          groupValue: gender,
          onChanged: (value) {
            setState(() {
              gender = "Female";
            });
          },
          title: Text("Female"),
        ),
        RadioListTile(
          value: "Other",
          groupValue: gender,
          onChanged: (value) {
            setState(() {
              gender = "Other";
            });
          },
          title: Text("Other"),
        ),
      ],
    );
  }

  // Validate and Submit the Form
  void _validateAndSubmit() async {
    if (_formKey.currentState!.validate()) {
      if (photo==''){
        Fluttertoast.showToast(msg: "please choose a photo");
      }
      else{
        _send_data();
      }
      // All validations passed, proceed to submit the data

    }
  }

  void _send_data() async {
    String uname = nameController.text;
    String dob = dobController.text;
    String genders = gender;
    String place = placeController.text;
    String post = postController.text;
    String pin = pinController.text;
    String email = emailController.text;
    String phone = phoneController.text;
    String state = stateController.text;
    String district = districtController.text;
    String password = passwordController.text;
    String confirmpassword = confirmpasswordController.text;

    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();

    final urls = Uri.parse('$url/signup_post/');
    try {
      final response = await http.post(urls, body: {
        "photo": photo,
        "uname": uname,
        "dob": dob,
        "gender": genders,
        "place": place,
        "post": post,
        "pin": pin,
        "email": email,
        "phone": phone,
        "state": state,
        "district": district,
        "password": password,
        "confirmpassword": confirmpassword,
      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        if (status == 'ok') {
          Fluttertoast.showToast(msg: 'Registration Successful');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyLoginPage(title: '',)),
          );
        } else {
          Fluttertoast.showToast(msg: 'Error during registration');
        }
      } else {
        Fluttertoast.showToast(msg: 'Network Error');
      }
    } catch (e) {
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
}

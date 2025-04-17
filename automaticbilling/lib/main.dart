
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';


void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyIpPage(title: 'IP Page'),
    );

  }
}
class MyIpPage extends StatefulWidget {
  const MyIpPage({super.key,required this.title});

  final String title;

  @override
  State<MyIpPage> createState() => _MyIpPageState();
}

class _MyIpPageState extends
State<MyIpPage> {

  TextEditingController ipConttroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     IconButton(onPressed: () {},
      //         icon: Icon(Icons.home))
      //   ],
      //   centerTitle: true,
      //   backgroundColor: Colors.blueGrey,
      //   title: Text(widget.title),
      // ),

      body: Container(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.all(5),
                  child: TextFormField(
                    validator: (value) => Validateip(value!),

                    controller: ipConttroller,
                    decoration: InputDecoration( fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'ip address',border:

                        OutlineInputBorder(), labelText:
                        'Ip Address'),
                  ),
                ),
                ElevatedButton(style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(234, 100, 68, 28),

                  foregroundColor: Colors.white,
                ),
                    onPressed: () {
                      senddata();
                    }, child: Text('Connect')
                )
              ]
          ),
        ),
      ),
    );
    // TODO:Impliment build
    //  throw UnimplementedError();

  }

  void senddata() async {
    String ip = ipConttroller.text;
    SharedPreferences sh = await SharedPreferences.getInstance();
    sh.setString("url", "http://" + ip + ":7000/myapp");
    sh.setString("img_url", "http://" + ip + ":7000");

    Navigator.push(context, MaterialPageRoute(
      builder: (context) => MyLoginPage(title: '',),));
  }
  String? Validateip(String value){
    if(value.isEmpty){
      return 'please enter a IP';
    }
    return null;
  }

}




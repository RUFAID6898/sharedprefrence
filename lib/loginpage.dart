import 'package:flutter/material.dart';
import 'package:flutter_application_shadprefrance/registerpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPge extends StatefulWidget {
  LoginPge({super.key});

  @override
  State<LoginPge> createState() => _LoginPgeState();
}

class _LoginPgeState extends State<LoginPge> {
  String Name = 'name';
  String lock = 'password';
  String mail = 'mail';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  TextEditingController name = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController email = TextEditingController();

  void putdata(String value, String valuu, String valuuu) async {
    SharedPreferences shad = await SharedPreferences.getInstance();
    shad.setString("valuu", value);
    SharedPreferences nextpas = await SharedPreferences.getInstance();
    nextpas.setString('nextvalu', valuu);
    SharedPreferences nextemail = await SharedPreferences.getInstance();
    nextemail.setString('tirdvaluu', valuuu);
  }

  getdata() async {
    SharedPreferences shad = await SharedPreferences.getInstance();
    SharedPreferences naxtpass = await SharedPreferences.getInstance();
    SharedPreferences naxtemail = await SharedPreferences.getInstance();

    setState(() {
      Name = shad.get("valuu").toString();
      lock = naxtpass.get('nextvalu').toString();
      mail = naxtemail.get('tirdvaluu').toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
              controller: name,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'name')),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
              controller: email,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'gmail')),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
              controller: password,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'password')),
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                Name = name.text;

                mail = email.text;
                lock = password.text;
                putdata(name.text, email.text, password.text);
              });
            },
            child: Text('Save')),
        // Text(Name),
        // Text(mail),
        // Text(lock),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterPage(),
                  ));
            },
            child: Text('Go Next'))
      ]),
    );
  }
}

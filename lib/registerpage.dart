import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String name = '';
  String passw = '';
  String email = '';

  getdata() async {
    SharedPreferences shad = await SharedPreferences.getInstance();
    SharedPreferences naxtpass = await SharedPreferences.getInstance();
    SharedPreferences naxtemail = await SharedPreferences.getInstance();
    setState(() {
      name = shad.get('valuu').toString();
      passw = naxtpass.get('nextvalu').toString();
      email = naxtemail.get('tirdvaluu').toString();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('your name is $name')),
          Text('your email is $passw'),
          Text('yor password is $email'),
        ],
      ),
    );
  }
}

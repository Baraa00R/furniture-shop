// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, use_key_in_widget_constructors, override_on_non_overriding_member, annotate_overrides, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish/constants.dart';
import 'package:stylish/screens/home/components/signupPage.dart';
import 'package:stylish/screens/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  @override
  final _auth = FirebaseAuth.instance;
  late String username;
  late String email;
  late String password;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 183, 181, 177),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/furniture1.jpg'),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 100, 10, 0),
                child: Text(
                  "welcome to Damas_Gold",
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w900),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 1, 228, 149),
                        width: 10,
                      ),
                    ),
                    hintText: 'enter your Email',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 1, 228, 149),
                        width: 10,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    hintText: 'enter your Password',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                ),
                onPressed: () async {
                  try {
                    final newuser = await _auth
                        .createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    )
                        .then((value) async {
                      print('================${value.user?.uid}');
                      await FirebaseFirestore.instance
                          .collection('newAccount')
                          .doc('${value.user?.uid}')
                          .collection('user')
                          .doc('personalInf')
                          .set({
                        'userName': username,
                        'email': email,
                        'password': password,
                      });
                      
                    });
                    // print('==============${newuser.u}')
                  } catch (error) {
                    var errorMessage = 'Authenticatio Faild';
                    if (error.toString().contains('EMAIL_EXISTS')) {
                      errorMessage = 'This email address is already in use.';
                    } else if (error.toString().contains('INVALID_EMAIL')) {
                      errorMessage = 'This is not a valid email address';
                    } else if (error.toString().contains('WEAK_PASSWORD')) {
                      errorMessage = 'This password is too weak.';
                    } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
                      errorMessage = 'Could not find a user with that email.';
                    } else if (error.toString().contains('INVALID_PASSWORD')) {
                      errorMessage = 'Invalid password.';
                    }
                    showErrorDialog(errorMessage);
                  }
                },
                child: Text(
                  'Log in',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => signupPage(),
                    ),
                  );
                },
                child: Text(
                  'Sign up',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: bgColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: bgColor),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: bgColor,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 38,
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/icons/google2.svg",
                    ),
                  ),
                  SizedBox(
                    width: 17,
                  ),
                  IconButton(
                    iconSize: 38,
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/icons/facebook.svg",
                      width: 75,
                      height: 75,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('An Error Occurred!'),
        content: Text(message),
        actions: [
          ElevatedButton(
            onPressed: () {
              setState(() {});
              Navigator.pop(context);
            },
            child: Text('Ok'),
          ),
        ],
      ),
    );
  }
}

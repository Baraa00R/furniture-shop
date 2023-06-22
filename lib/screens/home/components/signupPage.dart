// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish/constants.dart';
import 'package:stylish/screens/home/home_screen.dart';

class signupPage extends StatefulWidget {
  @override
  _signupPageState createState() => _signupPageState();
}

class _signupPageState extends State<signupPage> {
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
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 100, 10, 0),
              child: Text(
                "create a new account",
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
                  username = value;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 1, 228, 149),
                      width: 10,
                    ),
                  ),
                  hintText: 'enter your Username',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
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
                'Sign up',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        )),
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

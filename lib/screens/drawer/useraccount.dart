// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:stylish/constants.dart';

class AccountPage extends StatelessWidget {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('User account'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(defaultPadding),
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/images/profile1.jpg'),
                ),
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(hintText: 'Username'),
              ),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(hintText: 'username@user.com'),
              ),
              TextField(
               controller: _passwordController,
                decoration: InputDecoration(hintText: 'password'),
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(primaryColor)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => updatePage(),
                        ));
                  },
                  child: Text('Update'))
            ],
          ),
        ),
      ),
    );
  }
}

class updatePage extends StatefulWidget {
  const updatePage({Key? key}) : super(key: key);

  @override
  _updatPageState createState() => _updatPageState();
}

class _updatPageState extends State<updatePage> {
  final _controller = TextEditingController();  
  String name = '';
  TextEditingController username = new TextEditingController();
  TextEditingController Email = new TextEditingController();
  TextEditingController passowrd = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(name),
          Container(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: _controller,
              obscureText: true,
            ),
          ),
          Container(
            child: ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                setState(() {
                  name = _controller.text;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

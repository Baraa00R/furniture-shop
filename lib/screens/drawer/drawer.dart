// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stylish/constants.dart';
import 'package:stylish/screens/drawer/date.dart';
import 'package:stylish/screens/home/components/loginPage.dart';

class myDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          
          SizedBox(
            height: 40,
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favorite'),
            onTap: () => print('fav'),
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share'),
          ),
          ListTile(
            leading: Icon(Icons.map),
            title: Text('location'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setiing'),
          ),
          ListTile(
            leading: Icon(Icons.newspaper),
            title: Text('Policies'),
          ),
          ListTile(
            leading: Icon(Icons.date_range),
            title: Text('Calendar'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DatePage(),
                ),
              );
            },
          ),
          ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Exit'),
              onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => loginPage(),
                ),
              );
            },),
        ],
      ),
      backgroundColor: primaryColor,
    );
  }
}

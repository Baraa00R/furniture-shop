// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stylish/screens/home/components/loginPage.dart';

import '../../../constants.dart';

class welcoming extends StatelessWidget {
  int currentPage = 0;
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(40),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Damas_Gold',
                  style: TextStyle(
                      color: Color(0xFFF67952),
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30 ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('welcome to '),
                    Text(
                      'Damas_Gold,',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    Text('the style of life')
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 400,
            width: double.infinity,
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {},
              children: [
                Image.asset("assets/images/bed2.png"),
                Image.asset("assets/images/kenepe3.png"),
                Image.asset("assets/images/koltuk3.png"),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: ExpandingDotsEffect(
                dotHeight: 10,
                dotWidth: 10,
                dotColor: Colors.grey,
                activeDotColor: primaryColor),
          ),
          Spacer(
            flex: 2,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => loginPage()),
                  (route) => true);
            },
            child: Text(
              'continue',
              style: TextStyle(fontSize: 30),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

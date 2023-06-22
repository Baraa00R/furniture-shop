// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish/constants.dart';
import 'package:stylish/screens/drawer/drawer.dart';

import 'components/categories.dart';
import 'components/new_arrival_products.dart';
import 'components/popular_products.dart';
import 'components/search_form.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, String? image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(drawer: myDrawer(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(77, 204, 201, 193),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             SvgPicture.asset("assets/icons/Location.svg"),
            const SizedBox(width: defaultPadding / 2),
            Text(
              "Istanbul",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset("assets/icons/Notification.svg"),
            onPressed: () {},
          ),
        ],
      ),
      
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Explore",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 30)),
            const Text(
              "Make your home beautiful",
              style: TextStyle(fontSize: 18),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: defaultPadding),
              child: SearchForm(),
            ),
            const Categories(),
            const NewArrivalProducts(),
            const PopularProducts(),
            
          ],
        ),
      ),
    );
  }
}
class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    required this.pressSeeAll,
  }) : super(key: key);
  final String title;
  final VoidCallback pressSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
        ),
        TextButton(
          onPressed: pressSeeAll,
          child: const Text(
            "See All",
            style: TextStyle(color: Colors.black54),
          ),
        )
      ],
    );
  }
}

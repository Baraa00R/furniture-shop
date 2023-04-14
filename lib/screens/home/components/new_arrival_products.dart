import 'package:flutter/material.dart';
import 'package:stylish/screens/home/home_screen.dart';
import '../../../constants.dart';
import 'product_card.dart';
import 'details_screen.dart';
class NewArrivalProducts extends StatelessWidget {
  const NewArrivalProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: SectionTitle(
            title: "New Arrival",
            pressSeeAll: () {},
          ),
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              basic_product.length,
              (index) => Padding(
                padding: const EdgeInsets.only(right: defaultPadding),
                child: ProductCard(
                  title: basic_product[index].title,
                  image: basic_product[index].image,
                  price: basic_product[index].price,
                  bgColor: basic_product[index].bgColor,
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailsScreen(product: basic_product[index]),
                        ));
                  },
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class Product {
  final String image, title;
  final int price;
  final Color bgColor;

  Product({
    required this.image,
    required this.title,
    required this.price,
    this.bgColor = const Color(0xFFEFEFF2),
  });
}

List<Product> basic_product = [
  Product(
    image: "assets/images/kenepe3.png",
    title: "Sofa",
    price: 600,
    bgColor: const Color(0xFFFEFBF9),
  ),
  Product(
    image: "assets/images/koltuk3.png",
    title: "Armchair",
    price: 98,
  ),
  Product(
    image: "assets/images/bed4.jpg",
    title: "Bed",
    price: 350,
    bgColor: const Color(0xFFF8FEFB),
  ),
  Product(
    image: "assets/images/table2.jpg",
    title: "kitchen table",
    price: 250,
    bgColor: const Color(0xFFEEEEED),
  ),
];
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';

import '../widgets/carousel_widget.dart';
import '../widgets/categories_slider_widget.dart';
import '../widgets/product_grid_view_widget.dart';
import '../widgets/search_bar_widget.dart';
import 'card_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: DrawerButton(onPressed: () {}),
        title: const Text("a-more"),
        actions: [
          IconButton(
            icon: const Icon(
              LineIcons.shoppingBag,
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CardScreen()),
              );
            },
          )
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SearchBarWidget(),
            CarouselSliderWidget(),
            CategoriesSliderWidget(),
            ProductGridViewWidget(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: Colors.black),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.house,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {},
                icon: const FaIcon(FontAwesomeIcons.magnifyingGlass)),
            IconButton(
                onPressed: () {},
                icon: const FaIcon(FontAwesomeIcons.solidHeart)),
            IconButton(
                onPressed: () {},
                icon: const FaIcon(FontAwesomeIcons.solidUser)),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../widgets/carousel_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(24.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "What are you looking for?",
                  fillColor: Colors.grey,
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  prefixIcon: const Icon(LineIcons.search)),
            ),
          ),
          const CarouselSliderWidget(),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

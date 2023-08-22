import 'package:amor/services/search_api.dart';
import 'package:amor/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/search_bar_widget.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'save_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key, required this.searchString});
  final String searchString;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: searchProducts(searchString),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Color.fromRGBO(21, 153, 84, 1),
              backgroundColor: Colors.white,
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData) {
          return const Text('Data not found');
        }

        return Scaffold(
          extendBody: true,
          appBar: AppBar(
            title: const Text("Search Screen"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: ListView(
              children: [
                const SearchBarWidget(),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.7),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductCardWidget(
                      product: snapshot.data![index],
                      keepSaved: false,
                    );
                  },
                ),
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.house,
                    )),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchScreen(
                          searchString: "",
                        ),
                      ),
                    );
                  },
                  icon: const FaIcon(FontAwesomeIcons.magnifyingGlass),
                  color: Colors.white,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SaveScreen(
                            searchString: "",
                          ),
                        ),
                      );
                    },
                    icon: const FaIcon(FontAwesomeIcons.solidHeart)),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      ),
                    );
                  },
                  icon: const FaIcon(FontAwesomeIcons.solidUser),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

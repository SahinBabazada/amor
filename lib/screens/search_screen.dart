import 'package:amor/services/search_api.dart';
import 'package:amor/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/search_bar_widget.dart';

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
                    return ProductCardWidget(product: snapshot.data![index]);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

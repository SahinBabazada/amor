import 'dart:math';

import 'package:flutter/material.dart';

import '../services/get_product.dart';
import 'product_card_widget.dart';

class ProductGridViewWidget extends StatelessWidget {
  const ProductGridViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Products",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "See all",
                  style: TextStyle(
                      color: Color.fromRGBO(46, 163, 102, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
          FutureBuilder(
              future: getProduct(true,
                  limit: 10, skip: Random.secure().nextInt(20)),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Color.fromRGBO(21, 153, 84, 1),
                      backgroundColor: Colors.white,
                    ),
                  );
                }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData) {
                  return const Text('Data not found');
                }

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.7),
                  itemCount: snapshot.data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductCardWidget(product: snapshot.data![index]);
                  },
                );
              }),
        ],
      ),
    );
  }
}

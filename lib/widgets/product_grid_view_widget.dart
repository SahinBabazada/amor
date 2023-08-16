import 'package:flutter/material.dart';

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
          GridView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, 
                childAspectRatio: 0.7
                ),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return const ProductCardWidget();
            },
          ),
        ],
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(
                "https://as-images.apple.com/is/og-default?wid=1200&hei=630&fmt=jpeg&qlt=95&.v=1525370171638",
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 1,
                right: 1,
                child: IconButton(
                  onPressed: () {},
                  icon: const FaIcon(FontAwesomeIcons.solidHeart, size: 16, color: Colors.red),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                  width: 105,
                  child: Text(
                    "Nike Pegasusadsdasds",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  )),
              Row(
                children: [
                  SizedBox(
                    width: 30.0,
                    height: 30.0,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {},
                      icon: const FaIcon(FontAwesomeIcons.solidStar, size: 12, color: Colors.orange),
                    ),
                  ),
                  const Text("4.7",
                      style: TextStyle(color: Colors.black26, fontSize: 12))
                ],
              )
            ],
          ),
          const Text("\$89.9")
        ],
      ),
    );
  }
}

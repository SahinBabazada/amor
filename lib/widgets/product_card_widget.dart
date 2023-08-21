import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/search_product.dart';

class ProductCardWidget extends StatefulWidget {
  final SearchProduct product;
  const ProductCardWidget({super.key, required this.product});

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  @override
  Widget build(BuildContext context) {
    var savedProduct = DefaultAssetBundle.of(context).loadString('assets/saved_product/saved_product.json');

    print(savedProduct);
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(
                widget.product.thumbnail,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 1,
                right: 1,
                child: IconButton(
                  onPressed: () {},
                  icon: const FaIcon(FontAwesomeIcons.solidHeart,
                      size: 16, color: Colors.red),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: 100,
                  child: Text(
                    widget.product.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 12),
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
                      icon: const FaIcon(FontAwesomeIcons.solidStar,
                          size: 12, color: Colors.orange),
                    ),
                  ),
                  Text(widget.product.rating.toString(),
                      style:
                          const TextStyle(color: Colors.black26, fontSize: 12))
                ],
              )
            ],
          ),
          Text("\$ ${widget.product.price}",
              style: const TextStyle(color: Colors.black45, fontSize: 12))
        ],
      ),
    );
  }
}

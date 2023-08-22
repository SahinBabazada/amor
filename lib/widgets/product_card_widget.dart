import 'package:amor/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/search_product.dart';
import '../services/database_helper.dart';

class ProductCardWidget extends StatefulWidget {
  final SearchProduct product;
  final bool keepSaved;
  const ProductCardWidget(
      {super.key, required this.product, required this.keepSaved});

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  bool isSaved = false;

  @override
  void initState() {
    super.initState();
    _updateSavedStatus();
  }

  Future<void> _updateSavedStatus() async {
    bool saved = await dbHelper.isProductSaved(widget.product.id.toString());
    setState(() {
      isSaved = saved;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ProductCardMethod();
  }

  // ignore: non_constant_identifier_names
  ClipRRect ProductCardMethod() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(35),
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailScreen(id: widget.product.id),
                      ),
                    );
                  },
                  child: Image.network(
                    widget.product.thumbnail,
                    width: double.maxFinite,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 1,
                  right: 1,
                  child: FutureBuilder(
                      future:
                          dbHelper.isProductSaved(widget.product.id.toString()),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }
                        bool isSaved = snapshot.data ?? false;
                        return IconButton(
                          onPressed: () async {
                            if (!isSaved) {
                              await dbHelper
                                  .saveProduct(widget.product.id.toString());
                              _updateSavedStatus();
                            } else {
                              await dbHelper
                                  .removeProduct(widget.product.id.toString());
                              _updateSavedStatus();
                            }
                          },
                          icon: FaIcon(
                              (isSaved)
                                  ? FontAwesomeIcons.solidHeart
                                  : FontAwesomeIcons.heart,
                              size: 16,
                              color: Colors.red),
                        );
                      }),
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
                        style: const TextStyle(
                            color: Colors.black26, fontSize: 12))
                  ],
                )
              ],
            ),
            Text("\$ ${widget.product.price}",
                style: const TextStyle(color: Colors.black45, fontSize: 12))
          ],
        ),
      ),
    );
  }
}

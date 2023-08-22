import 'package:amor/models/shopping_product.dart';
import 'package:flutter/material.dart';

import '../services/database_helper2.dart';
import '../services/search_api.dart';
import '../widgets/quantity_control_widget.dart';
import 'product_details_screen.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  final DatabaseHelper2 dbHelper = DatabaseHelper2();

  List<Map> shoppingProductIds = [];
  Map<String, List> priceList = {};

  @override
  void initState() {
    super.initState();
    _fetchShoppingProductIds();
  }

  Future<void> _fetchShoppingProductIds() async {
    List<Map> ids = await dbHelper.getAllShoppingProducts();
    setState(() {
      shoppingProductIds = ids;
    });
  }

  int calculateSum(Map<String, List<dynamic>> inputMap) {
    int sum = 0;

    inputMap.forEach((key, value) {
      int product = value[0] * value[1];
      sum += product;
    });

    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Shopping List',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          centerTitle: true,
        ),
        body: Builder(builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: FutureBuilder(
                future: searchProducts2(),
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

                  List<ShoppingProduct> shoppingProducts = snapshot.data!
                      .where((element) => shoppingProductIds
                          .any((field) => field['id'] == element.id.toString()))
                      .toList();

                  return ListView.builder(
                    itemExtent: 110,
                    itemCount: shoppingProducts.length,
                    itemBuilder: (context, index) {
                      ShoppingProduct prdct = shoppingProducts[index];
                      var shpProduct = shoppingProductIds
                          .where(
                            (element) => element['id'] == prdct.id.toString(),
                          )
                          .toList();

                      priceList[prdct.id.toString()] = [
                        prdct.price,
                        shpProduct[0]['quantity']
                      ];

                      return Container(
                        margin: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetailScreen(
                                        id: shoppingProducts[index].id),
                                  ),
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  shoppingProducts[index].thumbnail,
                                  fit: BoxFit.cover,
                                  width: 110,
                                  height: 110,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, left: 8.0, right: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      shoppingProducts[index].title,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      shoppingProducts[index].category,
                                      style: const TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${shoppingProducts[index].price} ₼',
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        QuantityControl(
                                          quantity: shpProduct[0]['quantity'],
                                          onMinusPressed: () async {
                                            await dbHelper
                                                .addProductToShoppingList(
                                              shoppingProducts[index]
                                                  .id
                                                  .toString(),
                                              shpProduct[0]['quantity'] - 1,
                                            );
                                            _fetchShoppingProductIds();
                                            setState(() {
                                              priceList[prdct.id.toString()] = [
                                                prdct.price,
                                                shpProduct[0]['quantity'] - 1
                                              ];
                                            });
                                          },
                                          onPlusPressed: () async {
                                            await dbHelper
                                                .addProductToShoppingList(
                                              shoppingProducts[index]
                                                  .id
                                                  .toString(),
                                              shpProduct[0]['quantity'] + 1,
                                            );
                                            setState(() {
                                              priceList[prdct.id.toString()] = [
                                                prdct.price,
                                                shpProduct[0]['quantity'] + 1
                                              ];
                                            });
                                            _fetchShoppingProductIds();
                                          },
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                }),
          );
        }),
        bottomNavigationBar: Container(
          height: 120,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 0, 0, 0).withAlpha(20),
              blurRadius: 3.0,
              spreadRadius: 0.0,
              offset: const Offset(
                0.0,
                2.0,
              ),
            ),
          ]),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              Row(
                children: [
                  const Text(
                    "Total Price: ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${calculateSum(priceList)}",
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              Center(
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 10)),
                    onPressed: () {},
                    child: const Text(
                      'Checkout',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )),
              )
            ]),
          ),
        ));
  }
}

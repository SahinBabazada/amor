import 'package:flutter/material.dart';

import '../widgets/quantity_control_widget.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
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
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemExtent: 110,
          itemCount: 23,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          setState(() {});
                        },
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: const Color.fromRGBO(21, 153, 84, 1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.all(1),
                              child: false
                                  // ignore: dead_code
                                  ? const Icon(
                                      Icons.check,
                                      size: 15.0,
                                      color: Colors.white,
                                      // ignore: dead_code
                                    )
                                  : Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    )),
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      "https://cdn.thewirecutter.com/wp-content/media/2023/05/running-shoes-2048px-9718.jpg",
                      fit: BoxFit.cover,
                      width: 110,
                      height: 110,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top:8.0, left: 8.0, right: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Item 1", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                          const Text("Category", style: TextStyle(fontSize: 10, ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("89 azn", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                              QuantityControl(
                                quantity: 1,
                                onMinusPressed: () {
                                  setState(() {});
                                },
                                onPlusPressed: () {
                                  setState(() {});
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
        ),
      ),
    );
  }
}

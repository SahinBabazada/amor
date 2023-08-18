import 'package:flutter/material.dart';

class Item {
  String title;
  String imageUrl;
  double price;
  int quantity;
  bool isSelected;
  bool delete;

  Item({
    required this.title,
    required this.imageUrl,
    this.price = 0.0,
    this.quantity = 1,
    this.isSelected = false,
    this.delete = false,
  });
}

class CardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ListView Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Shopping List'),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 10),
          child: ShoppingListView(),
        ),
      ),
    );
  }
}

class ShoppingListView extends StatefulWidget {
  @override
  _ShoppingListViewState createState() => _ShoppingListViewState();
}

class _ShoppingListViewState extends State<ShoppingListView> {
  List<Item> items = [
    Item(
      title: 'Item 1',
      imageUrl:
          'https://media.istockphoto.com/id/1301455711/vector/smartphone-with-app-icons.jpg?s=612x612&w=0&k=20&c=l7XvErKje4H644u3wH3BHdBkT0KS7XXfR1EymtkgEGQ=',
      price: 10.0,
    ),
    Item(
      title: 'Item 2',
      imageUrl:
          'https://media.istockphoto.com/id/1301455711/vector/smartphone-with-app-icons.jpg?s=612x612&w=0&k=20&c=l7XvErKje4H644u3wH3BHdBkT0KS7XXfR1EymtkgEGQ=',
      price: 15.0,
    ),
    Item(
      title: 'Item 2',
      imageUrl:
          'https://media.istockphoto.com/id/1301455711/vector/smartphone-with-app-icons.jpg?s=612x612&w=0&k=20&c=l7XvErKje4H644u3wH3BHdBkT0KS7XXfR1EymtkgEGQ=',
      price: 15.0,
    ),
    Item(
      title: 'Item 2',
      imageUrl:
          'https://media.istockphoto.com/id/1301455711/vector/smartphone-with-app-icons.jpg?s=612x612&w=0&k=20&c=l7XvErKje4H644u3wH3BHdBkT0KS7XXfR1EymtkgEGQ=',
      price: 15.0,
    ),
    Item(
      title: 'Item 2',
      imageUrl:
          'https://media.istockphoto.com/id/1301455711/vector/smartphone-with-app-icons.jpg?s=612x612&w=0&k=20&c=l7XvErKje4H644u3wH3BHdBkT0KS7XXfR1EymtkgEGQ=',
      price: 15.0,
    ),
    Item(
      title: 'Item 2',
      imageUrl:
          'https://media.istockphoto.com/id/1301455711/vector/smartphone-with-app-icons.jpg?s=612x612&w=0&k=20&c=l7XvErKje4H644u3wH3BHdBkT0KS7XXfR1EymtkgEGQ=',
      price: 15.0,
    ),
  ];

  double calculateTotalPrice() {
    double totalPrice = 0.0;
    for (var item in items) {
      if (item.isSelected) {
        totalPrice += item.price * item.quantity;
      }
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 300,
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Row(
                    children: [
                      Checkbox(
                        value: items[index].isSelected,
                        onChanged: (value) {
                          setState(() {
                            items[index].isSelected = value!;
                          });
                        },
                      ),
                      SizedBox(width: 10),
                      Image.network(
                        items[index].imageUrl,
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 10),
                      Text(items[index].title),
                    ],
                  ),
                  subtitle: Padding(
                    padding: EdgeInsets.only(left: 52),
                    child: Row(
                      children: [
                        Text(
                          ' ${(items[index].price).toStringAsFixed(2)} AZN',
                        ),
                        Spacer(),
                        QuantityControl(
                          quantity: items[index].quantity,
                          onMinusPressed: () {
                            setState(() {
                              if (items[index].quantity > 0) {
                                items[index].quantity--;
                              }
                            });
                          },
                          onPlusPressed: () {
                            setState(() {
                              items[index].quantity++;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 20),
          child: Row(
            children: [
              Text('Total Price : ', style: TextStyle(fontSize: 20)),
              Spacer(),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  '${calculateTotalPrice().toStringAsFixed(2)} AZN',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 5,
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 13),
          child: Center(
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Checkout'),
              style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(fontSize: 17),
                  padding: EdgeInsets.symmetric(horizontal: 150, vertical: 15),
                  primary: Color.fromARGB(255, 24, 171, 24),
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
        )
      ],
    );
  }
}

class QuantityControl extends StatelessWidget {
  final int quantity;
  final VoidCallback onMinusPressed;
  final VoidCallback onPlusPressed;

  QuantityControl({
    required this.quantity,
    required this.onMinusPressed,
    required this.onPlusPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(Icons.remove_outlined),
          onPressed: onMinusPressed,
        ),
        Text(quantity.toString()),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: onPlusPressed,
        ),
      ],
    );
  }
}
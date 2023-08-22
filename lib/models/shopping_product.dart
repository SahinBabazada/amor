class ShoppingProduct {
  final int id;
  final String title;
  final String category;
  final String thumbnail;
  final int price;
  bool check;
  int quantity;

  ShoppingProduct(
      {required this.id,
      required this.title,
      required this.category,
      required this.thumbnail,
      required this.price,
      required this.check,
      required this.quantity});

  factory ShoppingProduct.fromJson(Map<String, dynamic> json) =>
      ShoppingProduct(
        id: json["id"],
        title: json["title"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        price: json["price"],
        check: false,
        quantity: 1,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "category": category,
        "thumbnail": thumbnail,
        "price": price,
        "check": check,
        "quantity": quantity
      };
}

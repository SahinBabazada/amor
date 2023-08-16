class SearchProduct {
    final int id;
    final String title;
    final double rating;
    final String thumbnail;
    final int price;

    SearchProduct({
        required this.id,
        required this.title,
        required this.rating,
        required this.thumbnail,
        required this.price,
    });

    factory SearchProduct.fromJson(Map<String, dynamic> json) => SearchProduct(
        id: json["id"],
        title: json["title"],
        rating: json["rating"]?.toDouble(),
        thumbnail: json["thumbnail"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "rating": rating,
        "thumbnail": thumbnail,
        "price": price,
    };
}
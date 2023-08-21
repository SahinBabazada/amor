class Category {
  final String name;

  Category({
    required this.name,
  });

  factory Category.fromJson(String nameData) => Category(
        name: nameData,
      );
}

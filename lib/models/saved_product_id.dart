class SavedProduct {
  final String? id;

  const SavedProduct({required this.id});

  factory SavedProduct.fromJson(Map<String, dynamic> json) =>
      SavedProduct(id: json['id']);

  Map<String, dynamic> toJson() => {
        'id': id,
      };
}

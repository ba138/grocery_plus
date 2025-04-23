class Items {
  final String name;
  final String imageUrl;
  final String descritpion;
  final String price;
  final String productId;
  Items({
    required this.name,
    required this.imageUrl,
    required this.descritpion,
    required this.price,
    required this.productId,
  });
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "imageUrl": imageUrl,
      "descritpion": descritpion,
      "price": price,
      "productId": productId,
    };
  }

  factory Items.fromMap(Map<String, dynamic> map) {
    return Items(
      name: map['name'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      descritpion: map['descritpion'] ?? '',
      price: map['price'] ?? '',
      productId: map['productId'] ?? '',
    );
  }
}

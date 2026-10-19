class FurnitureProduct {
  final String id;
  final String name;
  final String categoryId;
  final double price;
  final String description;
  final String materialInfo;
  final String dimensions;
  final String warrantyYears;
  final String imageUrl;
  final double rating;
  final int itemThemeColor;
  final List<String> availableFabrics;

  const FurnitureProduct({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.price,
    required this.description,
    required this.materialInfo,
    required this.dimensions,
    required this.warrantyYears,
    required this.imageUrl,
    required this.rating,
    required this.itemThemeColor,
    required this.availableFabrics,
  });

  // PDF gereksinimindeki JSON dönüşüm simülasyonu
  factory FurnitureProduct.fromJson(Map<String, dynamic> json) {
    return FurnitureProduct(
      id: json['id'] as String,
      name: json['name'] as String,
      categoryId: json['categoryId'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      materialInfo: json['materialInfo'] as String,
      dimensions: json['dimensions'] as String,
      warrantyYears: json['warrantyYears'] as String,
      imageUrl: json['imageUrl'] as String,
      rating: (json['rating'] as num).toDouble(),
      itemThemeColor: json['itemThemeColor'] as int,
      availableFabrics: List<String>.from(json['availableFabrics'] as List),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'categoryId': categoryId,
      'price': price,
      'description': description,
      'materialInfo': materialInfo,
      'dimensions': dimensions,
      'warrantyYears': warrantyYears,
      'imageUrl': imageUrl,
      'rating': rating,
      'itemThemeColor': itemThemeColor,
      'availableFabrics': availableFabrics,
    };
  }
}

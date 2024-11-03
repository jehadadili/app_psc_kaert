class CartModel {
  final String id;
  final String status;
  final String category;
  final String name;
  final double price;
  final String description;
  final String image;
  final List<String> images;
  final String company;
  int countInStock;
  final int sales;
  final int quantity;
  final double totalPrice;

  CartModel({
    required this.id,
    required this.status,
    required this.category,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.images,
    required this.company,
    required this.countInStock,
    required this.sales,
    required this.quantity,
    required this.totalPrice,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['_id'] as String,
      status: json['status'] as String,
      category: json['category'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      image: json['image'] as String,
      images: List<String>.from(json['images'] as List),
      company: json['company'] as String,
      countInStock: json['countInStock'] as int,
      sales: json['sales'] as int,
      quantity: json['quantity'] as int,
      totalPrice: (json['totalPrice'] as num).toDouble(),
    );
  }
}

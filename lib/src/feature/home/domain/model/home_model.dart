class HomeModel {
  final String id;
  final String status;
  final String category;
  final String name;
  final double price;
  final String description;
  final String image;
  final List<String> images;
  final String company;
  final double sales;

  HomeModel(
      {required this.id,
      required this.status,
      required this.category,
      required this.name,
      required this.price,
      required this.description,
      required this.image,
      required this.images,
      required this.company,
      required this.sales});

  factory HomeModel.fromjson(Map<String, dynamic> json) {
    return HomeModel(
      id: json["_id"] ?? "",
      status: json["status"] ?? "",
      category: json["category"] ?? "",
      name: json["name"] ?? "",
      price: (json["price"] ?? 0).toDouble(),
      description: json["description"] ?? "",
      image: json["image"] ?? "",
      images: List<String>.from(json["images"] ?? []),
      company: json["company"] ?? "",
      sales: (json["sales"] ?? 0).toDouble(),
    );
  }
}

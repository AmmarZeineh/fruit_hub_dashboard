
class ProductOrderModel {
  final String name;
  final String code;
  final String imageUrl;
  final double price;
  final int quantity;

  ProductOrderModel(
      {required this.name,
      required this.code,
      required this.imageUrl,
      required this.price,
      required this.quantity});

  factory ProductOrderModel.fromJson(Map<String, dynamic> json) {
    return ProductOrderModel(
      name: json['name'] as String,
      code: json['code'] as String,
      imageUrl: json['imageUrl'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'] as int,
    );
  }


  toJson() {
    return {
      'name': name,
      'code': code,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
    };
  }
}

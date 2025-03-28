import 'package:fruits_hub_dashboard/core/enums/order_status_enum.dart';
import 'package:fruits_hub_dashboard/features/order/data/models/product_order_model.dart';
import 'package:fruits_hub_dashboard/features/order/data/models/shipping_address_model.dart';
import 'package:fruits_hub_dashboard/features/order/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/order/domain/entities/product_order_entity.dart';

class OrderModel {
  final double totalPrice;
  final String uID;
  final ShippingAddressModel shippingAddressModel;
  final String paymentMethod;
  final List<ProductOrderModel> products;
  final String? status;

  OrderModel({
    required this.status,
    required this.totalPrice,
    required this.uID,
    required this.shippingAddressModel,
    required this.paymentMethod,
    required this.products,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      status: json['status'] as String,
      totalPrice: (json['totalPrice'] as num).toDouble(),
      uID: json['uID'] as String,
      shippingAddressModel: ShippingAddressModel.fromJson(
        json['shippingAddressModel'],
      ),
      paymentMethod: json['paymentMethod'] as String,
      products:
          (json['products'] as List<dynamic>)
              .map((product) => ProductOrderModel.fromJson(product))
              .toList(),
    );
  }

  toJson() {
    return {
      'totalPrice': totalPrice,
      'status': 'pending',
      'uID': uID,
      'date': DateTime.now().toString(),
      'shippingAddressModel': shippingAddressModel.toJson(),
      'paymentMethod': paymentMethod,
      'products': products.map((product) => product.toJson()).toList(),
    };
  }

  OrderEntity toEntity() {
    return OrderEntity(
      status: fetchOrderEnum(),
      totalPrice: totalPrice,
      uID: uID,
      shippingAddressModel: shippingAddressModel.toEntity(),
      paymentMethod: paymentMethod,
      products:
          products
              .map<ProductOrderEntity>((product) => product.toEntity())
              .toList(),
    );
  }

  OrderStatusEnum fetchOrderEnum() {
    return OrderStatusEnum.values.firstWhere((element) {
      var enumStatus = element.name.toString();
      return enumStatus == (status ?? 'pending');
    });
  }
}

import 'package:fruits_hub_dashboard/core/enums/order_status_enum.dart';
import 'package:fruits_hub_dashboard/features/order/domain/entities/product_order_entity.dart';
import 'package:fruits_hub_dashboard/features/order/domain/entities/shipping_address_entity.dart';

class OrderEntity {
  final double totalPrice;
  final String uID;
  final ShippingAddressEntity shippingAddressModel;
  final String paymentMethod;
  final List<ProductOrderEntity> products;
  final OrderStatusEnum status;

  OrderEntity({
    required this.totalPrice,
    required this.uID,
    required this.shippingAddressModel,
    required this.paymentMethod,
    required this.products,
    required this.status,
  });
}

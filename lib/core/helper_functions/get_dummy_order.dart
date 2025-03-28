import 'package:fruits_hub_dashboard/core/enums/order_status_enum.dart';
import 'package:fruits_hub_dashboard/features/order/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/order/domain/entities/product_order_entity.dart';
import 'package:fruits_hub_dashboard/features/order/domain/entities/shipping_address_entity.dart';

OrderEntity getDummyOrder() {
  return OrderEntity(
    status: OrderStatusEnum.pending,
    totalPrice: 199.99,
    uID: 'ORD123456',
    shippingAddressModel: ShippingAddressEntity(
      name: 'John Doe',
      phone: '+1234567890',
      address: '123 Main St',
      city: 'New York',
      email: 'johndoe@example.com',
      floor: '2',
    ),
    paymentMethod: 'Credit Card',
    products: [
      ProductOrderEntity(
        name: 'Apple',
        code: 'APL123',
        imageUrl: 'https://via.placeholder.com/50',
        price: 3.99,
        quantity: 5,
      ),
      ProductOrderEntity(
        name: 'Banana',
        code: 'BAN456',
        imageUrl: 'https://via.placeholder.com/50',
        price: 1.99,
        quantity: 10,
      ),
    ],
  );
}

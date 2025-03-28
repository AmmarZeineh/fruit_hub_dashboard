import 'package:fruits_hub_dashboard/features/order/data/models/order_model.dart';
import 'package:fruits_hub_dashboard/features/order/data/models/product_order_model.dart';
import 'package:fruits_hub_dashboard/features/order/data/models/shipping_address_model.dart';

OrderModel getDummyOrder() {
  return OrderModel(
    totalPrice: 199.99,
    uID: 'ORD123456',
    shippingAddressModel: ShippingAddressModel(
      name: 'John Doe',
      phone: '+1234567890',
      address: '123 Main St',
      city: 'New York',
      email: 'johndoe@example.com',
      floor: '2',
    ),
    paymentMethod: 'Credit Card',
    products: [
      ProductOrderModel(
        name: 'Apple',
        code: 'APL123',
        imageUrl: 'https://via.placeholder.com/50',
        price: 3.99,
        quantity: 5,
      ),
      ProductOrderModel(
        name: 'Banana',
        code: 'BAN456',
        imageUrl: 'https://via.placeholder.com/50',
        price: 1.99,
        quantity: 10,
      ),
    ],
  );
}

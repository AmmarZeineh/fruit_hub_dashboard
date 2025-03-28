import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/order/data/models/order_model.dart';

class OrderItem extends StatelessWidget {
  final OrderModel order;

  const OrderItem({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order ID: ${order.uID}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildShippingDetails(),
            const Divider(),
            _buildProductList(),
            const SizedBox(height: 8),
            Text(
              'Total Price: \$${order.totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Payment Method: ${order.paymentMethod}',
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShippingDetails() {
    final address = order.shippingAddressModel;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Shipping Address:',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          '${address.name}, ${address.phone}',
          style: const TextStyle(fontSize: 14),
        ),
        Text(
          '${address.address}, ${address.city}, Floor: ${address.floor}',
          style: const TextStyle(fontSize: 14),
        ),
        Text('Email: ${address.email}', style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildProductList() {
    return Column(
      children:
          order.products.map((product) {
            return ListTile(
              leading: Icon(Icons.image),
              title: Text(
                product.name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Qty: ${product.quantity}  |  Price: \$${product.price.toStringAsFixed(2)}',
              ),
              trailing: Text(
                'Code: ${product.code}',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            );
          }).toList(),
    );
  }
}

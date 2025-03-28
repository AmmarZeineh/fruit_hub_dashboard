import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/enums/order_status_enum.dart';
import 'package:fruits_hub_dashboard/features/order/domain/entities/order_entity.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OrderItem extends StatelessWidget {
  final OrderEntity order;

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
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildShippingDetails(),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color:
                        order.status == OrderStatusEnum.accepted
                            ? Colors.blue
                            : order.status == OrderStatusEnum.delivered
                            ? Colors.green
                            : order.status == OrderStatusEnum.pending
                            ? Colors.orange
                            : Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    order.status.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
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
              leading: SizedBox(
                width: 24,
                height: 24,
                child: CachedNetworkImage(
                  imageUrl: product.imageUrl,
                  placeholder:
                      (context, url) =>
                          Skeletonizer(child: const Icon(Icons.image)),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
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

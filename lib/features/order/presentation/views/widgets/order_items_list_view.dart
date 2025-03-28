import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/order/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/order/presentation/views/widgets/order_item.dart';

class OrderItemsListView extends StatelessWidget {
  const OrderItemsListView({super.key, required this.orders});
  final List<OrderEntity> orders;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return OrderItem(order: orders[index]);
      },
    );
  }
}

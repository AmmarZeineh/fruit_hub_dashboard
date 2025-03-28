import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/order/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/order/presentation/views/widgets/filter_section.dart';
import 'package:fruits_hub_dashboard/features/order/presentation/views/widgets/order_items_list_view.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key, required this.orders});

  final List<OrderEntity> orders;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 24),
          FilterSection(),
          SizedBox(height: 16),
          Expanded(child: OrderItemsListView(orders: orders)),
        ],
      ),
    );
  }
}

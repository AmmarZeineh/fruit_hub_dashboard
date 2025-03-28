import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/helper_functions/get_dummy_order.dart';
import 'package:fruits_hub_dashboard/features/order/presentation/views/widgets/filter_section.dart';
import 'package:fruits_hub_dashboard/features/order/presentation/views/widgets/order_items_list_view.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 24),
          FilterSection(),
          SizedBox(height: 16),
          Expanded(
            child: OrderItemsListView(
              orders: [
                getDummyOrder(),
                getDummyOrder(),
                getDummyOrder(),
                getDummyOrder(),
                getDummyOrder(),
                getDummyOrder(),
                getDummyOrder(),
                getDummyOrder(),
                getDummyOrder(),
                getDummyOrder(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

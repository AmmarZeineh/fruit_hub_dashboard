import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruits_hub_dashboard/features/add_products/presentation/views/add_products_view.dart';
import 'package:fruits_hub_dashboard/features/order/presentation/views/orders_view.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CustomButton(
            text: 'Add Product',
            onPressed: () {
              Navigator.pushNamed(context, AddProductsView.routeName);
            },
          ),
        ),
        SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CustomButton(
            text: 'View Orders',
            onPressed: () {
              Navigator.pushNamed(context, OrdersView.routeName);
            },
          ),
        ),
      ],
    );
  }
}

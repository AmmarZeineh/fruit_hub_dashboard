import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/add_products/presentation/views/widgets/add_products_view_body.dart';

class AddProductsView extends StatelessWidget {
  const AddProductsView({super.key});
  static const routeName = 'add-products';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: AddProductsViewBody());
  }
}

import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/add_products/presentation/views/add_products_view.dart';
import 'package:fruits_hub_dashboard/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:fruits_hub_dashboard/features/order/presentation/views/orders_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case DashboardView.routeName:
      return MaterialPageRoute(builder: (_) => const DashboardView());
    case AddProductsView.routeName:
      return MaterialPageRoute(builder: (_) => const AddProductsView());
    case OrdersView.routeName:
      return MaterialPageRoute(builder: (_) => const OrdersView());
    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}

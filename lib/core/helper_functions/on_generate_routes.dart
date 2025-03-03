import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/add_products/presentation/views/add_products_view.dart';
import 'package:fruits_hub_dashboard/features/dashboard/presentation/views/dashboard_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case DashboardView.routeName:
      return MaterialPageRoute(builder: (_) => const DashboardView());
    case AddProductsView.routeName:
      return MaterialPageRoute(builder: (_) => const AddProductsView());
    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}

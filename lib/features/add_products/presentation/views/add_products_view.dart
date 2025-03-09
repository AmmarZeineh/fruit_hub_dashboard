import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/repos/image_repo/image_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:fruits_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruits_hub_dashboard/features/add_products/presentation/manger/cubit/add_product_cubit.dart';
import 'package:fruits_hub_dashboard/features/add_products/presentation/views/widgets/add_products_body_bloc_consumer.dart';

class AddProductsView extends StatelessWidget {
  const AddProductsView({super.key});
  static const routeName = 'add-products';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create:
              (context) => AddProductCubit(
                getIt.get<ImageRepo>(),
                getIt.get<ProductsRepo>(),
              ),
          child: AddProductBodyBlocConsumer(),
        ),
      ),
    );
  }
}

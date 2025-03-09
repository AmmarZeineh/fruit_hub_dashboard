import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/helper_functions/error_snack_bar.dart';
import 'package:fruits_hub_dashboard/features/add_products/presentation/manger/cubit/add_product_cubit.dart';
import 'package:fruits_hub_dashboard/features/add_products/presentation/views/widgets/add_products_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddProductBodyBlocConsumer extends StatelessWidget {
  const AddProductBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductFailure) {
          errorSnackBar(context, state.errorMessage);
        } else if (state is AddProductSuccess) {
          errorSnackBar(context, 'Product Added');
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AddProductLoading,
          child: AddProductViewBody(),
        );
      },
    );
  }
}

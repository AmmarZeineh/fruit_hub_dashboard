import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/helper_functions/get_dummy_order.dart';
import 'package:fruits_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruits_hub_dashboard/features/order/domain/repos/orders_repo.dart';
import 'package:fruits_hub_dashboard/features/order/presentation/manger/fetch_order_cubit/fetch_order_cubit.dart';
import 'package:fruits_hub_dashboard/features/order/presentation/views/widgets/orders_view_body.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});
  static const String routeName = 'orders-view';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchOrderCubit(getIt.get<OrdersRepo>()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Orders'), centerTitle: true),
        body: OrdersViewBodyBlocBuilder(),
      ),
    );
  }
}

class OrdersViewBodyBlocBuilder extends StatefulWidget {
  const OrdersViewBodyBlocBuilder({super.key});

  @override
  State<OrdersViewBodyBlocBuilder> createState() =>
      _OrdersViewBodyBlocBuilderState();
}

class _OrdersViewBodyBlocBuilderState extends State<OrdersViewBodyBlocBuilder> {
  @override
  void initState() {
    context.read<FetchOrderCubit>().fetchOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchOrderCubit, FetchOrderState>(
      builder: (context, state) {
        if (state is FetchOrderSuccess) {
          return OrdersViewBody(orders: state.orders);
        } else if (state is FetchOrderFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return Skeletonizer(
            child: OrdersViewBody(orders: [getDummyOrder(), getDummyOrder()]),
          );
        }
      },
    );
  }
}

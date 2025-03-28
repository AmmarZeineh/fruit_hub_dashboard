import 'package:bloc/bloc.dart';
import 'package:fruits_hub_dashboard/features/order/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/order/domain/repos/orders_repo.dart';
import 'package:meta/meta.dart';

part 'fetch_order_state.dart';

class FetchOrderCubit extends Cubit<FetchOrderState> {
  FetchOrderCubit(this.ordersRepo) : super(FetchOrderInitial());
  final OrdersRepo ordersRepo;
  Future<void> fetchOrders() async {
    emit(FetchOrderLoading());
    final result = await ordersRepo.fetchOrders();
    result.fold(
      (failure) => emit(FetchOrderFailure(failure.message)),
      (orders) => emit(FetchOrderSuccess(orders)),
    );
  }
}

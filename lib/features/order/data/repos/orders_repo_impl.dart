import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failure.dart';
import 'package:fruits_hub_dashboard/core/services/backend_endpoints.dart';
import 'package:fruits_hub_dashboard/core/services/database_service.dart';
import 'package:fruits_hub_dashboard/features/order/data/models/order_model.dart';
import 'package:fruits_hub_dashboard/features/order/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/order/domain/repos/orders_repo.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DataBaseService dataBaseService;

  OrdersRepoImpl(this.dataBaseService);
  @override
  Stream<Either<Failure, List<OrderEntity>>> fetchOrders() async* {
    try {
      await for (var result in dataBaseService.streamData(
        path: BackendEndpoints.getOrder,
      )) {
        List<OrderEntity> orders =
            (result as List<dynamic>)
                .map((e) => OrderModel.fromJson(e).toEntity())
                .toList();
        yield Right(orders);
      }
    } catch (e) {
      yield Left(ServerFailure(message: 'Failed to fetch orders'));
    }
  }
}

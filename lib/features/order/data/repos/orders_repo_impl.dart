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
  Future<Either<Failure, List<OrderEntity>>> fetchOrders() async {
    var data = await dataBaseService.getData(path: BackendEndpoints.addOrder);
    try {
      List<OrderEntity> orders =
          (data as List<dynamic>)
              .map((e) => OrderModel.fromJson(e).toEntity())
              .toList();
      return Right(orders);
    } catch (e) {
      return Left(ServerFailure(message: 'Failed to fetch orders'));
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failure.dart';
import 'package:fruits_hub_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:fruits_hub_dashboard/core/services/backend_endpoints.dart';
import 'package:fruits_hub_dashboard/core/services/database_service.dart';
import 'package:fruits_hub_dashboard/features/add_products/data/models/product_model.dart';
import 'package:fruits_hub_dashboard/features/add_products/domain/entities/product_entity.dart';

class ProductsRepoImpl implements ProductsRepo {
  final DataBaseService dataBaseService;
  ProductsRepoImpl(this.dataBaseService);
  @override
  Future<Either<Failure, void>> addProduct(
    ProductEntity addProductEntity,
  ) async {
    try {
      await dataBaseService.addData(
        path: BackendEndpoints.products,
        data: ProductModel.fromEntity(addProductEntity).toJson(),
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: 'Failed to add product'));
    }
  }
}

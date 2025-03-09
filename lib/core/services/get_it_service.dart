import 'package:fruits_hub_dashboard/core/repos/image_repo/image_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/image_repo/image_repo_impl.dart';
import 'package:fruits_hub_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/products_repo/products_repo_impl.dart';
import 'package:fruits_hub_dashboard/core/services/database_service.dart';
import 'package:fruits_hub_dashboard/core/services/fire_store_service.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:fruits_hub_dashboard/core/services/supabase_service.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<StorageService>(SupabaseService());
  getIt.registerSingleton<DataBaseService>(FireStoreService());

  getIt.registerSingleton<ImageRepo>(
    ImageRepoImpl(getIt.get<StorageService>()),
  );
  getIt.registerSingleton<ProductsRepo>(
    ProductsRepoImpl(getIt.get<DataBaseService>()),
  );
}

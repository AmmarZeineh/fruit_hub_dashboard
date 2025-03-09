import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failure.dart';
import 'package:fruits_hub_dashboard/core/repos/image_repo/image_repo.dart';
import 'package:fruits_hub_dashboard/core/services/backend_endpoints.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';

class ImageRepoImpl implements ImageRepo {
  final StorageService storageService;

  ImageRepoImpl(this.storageService);
  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      String url = await storageService.uploadFile(
        image,
        BackendEndpoints.images,
      );
      return Right(url);
    } catch (e) {
      return Left(ServerFailure(message: 'Failed to uoload image'));
    }
  }
}

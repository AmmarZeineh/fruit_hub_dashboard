import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:path/path.dart' as b;

class FireStorage implements StorageService {
  final storageRef = FirebaseStorage.instance.ref();
  @override
  Future<String> uploadFile(File file, String path) async {
    var fileName = b.basename(file.path);
    var fileEx = b.extension(file.path);
    final imagesRef = storageRef.child('$path/$fileName.$fileEx');
    var result = await imagesRef.putFile(file);
    return result.ref.getDownloadURL();
  }
}

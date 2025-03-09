import 'dart:io';

import 'package:fruits_hub_dashboard/constants.dart';
import 'package:fruits_hub_dashboard/core/services/backend_endpoints.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as b;

class SupabaseService extends StorageService {
  SupabaseClient supabase = SupabaseClient(supabaseUrl, supabaseApi);

  @override
  Future<String> uploadFile(File file, String path) async {
    var fileName = b.basename(file.path);
    await supabase.storage
        .from(BackendEndpoints.images)
        .upload('$path/$fileName', file);
    var url = supabase.storage
        .from(BackendEndpoints.images)
        .getPublicUrl('$path/$fileName');
    return url;
  }
}

abstract class DataBaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? docId,
  });
  Future<Map<String, dynamic>> getData({
    required String path,
    required String docId,
  });
  Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });
  Future<bool> checkIfDataExists({
    required String path,
    required String docuementId,
  });
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub_dashboard/core/services/database_service.dart';

class FireStoreService implements DataBaseService {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  @override
  Future<Map<String, dynamic>> getData({
    required String path,
    required String docId,
  }) async {
    var data = await firebaseFirestore.collection(path).doc(docId).get();
    return data.data() as Map<String, dynamic>;
  }

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? docId,
  }) async {
    if (docId != null) {
      await firebaseFirestore.collection(path).doc(docId).set(data);
    } else {
      await firebaseFirestore.collection(path).add(data);
    }
  }

  @override
  Future<bool> checkIfDataExists({
    required String path,
    required String docuementId,
  }) async {
    var data = await firebaseFirestore.collection(path).doc(docuementId).get();
    return data.exists;
  }

  @override
  Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    await firebaseFirestore.collection(path).doc(documentId).update(data);
  }
}

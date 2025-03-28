import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub_dashboard/core/services/database_service.dart';

class FireStoreService implements DataBaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<dynamic> getData({
    required String path,
    String? docuementId,
    Map<String, dynamic>? query,
  }) async {
    if (docuementId != null) {
      var data = await firestore.collection(path).doc(docuementId).get();
      return data.data();
    } else {
      Query<Map<String, dynamic>> data = firestore.collection(path);
      if (query != null) {
        if (query['orderBy'] != null) {
          var orderByField = query['orderBy'];
          var descending = query['descending'];
          data = data.orderBy(orderByField, descending: descending);
        }
        if (query['limit'] != null) {
          var limit = query['limit'];
          data = data.limit(limit);
        }
      }
      var result = await data.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future<bool> checkIfDataExists({
    required String path,
    required String docuementId,
  }) async {
    var data = await firestore.collection(path).doc(docuementId).get();
    return data.exists;
  }

  // @override
  // Stream streamData({
  //   required String path,
  //   Map<String, dynamic>? query,
  // }) async* {
  //   Query<Map<String, dynamic>> data = firestore.collection(path);
  //   if (query != null) {
  //     if (query['orderBy'] != null) {
  //       var orderByField = query['orderBy'];
  //       var descending = query['descending'];
  //       data = data.orderBy(orderByField, descending: descending);
  //     }
  //     if (query['limit'] != null) {
  //       var limit = query['limit'];
  //       data = data.limit(limit);
  //     }
  //   }
  //   await for (var result in data.snapshots()) {
  //     yield result.docs.map((e) => e.data()).toList();
  //   }
  // }

  // @override
  // Future<void> updateData({
  //   required String path,
  //   required Map<String, dynamic> data,
  //   String? documentId,
  // }) async {
  //   await firestore.collection(path).doc(documentId).update(data);
  // }
}

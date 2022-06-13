import 'package:baraton_stores/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

class FirestoreService {
  FirestoreService({required this.uid});
  final String uid;
  // generic funtion creates a dcomcument and sets data in the document
  Future<void> _set({required String path, Map<String, dynamic>? data}) async {
    final DocumentReference<Map<String, dynamic>?> reference =
        FirebaseFirestore.instance.doc(path);
    print('$path: $data');
    await reference.set(data);
  }

  //sets message data to users collection
  /* Future<void> setMessage(ProductItem model) async {
    await _set(
        path: FirestorePath.messagefeed(documentIdFromCurrentDate()),
        data: model.toMap());
  }*/

  Future<DocumentReference> setProduct(ProductItem productItem) async {
    return await FirebaseFirestore.instance
        .collection('computers')
        .add(productItem.toMap());
  }

  Stream<List<ProductItem>> productItemStream() {
    final reference = FirebaseFirestore.instance
        .collection('computers')
        .limit(50)
        .orderBy('timeStamp', descending: true);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => snapshot.docs
        .map((snapshot) => ProductItem.fromMap(snapshot.data()))
        .toList());
  }
}

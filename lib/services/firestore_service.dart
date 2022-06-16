import 'package:baraton_stores/models/checkout_product.dart';
import 'package:baraton_stores/models/new_product_model.dart';
import 'package:baraton_stores/models/product_model.dart';
import 'package:baraton_stores/services/document_path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

class FirestoreService {
  FirestoreService({required this.uid});
  final String uid;

  // generic funtion creates a dcomcument and sets data in the document
  Future<void> _set({required String path, Map<String, dynamic>? data}) async {
    final DocumentReference<Map<String, dynamic>?> reference =
        FirebaseFirestore.instance.doc(path);
    if (kDebugMode) {
      print('$path: $data');
    }
    await reference.set(data);
  }

  //creates or writes a product for buyers collection per user id
  Future<void> setCheckoutItem(CheckoutItem checkoutItem) async {
    await _set(
        path: DocumentPath.productcheckout(uid, checkoutItem.id),
        data: checkoutItem.toMap());
  }

  //reads a product from buyers collection per user id
  Stream<List<CheckoutItem>> checkoutItemsStream() {
    final path = DocumentPath.checkout(uid);
    final reference = FirebaseFirestore.instance.collection(path);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => snapshot.docs
        .map((
          snapshot,
        ) =>
            CheckoutItem.fromMap(snapshot.data(), snapshot.id))
        .toList());
  }

  //deletes a doc from buyers collection/uid/docid
  Future<void> deleteContibutor(CheckoutItem checkoutItem) async {
    final path = DocumentPath.productcheckout(uid, checkoutItem.id);
    final reference = FirebaseFirestore.instance.doc(path);
    if (kDebugMode) {
      print('delete: $path');
    }
    await reference.delete();
  }

  //creates or writes a product for apliances collection per user id
  Future<void> setappliance(NewProductItem newItem) async {
    await _set(
        path: DocumentPath.newproduct(newItem.id), data: newItem.toMap());
  }

  //reads a product from appliances collection
  Stream<List<NewProductItem>> apliancesStream() {
    final path = DocumentPath.streamproduct();
    final reference = FirebaseFirestore.instance.collection(path);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => snapshot.docs
        .map((
          snapshot,
        ) =>
            NewProductItem.fromMap(snapshot.data(), snapshot.id))
        .toList());
  }

  //deletes a doc from aplliances collection
  Future<void> deleteappliance(NewProductItem newItem) async {
    final path = DocumentPath.newproduct(newItem.id);
    final reference = FirebaseFirestore.instance.doc(path);
    if (kDebugMode) {
      print('delete: $path');
    }
    await reference.delete();
  }

  //creates new products on computers collection
  Future<DocumentReference> setProductAll(ProductItem productItem) async {
    return await FirebaseFirestore.instance
        .collection('All products')
        .add(productItem.toMap());
  }

  //reads data from computers stream
  Stream<List<ProductItem>> productItemStreamAll() {
    final reference = FirebaseFirestore.instance
        .collection('All products')
        .limit(50)
        .orderBy('timeStamp', descending: true);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => snapshot.docs
        .map((snapshot) => ProductItem.fromMap(snapshot.data()))
        .toList());
  }

  //creates new products on computers collection
  Future<DocumentReference> setProduct(ProductItem productItem) async {
    return await FirebaseFirestore.instance
        .collection('computers')
        .add(productItem.toMap());
  }

  //reads data from computers stream
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

  Future<DocumentReference> addprod(ProductItem productItem) async {
    return await FirebaseFirestore.instance
        .collection('Beauty products')
        .add(productItem.toMap());
  }

  //reads data from computers stream
  Stream<List<ProductItem>> productItemStream1() {
    final reference = FirebaseFirestore.instance
        .collection('Beauty products')
        .limit(50)
        .orderBy('timeStamp', descending: true);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => snapshot.docs
        .map((snapshot) => ProductItem.fromMap(snapshot.data()))
        .toList());
  }

  Future<DocumentReference> setProduct2(ProductItem productItem) async {
    return await FirebaseFirestore.instance
        .collection('phones and acessories')
        .add(productItem.toMap());
  }

  //reads data from computers stream
  Stream<List<ProductItem>> productItemStream2() {
    final reference = FirebaseFirestore.instance
        .collection('phones and acessories')
        .limit(50)
        .orderBy('timeStamp', descending: true);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => snapshot.docs
        .map((snapshot) => ProductItem.fromMap(snapshot.data()))
        .toList());
  }

  Future<DocumentReference> setProduct3(ProductItem productItem) async {
    return await FirebaseFirestore.instance
        .collection('clothes')
        .add(productItem.toMap());
  }

  //reads data from computers stream
  Stream<List<ProductItem>> productItemStream3() {
    final reference = FirebaseFirestore.instance
        .collection('clothes')
        .limit(50)
        .orderBy('timeStamp', descending: true);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => snapshot.docs
        .map((snapshot) => ProductItem.fromMap(snapshot.data()))
        .toList());
  }

  Future<DocumentReference> setProduct4(ProductItem productItem) async {
    return await FirebaseFirestore.instance
        .collection('household items')
        .add(productItem.toMap());
  }

  //reads data from computers stream
  Stream<List<ProductItem>> productItemStream4() {
    final reference = FirebaseFirestore.instance
        .collection('household items')
        .limit(50)
        .orderBy('timeStamp', descending: true);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => snapshot.docs
        .map((snapshot) => ProductItem.fromMap(snapshot.data()))
        .toList());
  }
}

/* Future<DocumentReference> setcheckout(ProductItem productItem) async {
    return await FirebaseFirestore.instance
        .collection(userId)
        .add(productItem.toMap());
  }

  Future<void> deletecheckout(ProductItem productItem) async {
    return await FirebaseFirestore.instance.collection(userId).doc().delete();
    //.add(productItem.toMap());
  }

  Stream<List<ProductItem>> checkoutStream() {
    final reference = FirebaseFirestore.instance
        .collection(userId)
        .limit(50)
        .orderBy('timeStamp', descending: true);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => snapshot.docs
        .map((snapshot) => ProductItem.fromMap(snapshot.data()))
        .toList());
  }*/

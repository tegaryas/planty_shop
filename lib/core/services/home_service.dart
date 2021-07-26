import 'package:cloud_firestore/cloud_firestore.dart';

class HomeServices {
  final CollectionReference _productReference =
      FirebaseFirestore.instance.collection('Products');

  Future<List<QueryDocumentSnapshot>> getProduct() async {
    var value = await _productReference.get();
    return value.docs;
  }
}

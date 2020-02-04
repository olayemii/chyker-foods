import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreProvider {
  final Firestore _firestore = Firestore.instance;

  Future<QuerySnapshot> getFoods(dynamic category) async {
    QuerySnapshot foods;
    if (category == null || category < 3) {
      foods = await _firestore
          .collection("foods")
          .where("category", isEqualTo: category)
          .getDocuments();
    } else {
      foods = await _firestore.collection("foods").getDocuments();
    }
    return foods;
  }
}

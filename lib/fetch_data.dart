import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homzes/utils/log_util.dart';

class FetchData {
  final _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> fetchFirebase(
      String collectionName) async {
    try {
      final querySnapshot = await _firestore.collection(collectionName).get();
      final properties = querySnapshot.docs.map((doc) => doc.data()).toList();
      printLog("Fetched properties: $properties");
      return properties;
    } catch (e) {
      printLog("Error fetching properties: $e");
      return [];
    }
  }
}

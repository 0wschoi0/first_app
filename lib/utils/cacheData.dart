import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_cache/firestore_cache.dart';

class CacheData {
  static Future<QuerySnapshot<Map<String, dynamic>>> fetchCacheData() async {
    User? user = FirebaseAuth.instance.currentUser;
    late QuerySnapshot<Map<String, dynamic>> snapshot;
    if (user != null) {
      String userEmail = user.email!;
      final cacheDocRef = FirebaseFirestore.instance.doc('$userEmail/status');
      String cacheField = "updatedAt";
      final Query<Map<String, dynamic>> query =
          FirebaseFirestore.instance.collection(user.email!);
      snapshot = await FirestoreCache.getDocuments(
        query: query,
        cacheDocRef: cacheDocRef,
        firestoreCacheField: cacheField,
      );
    }
    return snapshot;
  }

  static DocumentReference fetchCacheDoc() {
    User? user = FirebaseAuth.instance.currentUser;
    String userEmail = "";
    if (user != null) {
      userEmail = user.email!;
    }
    final DocumentReference<Map<String, dynamic>> query =
        FirebaseFirestore.instance.collection(userEmail).doc();
    return query;
  }
}

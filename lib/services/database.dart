import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference dbNovels =
      FirebaseFirestore.instance.collection('novels');

  Future<void> updateUserData(String novelname) async {
    return await dbNovels.doc(uid).set({
      'id': uid,
      'name': novelname,
    });
  }
}

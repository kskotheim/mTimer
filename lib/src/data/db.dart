import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DatabaseManager {
  Future<void> createMeeting(String name);

  Future<List<String>> meetings();

  Stream<List<String>> meetingStream();
}

class DB implements DatabaseManager {
  final db = FirebaseFirestore.instance;

  Future<void> createMeeting(String name) {
    return db.collection('MEETINGS').doc().set({'name': name});
  }

  Future<List<String>> meetings() {
    return db.collection('MEETINGS').get().then((value) => value.docs.map((e) => e.data()['name'].toString()).toList());
  }

  Stream<List<String>> meetingStream(){
    return db.collection('MEETINGS').snapshots().map((event) => event.docs.map((e) => e.data()['name'].toString()).toList());
  }
}

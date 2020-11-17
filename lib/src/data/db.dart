import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meeting_app/src/home/model/meeting.dart';

abstract class DatabaseManager {
  Future<void> createMeeting(Meeting meeting);
  Stream<Meeting> currentMeeting(String meetingId);
  Stream<Meeting> userMeeting(String userId);
  Future<void> updateMeeting(String userId, String meetingId, Map<String, dynamic> data);
  Future<void> deleteMeeting(String meetingId);

  Future<void> resetMeeting(String meetingId);
}

class DB implements DatabaseManager {
  final db = FirebaseFirestore.instance;

  Future<void> createMeeting(Meeting meeting) {
    return db.collection(MEETINGS).doc().set(meeting.toMap());
  }

  Stream<Meeting> currentMeeting(String id){
    return db.collection(MEETINGS).doc(id).snapshots().map((e) => Meeting.fromDocumentSnapshot(e));
  }

  Stream<Meeting> userMeeting(String userId){
    return db.collection(MEETINGS).where(Meeting.CREATOR_ID, isEqualTo: userId).snapshots().map((query) => query.docs.isNotEmpty ? Meeting.fromDocumentSnapshot(query.docs.first) : null);
  }

  Future<void> updateMeeting(String userId, String meetingId, Map<String, dynamic> data){
    return db.collection(MEETINGS).doc(meetingId).update(data);
  }

  Future<void> deleteMeeting(String meetingId){
    return db.collection(MEETINGS).doc(meetingId).delete();
  }

  Future<void> resetMeeting(String meetingId){

  }
}

abstract class MeetingManager{
  Future<void> startTimer();
  Future<void> pauseTimer();
  Future<void> nextItem();
} 

class MM implements MeetingManager{
  final String meetingId;
  final String userId;
  final FirebaseFirestore db = FirebaseFirestore.instance;

  MM(this.meetingId, this.userId){
    
  }

  DocumentReference get timer => db.collection(MEETINGS).doc(meetingId);

  Future<void> startTimer(){
    return timer.update({Meeting.START_TIME: DateTime.now().millisecondsSinceEpoch});
  }

  Future<void> pauseTimer(){

  }

  Future<void> nextItem(){
    
  }

}


const MEETINGS = 'Meetings';
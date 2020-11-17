import 'dart:async';

import 'package:meeting_app/src/data/db.dart';
import 'package:meeting_app/src/home/model/meeting.dart';
import 'package:mobx/mobx.dart';

part 'meeting_controller.g.dart';

class MeetingController = _MeetingController with _$MeetingController;

abstract class _MeetingController with Store {

  final Meeting meeting;
  final String meetingId;
  final String userId;

  final MeetingManager _mm;

  _MeetingController({this.meeting, this.userId}) : meetingId = meeting.documentId, _mm = MM(meeting.documentId, userId){
    Timer.periodic(Duration(milliseconds: 100), (_) => updateTime());
  }

  
  bool get meetingIsStarted => meeting.startTime != null;
  int get startTime => meeting.startTime;

  void startMeeting(){
    _mm.startTimer();
  }

  @observable
  int currentTime = 0;

  @computed
  int get currentMinutes => currentTime ~/ 60;

  @computed
  int get currentSeconds => currentTime % 60;

  @computed
  String get currentTimerString => '${currentMinutes.toString().length == 1 ? '0' + currentMinutes.toString() : currentMinutes}:${currentSeconds.toString().length == 1 ? '0' + currentSeconds.toString() : currentSeconds}';

  @action
  void updateTime(){
    currentTime = (DateTime.now().millisecondsSinceEpoch - (startTime ?? 0)) ~/ 1000;
  }

}
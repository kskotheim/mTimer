import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meeting_app/src/home/model/agenda_item.dart';

class Meeting {
  static const NAME = 'Name';
  static const ITEMS = 'Items';
  static const CREATOR_ID = 'Creator_Id';
  static const START_TIME = 'Start_Time';
  static const PAUSED_TIMES = 'Paused_Times';
  static const RESUMED_TIMES = 'Resumed_Times';
  static const NEXT_SECTION_TIMES = 'Next_Section_Times';

  static const DEFAULT_TIMER_NAME = 'New Timer';
  
  final List<AgendaItem> items;
  final String name;
  final String creatorId;

  final String documentId;

  final int startTime;
  final List<int> pausedTimes;
  final List<int> resumedTimes;
  final List<int> nextSectionTimes;

  Meeting({
    this.items = const [],
    this.name = 'New Timer',
    this.creatorId,
    this.documentId,
    this.startTime,
    this.pausedTimes = const [],
    this.resumedTimes = const [],
    this.nextSectionTimes = const [],
  });

  Map<String, dynamic> toMap() => {
        NAME: name,
        ITEMS: items.map((e) => e.toMap()).toList(),
        CREATOR_ID: creatorId,
        START_TIME: startTime,
        PAUSED_TIMES: pausedTimes,
        RESUMED_TIMES: resumedTimes,
        NEXT_SECTION_TIMES: nextSectionTimes,
      };

  Meeting.fromDocumentSnapshot(DocumentSnapshot document)
      : name = document.data()[NAME],
        items = List<Map<String, dynamic>>.from(document.data()[ITEMS]).map((e) => AgendaItem.fromMap(e)).toList(),
        creatorId = document.data()[CREATOR_ID],
        startTime = document.data()[START_TIME],
        pausedTimes = List<int>.from(document.data()[PAUSED_TIMES]),
        resumedTimes = List<int>.from(document.data()[RESUMED_TIMES]),
        nextSectionTimes = List<int>.from(document.data()[NEXT_SECTION_TIMES]),
        documentId = document.id;
}

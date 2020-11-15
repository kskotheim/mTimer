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

  final int startTime;
  final List<int> pausedTimes;
  final List<int> resumedTimes;
  final List<int> nextSectionTimes;

  Meeting({
    this.items = const [],
    this.name = 'New Timer',
    this.creatorId,
    this.startTime,
    this.pausedTimes = const [],
    this.resumedTimes = const [],
    this.nextSectionTimes = const [],
  });

  Map<String, dynamic> toMap() => {
        NAME: name,
        ITEMS: items.map((e) => e.toMap()).toList(),
        CREATOR_ID: creatorId,
      };

  Meeting.fromMap(Map<String, dynamic> data)
      : name = data[NAME],
        items = List<Map<String, dynamic>>.from(data[ITEMS]).map((e) => AgendaItem.fromMap(e)).toList(),
        creatorId = data[CREATOR_ID],
        startTime = data[START_TIME],
        pausedTimes = data[PAUSED_TIMES],
        resumedTimes = data[RESUMED_TIMES],
        nextSectionTimes = data[NEXT_SECTION_TIMES];
}

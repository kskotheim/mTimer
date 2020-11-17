// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meeting.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Meeting on _Meeting, Store {
  Computed<bool> _$newItemNameNotEmptyComputed;

  @override
  bool get newItemNameNotEmpty => (_$newItemNameNotEmptyComputed ??=
          Computed<bool>(() => super.newItemNameNotEmpty,
              name: '_Meeting.newItemNameNotEmpty'))
      .value;
  Computed<ObservableList<AgendaItem>> _$firstItemsComputed;

  @override
  ObservableList<AgendaItem> get firstItems => (_$firstItemsComputed ??=
          Computed<ObservableList<AgendaItem>>(() => super.firstItems,
              name: '_Meeting.firstItems'))
      .value;
  Computed<ObservableList<AgendaItem>> _$secondItemsComputed;

  @override
  ObservableList<AgendaItem> get secondItems => (_$secondItemsComputed ??=
          Computed<ObservableList<AgendaItem>>(() => super.secondItems,
              name: '_Meeting.secondItems'))
      .value;
  Computed<ObservableList<Color>> _$agendaItemColorsComputed;

  @override
  ObservableList<Color> get agendaItemColors => (_$agendaItemColorsComputed ??=
          Computed<ObservableList<Color>>(() => super.agendaItemColors,
              name: '_Meeting.agendaItemColors'))
      .value;
  Computed<ObservableList<num>> _$agendaItemTimesComputed;

  @override
  ObservableList<num> get agendaItemTimes => (_$agendaItemTimesComputed ??=
          Computed<ObservableList<num>>(() => super.agendaItemTimes,
              name: '_Meeting.agendaItemTimes'))
      .value;
  Computed<num> _$totalMeetingTimeComputed;

  @override
  num get totalMeetingTime => (_$totalMeetingTimeComputed ??= Computed<num>(
          () => super.totalMeetingTime,
          name: '_Meeting.totalMeetingTime'))
      .value;
  Computed<bool> _$canAddMoreItemsComputed;

  @override
  bool get canAddMoreItems =>
      (_$canAddMoreItemsComputed ??= Computed<bool>(() => super.canAddMoreItems,
              name: '_Meeting.canAddMoreItems'))
          .value;

  final _$newItemMinutesAtom = Atom(name: '_Meeting.newItemMinutes');

  @override
  int get newItemMinutes {
    _$newItemMinutesAtom.reportRead();
    return super.newItemMinutes;
  }

  @override
  set newItemMinutes(int value) {
    _$newItemMinutesAtom.reportWrite(value, super.newItemMinutes, () {
      super.newItemMinutes = value;
    });
  }

  final _$newItemColorAtom = Atom(name: '_Meeting.newItemColor');

  @override
  Color get newItemColor {
    _$newItemColorAtom.reportRead();
    return super.newItemColor;
  }

  @override
  set newItemColor(Color value) {
    _$newItemColorAtom.reportWrite(value, super.newItemColor, () {
      super.newItemColor = value;
    });
  }

  final _$agendaItemsAtom = Atom(name: '_Meeting.agendaItems');

  @override
  ObservableList<AgendaItem> get agendaItems {
    _$agendaItemsAtom.reportRead();
    return super.agendaItems;
  }

  @override
  set agendaItems(ObservableList<AgendaItem> value) {
    _$agendaItemsAtom.reportWrite(value, super.agendaItems, () {
      super.agendaItems = value;
    });
  }

  final _$newItemNameAtom = Atom(name: '_Meeting.newItemName');

  @override
  String get newItemName {
    _$newItemNameAtom.reportRead();
    return super.newItemName;
  }

  @override
  set newItemName(String value) {
    _$newItemNameAtom.reportWrite(value, super.newItemName, () {
      super.newItemName = value;
    });
  }

  final _$meetingNameAtom = Atom(name: '_Meeting.meetingName');

  @override
  String get meetingName {
    _$meetingNameAtom.reportRead();
    return super.meetingName;
  }

  @override
  set meetingName(String value) {
    _$meetingNameAtom.reportWrite(value, super.meetingName, () {
      super.meetingName = value;
    });
  }

  final _$creatingMeetingAtom = Atom(name: '_Meeting.creatingMeeting');

  @override
  bool get creatingMeeting {
    _$creatingMeetingAtom.reportRead();
    return super.creatingMeeting;
  }

  @override
  set creatingMeeting(bool value) {
    _$creatingMeetingAtom.reportWrite(value, super.creatingMeeting, () {
      super.creatingMeeting = value;
    });
  }

  final _$createMeetingAsyncAction = AsyncAction('_Meeting.createMeeting');

  @override
  Future<void> createMeeting() {
    return _$createMeetingAsyncAction.run(() => super.createMeeting());
  }

  final _$_MeetingActionController = ActionController(name: '_Meeting');

  @override
  void setMeetingName(String name) {
    final _$actionInfo =
        _$_MeetingActionController.startAction(name: '_Meeting.setMeetingName');
    try {
      return super.setMeetingName(name);
    } finally {
      _$_MeetingActionController.endAction(_$actionInfo);
    }
  }

  @override
  void incrementItemMinutes(int inc) {
    final _$actionInfo = _$_MeetingActionController.startAction(
        name: '_Meeting.incrementItemMinutes');
    try {
      return super.incrementItemMinutes(inc);
    } finally {
      _$_MeetingActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setItemMinutes(int val) {
    final _$actionInfo =
        _$_MeetingActionController.startAction(name: '_Meeting.setItemMinutes');
    try {
      return super.setItemMinutes(val);
    } finally {
      _$_MeetingActionController.endAction(_$actionInfo);
    }
  }

  @override
  void startFastIncrement(dynamic multiplier) {
    final _$actionInfo = _$_MeetingActionController.startAction(
        name: '_Meeting.startFastIncrement');
    try {
      return super.startFastIncrement(multiplier);
    } finally {
      _$_MeetingActionController.endAction(_$actionInfo);
    }
  }

  @override
  void endFastIncrement(dynamic _) {
    final _$actionInfo = _$_MeetingActionController.startAction(
        name: '_Meeting.endFastIncrement');
    try {
      return super.endFastIncrement(_);
    } finally {
      _$_MeetingActionController.endAction(_$actionInfo);
    }
  }

  @override
  void createAgendaItem() {
    final _$actionInfo = _$_MeetingActionController.startAction(
        name: '_Meeting.createAgendaItem');
    try {
      return super.createAgendaItem();
    } finally {
      _$_MeetingActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeItemColor(AgendaItem item) {
    final _$actionInfo = _$_MeetingActionController.startAction(
        name: '_Meeting.changeItemColor');
    try {
      return super.changeItemColor(item);
    } finally {
      _$_MeetingActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeNewItemColor() {
    final _$actionInfo = _$_MeetingActionController.startAction(
        name: '_Meeting.changeNewItemColor');
    try {
      return super.changeNewItemColor();
    } finally {
      _$_MeetingActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetMeeting() {
    final _$actionInfo =
        _$_MeetingActionController.startAction(name: '_Meeting.resetMeeting');
    try {
      return super.resetMeeting();
    } finally {
      _$_MeetingActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateNewItemName(String name) {
    final _$actionInfo = _$_MeetingActionController.startAction(
        name: '_Meeting.updateNewItemName');
    try {
      return super.updateNewItemName(name);
    } finally {
      _$_MeetingActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
newItemMinutes: ${newItemMinutes},
newItemColor: ${newItemColor},
agendaItems: ${agendaItems},
newItemName: ${newItemName},
meetingName: ${meetingName},
creatingMeeting: ${creatingMeeting},
newItemNameNotEmpty: ${newItemNameNotEmpty},
firstItems: ${firstItems},
secondItems: ${secondItems},
agendaItemColors: ${agendaItemColors},
agendaItemTimes: ${agendaItemTimes},
totalMeetingTime: ${totalMeetingTime},
canAddMoreItems: ${canAddMoreItems}
    ''';
  }
}

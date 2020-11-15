import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meeting_app/src/home/model/agenda_item.dart';
import 'package:meeting_app/src/material/style.dart';
import 'package:mobx/mobx.dart';
import 'package:meeting_app/src/home/model/meeting.dart' as model;

part 'meeting.g.dart';

class Meeting = _Meeting with _$Meeting;

abstract class _Meeting with Store {
  static const MAX_ITEMS = 12;
  static const MAX_ITEM_MINUTES = 60;
  static const MIN_ITEM_MINUTES = 1;
  Timer _fastIncrementTimer;

  int get minItemMinutes => MIN_ITEM_MINUTES;
  int get maxItemMinutes => MAX_ITEM_MINUTES;

  @override
  void dispose() {
    _fastIncrementTimer.cancel();
  }


  // OBSERVABLES

  @observable
  int newItemMinutes = AgendaItem.DEFAULT_MINUTES;

  @observable
  Color newItemColor = Style.getRandomColor([]);

  @observable
  var agendaItems = ObservableList<AgendaItem>();

  @observable
  String newItemName = '';

  @observable
  String meetingName = model.Meeting.DEFAULT_TIMER_NAME;

  // COMPUTED

  @computed
  bool get newItemNameNotEmpty => newItemName.length > 0;

  @computed
  ObservableList<AgendaItem> get firstItems =>
      ObservableList.of(agendaItems.getRange(0, (agendaItems.length * .5).ceil()));

  @computed
  ObservableList<AgendaItem> get secondItems =>
      ObservableList.of(agendaItems.getRange((agendaItems.length * .5).ceil(), agendaItems.length));

  @computed
  ObservableList<Color> get agendaItemColors => ObservableList.of(agendaItems.map((element) => element.color));

  @computed
  ObservableList<num> get agendaItemTimes => ObservableList<num>.of(agendaItems.map((e) => e.minutes));

  @computed
  num get totalMeetingTime => agendaItemTimes.length > 0 ? agendaItemTimes.reduce((a, b) => a + b) : 0;

  @computed
  bool get canAddMoreItems => agendaItems.length < MAX_ITEMS;

  // ACTIONS

  @action
  void setMeetingName(String name) => meetingName = name ?? model.Meeting.DEFAULT_TIMER_NAME;

  @action
  void incrementItemMinutes(int inc) {
    newItemMinutes += inc;
    if (newItemMinutes < MIN_ITEM_MINUTES) newItemMinutes = MIN_ITEM_MINUTES;
    if (newItemMinutes > MAX_ITEM_MINUTES) newItemMinutes = MAX_ITEM_MINUTES;
  }

  @action
  void setItemMinutes(int val) {
    newItemMinutes = val;
    if (newItemMinutes < MIN_ITEM_MINUTES) newItemMinutes = MIN_ITEM_MINUTES;
    if (newItemMinutes > MAX_ITEM_MINUTES) newItemMinutes = MAX_ITEM_MINUTES;
  }

  @action
  void startFastIncrement(var multiplier) {
    _fastIncrementTimer = Timer.periodic(Duration(milliseconds: 100), (_) {
      incrementItemMinutes(multiplier);
    });
  }

  @action
  void endFastIncrement(_) {
    _fastIncrementTimer.cancel();
  }

  @action
  void createAgendaItem() {
    var item = AgendaItem(
        minutes: newItemMinutes,
        name: newItemName,
        // get a random color and exclude colors that have already been chosen
        color: newItemColor);
    agendaItems.add(item);

    newItemColor = Style.getRandomColor(agendaItemColors);
    // newItemMinutes = 15;
    newItemName = '';
  }

  @action
  void changeItemColor(AgendaItem item) {
    Color newColor = Style.getRandomColor(agendaItemColors);
    int itemIndex = agendaItems.indexOf(item);
    agendaItems.replaceRange(
      itemIndex,
      itemIndex + 1,
      ObservableList.of([AgendaItem(name: item.name, minutes: item.minutes, color: newColor)]),
    );
  }

  @action
  void changeNewItemColor() {
    newItemColor = Style.getRandomColor(agendaItemColors);
  }

  @action
  void resetMeeting() {
    agendaItems = ObservableList();
    newItemMinutes = AgendaItem.DEFAULT_MINUTES;
  }

  @action
  void updateNewItemName(String name) => newItemName = name;
}

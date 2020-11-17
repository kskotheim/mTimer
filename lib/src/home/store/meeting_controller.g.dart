// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meeting_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MeetingController on _MeetingController, Store {
  Computed<int> _$currentMinutesComputed;

  @override
  int get currentMinutes =>
      (_$currentMinutesComputed ??= Computed<int>(() => super.currentMinutes,
              name: '_MeetingController.currentMinutes'))
          .value;
  Computed<int> _$currentSecondsComputed;

  @override
  int get currentSeconds =>
      (_$currentSecondsComputed ??= Computed<int>(() => super.currentSeconds,
              name: '_MeetingController.currentSeconds'))
          .value;
  Computed<String> _$currentTimerStringComputed;

  @override
  String get currentTimerString => (_$currentTimerStringComputed ??=
          Computed<String>(() => super.currentTimerString,
              name: '_MeetingController.currentTimerString'))
      .value;

  final _$currentTimeAtom = Atom(name: '_MeetingController.currentTime');

  @override
  int get currentTime {
    _$currentTimeAtom.reportRead();
    return super.currentTime;
  }

  @override
  set currentTime(int value) {
    _$currentTimeAtom.reportWrite(value, super.currentTime, () {
      super.currentTime = value;
    });
  }

  final _$_MeetingControllerActionController =
      ActionController(name: '_MeetingController');

  @override
  void updateTime() {
    final _$actionInfo = _$_MeetingControllerActionController.startAction(
        name: '_MeetingController.updateTime');
    try {
      return super.updateTime();
    } finally {
      _$_MeetingControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentTime: ${currentTime},
currentMinutes: ${currentMinutes},
currentSeconds: ${currentSeconds},
currentTimerString: ${currentTimerString}
    ''';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Home on _Home, Store {
  Computed<bool> _$codeIsEmptyComputed;

  @override
  bool get codeIsEmpty => (_$codeIsEmptyComputed ??=
          Computed<bool>(() => super.codeIsEmpty, name: '_Home.codeIsEmpty'))
      .value;

  final _$stateAtom = Atom(name: '_Home.state');

  @override
  HomeState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(HomeState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$codeAtom = Atom(name: '_Home.code');

  @override
  String get code {
    _$codeAtom.reportRead();
    return super.code;
  }

  @override
  set code(String value) {
    _$codeAtom.reportWrite(value, super.code, () {
      super.code = value;
    });
  }

  final _$_HomeActionController = ActionController(name: '_Home');

  @override
  void enterCodePressed() {
    final _$actionInfo =
        _$_HomeActionController.startAction(name: '_Home.enterCodePressed');
    try {
      return super.enterCodePressed();
    } finally {
      _$_HomeActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cancelEnterCode() {
    final _$actionInfo =
        _$_HomeActionController.startAction(name: '_Home.cancelEnterCode');
    try {
      return super.cancelEnterCode();
    } finally {
      _$_HomeActionController.endAction(_$actionInfo);
    }
  }

  @override
  void createMeetingPressed() {
    final _$actionInfo =
        _$_HomeActionController.startAction(name: '_Home.createMeetingPressed');
    try {
      return super.createMeetingPressed();
    } finally {
      _$_HomeActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cancelCreateMeeting() {
    final _$actionInfo =
        _$_HomeActionController.startAction(name: '_Home.cancelCreateMeeting');
    try {
      return super.cancelCreateMeeting();
    } finally {
      _$_HomeActionController.endAction(_$actionInfo);
    }
  }

  @override
  void process(dynamic str) {
    final _$actionInfo =
        _$_HomeActionController.startAction(name: '_Home.process');
    try {
      return super.process(str);
    } finally {
      _$_HomeActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
code: ${code},
codeIsEmpty: ${codeIsEmpty}
    ''';
  }
}

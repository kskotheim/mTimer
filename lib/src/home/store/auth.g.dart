// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Auth on _Auth, Store {
  Computed<bool> _$userHasIdComputed;

  @override
  bool get userHasId => (_$userHasIdComputed ??=
          Computed<bool>(() => super.userHasId, name: '_Auth.userHasId'))
      .value;

  final _$userIdAtom = Atom(name: '_Auth.userId');

  @override
  String get userId {
    _$userIdAtom.reportRead();
    return super.userId;
  }

  @override
  set userId(String value) {
    _$userIdAtom.reportWrite(value, super.userId, () {
      super.userId = value;
    });
  }

  final _$getIdAsyncAction = AsyncAction('_Auth.getId');

  @override
  Future<void> getId() {
    return _$getIdAsyncAction.run(() => super.getId());
  }

  @override
  String toString() {
    return '''
userId: ${userId},
userHasId: ${userHasId}
    ''';
  }
}

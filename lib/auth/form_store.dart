import 'dart:math';

import 'package:mobx/mobx.dart';
import 'form_error_state.dart';

part 'form_store.g.dart';

class FormStore = _FormStore with _$FormStore;

abstract class _FormStore with Store {

  final FormErrorState error = FormErrorState();

  @observable
  var name = '';

  @observable
  var email = '';

  @observable
  var password = '';

  @action
  void setUsername(String val) => name = val;

  @action
  void setEmail(String val) => email = val;

  @action
  void setPassword(String val) => password = val;

  @observable
  var _usernameCheck = ObservableFuture<bool>.value(true);

  @action
  Future<void> validateUsername(String val) async {
    if(val == null || val.isEmpty){
      error.username = 'Can not be blank';
      return;
    }
    
    try {
      _usernameCheck = ObservableFuture(checkValidUsername(val));
      error.username = null;
      final isValid = await _usernameCheck;

    } on Object catch (_){
      error.username = null;
    }

    error.username = null;
  }

  @action
  void validatePassword(String val){
    if(val == null || val.isEmpty){
      error.password = 'Can not be blank';
      return;
    }
    error.username = null;
  }

  @action
  void validateEmail(String val){
    if(!isEmail(val)){
      error.email = 'Must be email';
      return;
    }
    error.email = null;
  }

  bool isEmail(String val){
    return val == 'email';
  }

  Future<bool> checkValidUsername(String name) async {
    await Future.delayed(Duration(seconds: 2));
    return Random().nextDouble() > .5;
  }
}


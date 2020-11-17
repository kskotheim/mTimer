import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

part 'auth.g.dart';

class Auth = _Auth with _$Auth;

abstract class _Auth with Store{

  static const String ID = 'ID';

  @observable 
  String userId;

  @computed
  bool get userHasId => userId != null;

  @action
  Future<void> getId() async {
    final prefs = await SharedPreferences.getInstance();

    if(prefs.containsKey(ID) && prefs.getString(ID) != null){
      return userId = prefs.getString(ID);
    }

    userId = Uuid().v4();
    prefs.setString(ID, userId);
  }

}
import 'package:mobx/mobx.dart';

part 'home.g.dart';

class Home = _Home with _$Home;

enum HomeState {home, connect, create}

abstract class _Home with Store {
  
  // connect to meeting observables + actions
  @observable
  var state = HomeState.home;

  @observable
  String code = '';

  @computed
  bool get codeIsEmpty => code.length == 0;

  @action
  void enterCodePressed() => state = HomeState.connect;

  @action
  void cancelEnterCode() => state = HomeState.home;


  // create meeting observables + actions

  @action
  void createMeetingPressed() => state = HomeState.create;

  @action
  void cancelCreateMeeting() => state = HomeState.home;



  @action
  void process(str) {
    switch (str) {
      case '1':
        code += str;
        break;
      case '2':
        code += str;
        break;
      case '3':
        code += str;
        break;
      case '4':
        code += str;
        break;
      case '5':
        code += str;
        break;
      case '6':
        code += str;
        break;
      case '7':
        code += str;
        break;
      case '8':
        code += str;
        break;
      case '9':
        code += str;
        break;
      case '0':
        code += str;
        break;
      case '<-':
        if (code.length > 0) code = code.substring(0, code.length - 1);
        break;
      case 'x':
      code = '';
      cancelEnterCode();
        break;
      default:
      print('error');
    }
  }
}

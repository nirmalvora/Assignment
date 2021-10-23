import 'package:flutter/foundation.dart';
import 'package:sequoiacapdemo/core/enums/viewstate.dart';

class BaseModel with ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  set state(ViewState viewState) {
    print('State:$viewState');
    _state = viewState;
    notifyListeners();
  }

  set stateWithoutUpdate(ViewState viewState) {
    print('State:$viewState');
    _state = viewState;
  }

  void updateUI() {
    notifyListeners();
  }
}

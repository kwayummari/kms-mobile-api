import 'package:flutter/foundation.dart';

class MyProvider extends ChangeNotifier {
  bool _isLoging = false;

  bool get myLoging => _isLoging;

  void updateLoging(bool newValue) {
    _isLoging = newValue;
    notifyListeners();
  }
}

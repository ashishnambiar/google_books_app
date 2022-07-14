import 'package:flutter/material.dart';

abstract class APIController extends ChangeNotifier {
  bool _loaded = true;

  bool get isloaded => _loaded;

  notLoaded() {
    if (_loaded) {
      _loaded = false;
      notifyListeners();
    }
  }

  hasLoaded() {
    if (!_loaded) {
      _loaded = true;
      notifyListeners();
    }
  }
}

import 'package:flutter/material.dart';

class SetStateProvider extends ChangeNotifier {
  mySetState() {
    notifyListeners();
  }
}

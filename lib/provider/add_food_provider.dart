import 'package:flutter/material.dart';
import 'package:kfcapp/service/firestorage_service.dart';

class RemoveCategoryProvider extends ChangeNotifier {
  removeCategoryProvider(int index)async {
    UserAddImage.foods.removeAt(index);
    await UserAddImage.writeToDbSC();
    notifyListeners();
  }
}

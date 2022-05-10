import 'package:flutter/material.dart';
import 'package:kfcapp/service/fire_service.dart';

class AdminService{
  static Future writeToDb({required String name}) async {
    try {
      await FireService.store
          .collection('foods')
          .doc(name)
          .set({
        "food": []
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }
  
}
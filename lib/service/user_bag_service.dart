import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kfcapp/service/fire_service.dart';

class UserBagService {
  static List bag = [];
  static Future writeToDb() async {
    int nums = 0;
    try {
      await FireService.store
          .collection('user')
          .doc("${FireService.auth.currentUser!.phoneNumber}")
          .set(
        {"bag": bag},
        SetOptions(merge: true),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future writeToList() async {
    var data = await FireService.store
        .doc("/user/${FireService.auth.currentUser!.phoneNumber}")
        .get();
    bag = data["bag"];
  }
}

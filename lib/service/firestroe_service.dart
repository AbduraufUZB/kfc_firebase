
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:kfcapp/service/fire_service.dart';

class FirestoreService {
  static late String ism;
  static late String photo;

  static Future readFromDb() async {
    var data = await FireService.store
        .doc("/user/${FireService.auth.currentUser!.phoneNumber}")
        .get();
    print(data["username"]);
    ism = data["username"];
    photo = data["user_photo"];
    return true;
  }

  static Future writeToDb({required String username}) async {
    try {
      await FireService.store
          .collection('user')
          .doc("${FireService.auth.currentUser!.phoneNumber}")
          .set({
        "username": username,
        "phone_number": "${FireService.auth.currentUser!.phoneNumber}",
        "user_photo":
            "https://www.kindpng.com/picc/m/130-1300217_user-icon-member-icon-png-transparent-png.png",
        "added_time": FieldValue.serverTimestamp(),
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future writeAdminToDb(
      {required String name,
      required String photo,
      required String price}) async {
    try {
      await FireService.store
          .collection('kfc')
          .doc("${FireService.auth.currentUser!.phoneNumber}")
          .set({
        "food_name": name,
        "photo": photo,
        "price": price,
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

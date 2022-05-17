import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kfcapp/service/fire_service.dart';

class UserAddImage {
  static String path = '';
  static List foods = [];

  // Rasmni Firebasega yuklab berish
  static Future addIMGtoDB(XFile image) async {
    try {
      var data = await FireService.storage
          .ref()
          .child('pictures')
          .child('avatars')
          .child(DateTime.now().microsecond.toString())
          .putFile(File(image.path));
      path = await data.ref.getDownloadURL();
    } catch (e) {
      debugPrint('STORAGE ERROR >>>> $e');
    }
  }

  static Future addIMGtoDBSC(XFile image) async {
    try {
      var data = await FireService.storage
          .ref()
          .child('pictures')
          .child('foods')
          .child(DateTime.now().microsecond.toString())
          .putFile(File(image.path));
      path = await data.ref.getDownloadURL();
    } catch (e) {
      debugPrint('STORAGE ERROR >>>> $e');
    }
  }

  //Rasmni firebasega linki bilan saqlash
  static Future<bool> writeToDb() async {
    try {
      await FireService.store
          .collection('user')
          .doc(FireService.auth.currentUser!.phoneNumber.toString())
          .set(
        {
          "user_photo": path,
        },
        SetOptions(merge: true),
      );
      return true;
    } catch (e) {
      debugPrint('ERROR IS HERE >>>>>> ${e.toString()}');
      return false;
    }
  }

  static Future<bool> writeToDbSC() async {
    try {
      await FireService.store.collection('foods').doc("category").set(
        {"category": foods},
        SetOptions(merge: true),
      );
      return true;
    } catch (e) {
      debugPrint('ERROR IS HERE >>>>>> ${e.toString()}');
      return false;
    }
  }

  //Listga firebasedan kelayotgan listni tenglashtirish
  static Future getList() async {
    var data = await FireService.store.doc("/foods/category").get();
    foods = data["category"];
  }
}

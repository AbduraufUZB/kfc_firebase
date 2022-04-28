import 'package:flutter/material.dart';

class ShowAlertDialogWidget{
  static final ShowAlertDialogWidget _instance = ShowAlertDialogWidget._init();
  static ShowAlertDialogWidget get instance => _instance;
  ShowAlertDialogWidget._init();
  showAlertDialog(BuildContext context) {
    const AlertDialog alert = AlertDialog(
      backgroundColor: Colors.transparent,
      content: Center(child: CircularProgressIndicator.adaptive()),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
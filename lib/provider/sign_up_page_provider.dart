import 'package:flutter/material.dart';
import 'package:kfcapp/core/constants/color_const.dart';
import 'package:kfcapp/service/firebase_auth_service.dart';
import 'package:kfcapp/widgets/my_messenger.dart';

class SignUpPageProvider extends ChangeNotifier {
  onPressedNext(String name, String number, BuildContext context) async {
    if (name.length > 3) {
      if (number.length == 9) {
        await FirebaseAuthService.loginWithPhone("+998$number");
        Navigator.pushNamed(context, "/sms", arguments: name);
      } else {
        MyMessenger.messenger(context, "Phone number error!",
            ColorConst.kPrimaryColor);
      }
    } else {
      MyMessenger.messenger(
          context,
          "The length of the name must be greater than 3 letters in order to be registered!",
          ColorConst.kPrimaryColor);
    }
    notifyListeners();
  }
}

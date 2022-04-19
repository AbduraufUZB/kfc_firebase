import 'package:flutter/material.dart';
import 'package:kfcapp/core/constants/radius_const.dart';

class SignUpWidgets {
  static nameFormField(TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        labelText: "User Name",
        prefixIcon: Icon(Icons.person),
        border: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(RadiusConst.kMediumRadius))),
      ),
    );
  }

  static phoneNumberFormField(TextEditingController controller) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      decoration: const InputDecoration(
        labelText: "Telephone Number",
        prefixText: "+998 ",
        prefixIcon: Icon(Icons.phone_outlined),
        border: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(RadiusConst.kMediumRadius))),
      ),
    );
  }
}

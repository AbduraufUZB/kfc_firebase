import 'package:flutter/material.dart';
import 'package:kfcapp/core/constants/color_const.dart';
import 'package:kfcapp/core/constants/font_const.dart';
import 'package:kfcapp/core/constants/radius_const.dart';

class MyContainer extends StatelessWidget {
  late String text;
  Color? color;
  late String routeName;
  MyContainer(
      {Key? key, required this.text, this.color, required this.routeName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(RadiusConst.kMediumRadius),
            color: color ?? ColorConst.kPrimaryColor),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: ColorConst.kButtonColor, fontSize: FontConst.kLargeFont),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kfcapp/core/constants/color_const.dart';
import 'package:kfcapp/core/constants/radius_const.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          color: ColorConst.kButtonColor,
          borderRadius: BorderRadius.circular(RadiusConst.kMediumRadius)
        ),
      ),
    );
  }
}
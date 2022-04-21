import 'package:flutter/material.dart';
import 'package:kfcapp/core/constants/color_const.dart';
import 'package:kfcapp/core/constants/pm_const.dart';
import 'package:kfcapp/core/constants/radius_const.dart';

class ListViewItem extends StatelessWidget {
  int index;
  ListViewItem({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: PMConst.kMediumPM,
      height: 210,
      width: 150,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 65,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.8),
                    spreadRadius: 8,
                    blurRadius: 15,
                    offset: Offset(0, 7),
                  ),
                ],
                color: ColorConst.kPrimaryColor,
                borderRadius: BorderRadius.circular(RadiusConst.kMediumRadius)),
            child: const Center(
              child: Text(
                "Salom",
                style: TextStyle(color: ColorConst.kButtonColor),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      NetworkImage("https://source.unsplash.com/random/$index"),
                      fit: BoxFit.cover
                ),
                color: ColorConst.kButtonColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.8),
                    spreadRadius: 8,
                    blurRadius: 15,
                    offset: Offset(0, 7),
                  ),
                ],
                borderRadius: BorderRadius.circular(RadiusConst.kMediumRadius)),
            child: const Center(),
          ),
        ],
      ),
    );
  }
}

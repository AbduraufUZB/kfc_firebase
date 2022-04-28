import 'package:flutter/material.dart';
import 'package:kfcapp/core/constants/color_const.dart';
import 'package:kfcapp/core/constants/font_const.dart';
import 'package:kfcapp/core/constants/pm_const.dart';
import 'package:kfcapp/core/constants/radius_const.dart';
import 'package:kfcapp/core/constants/weight_const.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/add_category");
                    },
                    child: Container(
                      margin: PMConst.kExtraLargePM,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(RadiusConst.kMediumRadius),
                          color: ColorConst.kPrimaryColor),
                      child: const Center(
                          child: Text(
                        "ADD CATEGORY",
                        style: TextStyle(
                            color: ColorConst.kButtonColor,
                            fontSize: FontConst.kExtraLargeFont,
                            fontWeight: WeightConst.kBoldFont),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 7,
            child: ListView.builder(
              itemCount: 0,
              itemBuilder: (ctx, i) {
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}

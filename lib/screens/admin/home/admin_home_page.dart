import 'package:flutter/material.dart';
import 'package:kfcapp/core/constants/color_const.dart';
import 'package:kfcapp/core/constants/font_const.dart';
import 'package:kfcapp/core/constants/pm_const.dart';
import 'package:kfcapp/core/constants/radius_const.dart';
import 'package:kfcapp/service/firestorage_service.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: UserAddImage.foods.length,
        itemBuilder: (ctx, i) {
          return Container(
            margin: PMConst.kExtraLargePM,
            height: MediaQuery.of(context).size.height * 0.4,
            child: Column(
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    margin: PMConst.kExtraSmallPM,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          RadiusConst.kMediumRadius),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          UserAddImage.foods[i]["category_photo"],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: PMConst.kExtraSmallPM,
                    decoration: BoxDecoration(
                      color: ColorConst.kSuccessfulColor,
                      borderRadius: BorderRadius.circular(
                          RadiusConst.kMediumRadius),
                    ),
                    child: Center(
                      child: Text(
                        UserAddImage.foods[i]["category_name"],
                        style: const TextStyle(
                          color: ColorConst.kButtonColor,
                          fontSize: FontConst.kLargeFont,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

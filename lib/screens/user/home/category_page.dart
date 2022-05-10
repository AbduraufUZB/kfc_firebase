import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kfcapp/core/constants/color_const.dart';
import 'package:kfcapp/core/constants/font_const.dart';
import 'package:kfcapp/core/constants/pm_const.dart';
import 'package:kfcapp/core/constants/radius_const.dart';
import 'package:kfcapp/core/constants/weight_const.dart';
import 'package:kfcapp/service/firestorage_service.dart';
import 'package:kfcapp/core/extensions/context_mq_extension.dart';

class CategoryPage extends StatelessWidget {
  int index;
  CategoryPage({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (ctx, i) {
          return Container(
            margin: PMConst.kMediumPM,
            padding: PMConst.kMediumPM,
            height: context.mqheight * 0.15,
            width: context.mqwidth * 0.8,
            decoration: BoxDecoration(
                color: ColorConst.kPrimaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(25)),
            child: Row(
              children: [
                Container(
                  margin: PMConst.kMediumPM,
                  height: context.mqheight * 0.1,
                  width: context.mqheight * 0.1,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(RadiusConst.kMediumRadius),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                        UserAddImage.foods[index]["foods"][i]["food_photo"],
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      UserAddImage.foods[index]["foods"][i]["food_name"],
                      style: const TextStyle(
                          color: ColorConst.kPrimaryColor,
                          fontWeight: WeightConst.kBoldFont,
                          fontSize: FontConst.kMediumFont),
                    ),
                    SizedBox(
                      height: context.mqheight * 0.01,
                    ),
                    Text(
                      UserAddImage.foods[index]["foods"][i]["food_price"] +
                          " so'm",
                      style: TextStyle(
                          color: ColorConst.kSuccessfulColor.withGreen(150)),
                    )
                  ],
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/info", arguments: [index, i]);
                          },
                          icon: const Icon(Icons.shopping_cart_outlined))
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: UserAddImage.foods[index]["foods"].length,
      ),
    );
  }
}

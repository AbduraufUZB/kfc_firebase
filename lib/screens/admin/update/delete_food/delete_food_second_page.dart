import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kfcapp/core/constants/font_const.dart';
import 'package:kfcapp/core/constants/pm_const.dart';
import 'package:kfcapp/core/constants/radius_const.dart';
import 'package:kfcapp/service/firestorage_service.dart';

class DeleteFoodSecondPage extends StatelessWidget {
  int index;
  DeleteFoodSecondPage({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: UserAddImage.foods[index]["foods"].length,
        itemBuilder: (ctx, i) {
          return Container(
            margin: PMConst.kMediumPM,
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.05),
                borderRadius: BorderRadius.circular(RadiusConst.kLargeRadius)),
            child: Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.height * 0.1,
                  margin: PMConst.kMediumPM,
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
                Text(
                  UserAddImage.foods[index]["foods"][i]["food_name"],
                  style: const TextStyle(fontSize: FontConst.kMediumFont + 3),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () async {
                          (UserAddImage.foods[index]["foods"] as List)
                              .removeAt(i);
                          await UserAddImage.writeToDbSC();
                          Navigator.pushNamed(context, "/admin",);
                        },
                        icon: const Icon(Icons.delete_outline),
                      ),
                    ],
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

import 'package:flutter/material.dart';
import 'package:kfcapp/core/constants/pm_const.dart';
import 'package:kfcapp/core/constants/radius_const.dart';
import 'package:kfcapp/service/user_bag_service.dart';
import 'package:kfcapp/core/extensions/context_mq_extension.dart';
class BagPage extends StatelessWidget {
  const BagPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: UserBagService.bag.length,
        itemBuilder: (ctx, i) {
          return Container(
            margin: PMConst.kLargePM,
            height: context.mqheight*0.2,
            width: context.mqwidth*0.8,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(RadiusConst.kMediumRadius)
            ),
            child: Row(
              children: [
                Text(UserBagService.bag[i]["food_name"])
              ],
            ),
          );
        },
      ),
    );
  }
}

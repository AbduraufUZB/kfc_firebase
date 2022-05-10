import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kfcapp/core/constants/color_const.dart';
import 'package:kfcapp/core/constants/font_const.dart';
import 'package:kfcapp/core/constants/pm_const.dart';
import 'package:kfcapp/core/constants/radius_const.dart';
import 'package:kfcapp/core/constants/weight_const.dart';
import 'package:kfcapp/service/firestorage_service.dart';
import 'package:kfcapp/core/extensions/context_mq_extension.dart';
import 'package:kfcapp/service/user_bag_service.dart';
import 'package:kfcapp/widgets/my_container.dart';

class CategoryInfoPage extends StatelessWidget {
  List son;
  CategoryInfoPage({Key? key, required this.son}) : super(key: key);
  var ab;
  @override
  Widget build(BuildContext context) {
    ab = UserAddImage.foods[son[0]]["foods"][son[1]];
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(RadiusConst.kMediumRadius),
                  bottomRight: Radius.circular(RadiusConst.kMediumRadius),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(
                    ab["food_photo"],
                  ),
                ),
              ),
              child: Container(
                alignment: const Alignment(-0.9, -0.8),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 35,
                    )),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: PMConst.kMediumPM,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(ab["food_name"],
                      style: const TextStyle(fontSize: FontConst.kLargeFont)),
                  const SizedBox(height: 10),
                  Text(
                    "Price",
                    style: TextStyle(color: Colors.black.withOpacity(0.8)),
                  ),
                  Text(ab["food_price"],
                      style: const TextStyle(
                          color: ColorConst.kSuccessfulColor,
                          fontSize: FontConst.kLargeFont,
                          fontWeight: WeightConst.kBoldFont)),
                  const SizedBox(height: 10),
                  Text(
                    "Comment",
                    style: TextStyle(color: Colors.black.withOpacity(0.8)),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: context.mqheight * 0.15,
                    width: context.mqwidth * 0.9,
                    child: Text(
                      ab["food_comment"],
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: FontConst.kLargeFont),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Center(
                            child: myCont(context, "/tabbar", "ADD TO BAG")),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget myCont(BuildContext context, routeName, text) {
    return InkWell(
      onTap: () async{
        UserBagService.bag.add(ab);
        await UserBagService.writeToDb();
        Navigator.pushNamed(context, routeName);
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(RadiusConst.kMediumRadius),
            color: ColorConst.kPrimaryColor),
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

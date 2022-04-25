import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:kfcapp/core/constants/color_const.dart';
import 'package:kfcapp/core/constants/font_const.dart';
import 'package:kfcapp/core/constants/pm_const.dart';
import 'package:kfcapp/core/constants/radius_const.dart';
import 'package:kfcapp/core/constants/weight_const.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background_img.jpg"),
              fit: BoxFit.cover),
        ),
        child: Container(
          width: double.infinity,
          margin: PMConst.kLargePM,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "KFC",
                style: TextStyle(
                    color: ColorConst.kButtonColor,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    fontSize: FontConst.kExtraLargeFont + 10),
              ),
              Text(
                "Online Delivery",
                style: TextStyle(
                    color: ColorConst.kButtonSecondaryColor,
                    fontWeight: WeightConst.kLargeFont,
                    fontStyle: FontStyle.italic,
                    fontSize: FontConst.kMediumFont),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: double.infinity,
                  child: Swiper(
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(RadiusConst.kMediumRadius),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://source.unsplash.com/random/$index"),
                              fit: BoxFit.cover),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 25),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.25,
                              height: MediaQuery.of(context).size.height * 0.05,
                              decoration: BoxDecoration(
                                  color: ColorConst.kPrimaryColor,
                                  borderRadius: BorderRadius.circular(
                                      RadiusConst.kMediumRadius)),
                              child: const Center(
                                  child: Text(
                                "Price",
                                style: TextStyle(
                                    color: ColorConst.kButtonColor,
                                    fontWeight: WeightConst.kMediumFont,
                                    fontSize: FontConst.kMediumFont),
                              )),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: ColorConst.kPrimaryColor,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(
                                          RadiusConst.kMediumRadius,
                                        ),
                                        bottomRight: Radius.circular(
                                          RadiusConst.kMediumRadius,
                                        ),
                                      ),
                                    ),
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    autoplay: true,
                    itemCount: 3,
                    pagination: const SwiperPagination(),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: RadiusConst.kExtraLargeRadius,
                    backgroundColor: ColorConst.kPrimaryColor.withOpacity(0.9),
                    child: const Center(
                        child: Icon(
                      Icons.pin_drop_outlined,
                      size: FontConst.kExtraLargeFont,
                    )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Your delivery address",
                          style: TextStyle(color: ColorConst.kPrimaryColor),
                        ),
                        Text(
                          "ADDDDDRESSSSSS",
                        ),
                      ],
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.edit))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

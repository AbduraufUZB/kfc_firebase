import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:kfcapp/core/constants/color_const.dart';
import 'package:kfcapp/core/constants/font_const.dart';
import 'package:kfcapp/core/constants/pm_const.dart';
import 'package:kfcapp/core/constants/radius_const.dart';
import 'package:kfcapp/core/constants/weight_const.dart';
import 'package:kfcapp/service/firestorage_service.dart';
import 'package:kfcapp/widgets/address_widget.dart';

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
              const SizedBox(height: 30),
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.07),
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
                              image: CachedNetworkImageProvider(
                                  UserAddImage.foods[index]["category_photo"]),
                              fit: BoxFit.cover),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 25),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: MediaQuery.of(context).size.height * 0.06,
                              decoration: BoxDecoration(
                                  color:
                                      ColorConst.kPrimaryColor.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(
                                      RadiusConst.kMediumRadius)),
                              child: Center(
                                  child: Text(
                                UserAddImage.foods[index]["category_name"],
                                style: const TextStyle(
                                    color: ColorConst.kButtonColor,
                                    fontWeight: WeightConst.kLargeFont,
                                    fontSize: FontConst.kMediumFont),
                              )),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, "/category");
                                    },
                                    child: Container(
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
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: const [
                                          Icon(Icons.add,
                                              color: ColorConst.kButtonColor),
                                          Text(
                                            "Add to bag",
                                            style: TextStyle(
                                                color: ColorConst.kButtonColor,
                                                fontSize:
                                                    FontConst.kMediumFont),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    autoplay: true,
                    itemCount: UserAddImage.foods.length,
                    pagination: const SwiperPagination(),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              const AddressWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

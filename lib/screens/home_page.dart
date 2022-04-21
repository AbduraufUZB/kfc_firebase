import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:kfcapp/core/constants/color_const.dart';
import 'package:kfcapp/core/constants/font_const.dart';
import 'package:kfcapp/core/constants/pm_const.dart';
import 'package:kfcapp/core/constants/radius_const.dart';
import 'package:kfcapp/core/constants/weight_const.dart';
import 'package:kfcapp/widgets/list_view_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: PMConst.kLargePM,
          child: Column(
            children: [
              SizedBox(
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
                    );
                  },
                  autoplay: true,
                  itemCount: 3,
                  pagination: const SwiperPagination(),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "CATEGORIES",
                style: TextStyle(
                  color: ColorConst.kPrimaryColor.withOpacity(0.7),
                  fontSize: FontConst.kLargeFont,
                  fontWeight: WeightConst.kMediumFont
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 265,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (ctx, i) {
                    return ListViewItem(
                      index: i,
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "NEWS",
                style: TextStyle(
                  color: ColorConst.kPrimaryColor.withOpacity(0.7),
                  fontSize: FontConst.kLargeFont,
                  fontWeight: WeightConst.kMediumFont
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 265,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (ctx, i) {
                    return ListViewItem(
                      index: i,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

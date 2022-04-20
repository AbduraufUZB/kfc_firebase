import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:kfcapp/core/constants/pm_const.dart';
import 'package:kfcapp/core/constants/radius_const.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: PMConst.kMediumPM,
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
                          fit: BoxFit.cover
                    ),
                  ),
                );
              },
              autoplay: true,
              itemCount: 3,
              pagination: const SwiperPagination(),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

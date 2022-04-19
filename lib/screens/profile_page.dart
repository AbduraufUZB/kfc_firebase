import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kfcapp/core/constants/color_const.dart';
import 'package:kfcapp/core/constants/font_const.dart';
import 'package:kfcapp/core/constants/radius_const.dart';
import 'package:kfcapp/core/constants/weight_const.dart';
import 'package:kfcapp/service/fire_service.dart';
import 'package:kfcapp/service/firebase_auth_service.dart';
class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: CachedNetworkImageProvider("https://www.kindpng.com/picc/m/130-1300217_user-icon-member-icon-png-transparent-png.png"),
                radius: RadiusConst.kExtraLargeRadius+30,
              ),
              const SizedBox(height: 20),
              myContainer("name", context),
              const SizedBox(height: 20),
              myContainer(
                  "${FireService.auth.currentUser!.phoneNumber}", context)
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await FirebaseAuthService.logAut(context);
        },
        child: const Icon(Icons.exit_to_app_outlined),
        backgroundColor: ColorConst.kPrimaryColor,
      ),
    );
  }

  Widget myContainer(String text, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.070,
      decoration: BoxDecoration(
          color: ColorConst.kPrimaryColor.withOpacity(0.7),
          borderRadius: const BorderRadius.all(
              Radius.circular(RadiusConst.kMediumRadius))),
      child: Center(
          child: Text(
        text,
        style: const TextStyle(
            color: ColorConst.kButtonColor,
            fontSize: FontConst.kLargeFont,
            fontWeight: WeightConst.kMediumFont),
      )),
    );
  }
}

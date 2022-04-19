import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kfcapp/core/constants/color_const.dart';
import 'package:kfcapp/core/constants/pm_const.dart';
import 'package:kfcapp/core/constants/weight_const.dart';
import 'package:kfcapp/provider/sign_up_page_provider.dart';
import 'package:kfcapp/widgets/sign_up_widgets.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 1, child: myRow),
          Expanded(
            flex: 8,
            child: Padding(
              padding: PMConst.kExtraLargePM,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SignUpWidgets.nameFormField(nameController),
                        SignUpWidgets.phoneNumberFormField(
                            phoneNumberController),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<SignUpPageProvider>().onPressedNext(
                          nameController.text,
                          phoneNumberController.text,
                          context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: ColorConst.kPrimaryColor,
                    ),
                    child: const Center(
                      child: Padding(
                        padding: PMConst.kLargePM,
                        child: Text(
                          "Next ->",
                          style: TextStyle(
                              color: ColorConst.kButtonColor,
                              fontWeight: WeightConst.kMediumFont),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: PMConst.kMediumPM,
                      child: Container(
                        alignment: Alignment.center,
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://upload.wikimedia.org/wikipedia/sco/thumb/b/bf/KFC_logo.svg/1200px-KFC_logo.svg.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(flex: 1, child: myRow),
        ],
      ),
    );
  }

  Widget get myRow => Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [listItem, listItem, listItem]);
  Widget get listItem => Container(
        height: 75,
        width: 50,
        color: ColorConst.kPrimaryColor,
      );
}

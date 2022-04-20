import 'package:flutter/material.dart';
import 'package:kfcapp/core/constants/color_const.dart';
import 'package:kfcapp/core/constants/font_const.dart';
import 'package:kfcapp/core/constants/pm_const.dart';
import 'package:kfcapp/core/constants/radius_const.dart';
import 'package:kfcapp/core/constants/weight_const.dart';
import 'package:kfcapp/provider/set_state_provider.dart';
import 'package:kfcapp/service/fire_service.dart';
import 'package:kfcapp/service/firebase_auth_service.dart';
import 'package:kfcapp/service/firestroe_service.dart';
import 'package:kfcapp/widgets/my_messenger.dart';
import 'package:provider/provider.dart';

class SignUpSmsPage extends StatelessWidget {
  String name;
  SignUpSmsPage({Key? key, required this.name}) : super(key: key);
  TextEditingController smsController = TextEditingController();
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
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          context.read<SetStateProvider>().mySetState();
                        },
                        icon: const Icon(Icons.chevron_left)),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    TextFormField(
                      controller: smsController,
                      decoration: const InputDecoration(
                        labelText: "Code",
                        prefixText: "Code: ",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(RadiusConst.kMediumRadius),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: ColorConst.kPrimaryColor,
                      ),
                      onPressed: () async {
                        if (await FirebaseAuthService.verifyOTP(
                            smsController.text)) {
                          MyMessenger.messenger(
                              context,
                              "Sign up is SUCCESSFUL",
                              ColorConst.kSuccessfulColor);
                          await FirestoreService.writeToDb(username: name);

                          Navigator.pushNamedAndRemoveUntil(
                              context, "/tabbar", (route) => false);
                        } else {
                          MyMessenger.messenger(context, "Error SMS code!",
                              ColorConst.kPrimaryColor);
                        }
                        context.read<SetStateProvider>().mySetState();
                      },
                      child: const Center(
                        child: Text(
                          "Next",
                          style: TextStyle(
                              color: ColorConst.kButtonColor,
                              fontWeight: WeightConst.kLargeFont,
                              fontSize: FontConst.kMediumFont),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
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

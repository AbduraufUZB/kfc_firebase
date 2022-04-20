import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kfcapp/core/constants/color_const.dart';
import 'package:kfcapp/core/constants/font_const.dart';
import 'package:kfcapp/core/constants/pm_const.dart';
import 'package:kfcapp/core/constants/radius_const.dart';
import 'package:kfcapp/core/constants/weight_const.dart';
import 'package:kfcapp/provider/set_state_provider.dart';
import 'package:kfcapp/service/fire_service.dart';
import 'package:kfcapp/service/firebase_auth_service.dart';
import 'package:kfcapp/service/firestorage_service.dart';
import 'package:kfcapp/service/firestroe_service.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  XFile? image;
  final _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Future.wait([FirestoreService.readFromDb()]),
        builder: ((context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (snapshot.hasError) {
            return const Center(child: Text("No Internet"));
          } else {
            return SizedBox(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        if("${FireService.auth.currentUser!.phoneNumber}" == "+998123456789"){
                          Navigator.pushNamed(context, "/admin");
                        }
                      },
                      child: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                            FirestoreService.photo.toString()),
                        radius: RadiusConst.kExtraLargeRadius + 30,
                      ),
                    ),
                    const SizedBox(height: 20),
                    myContainer(FirestoreService.ism.toString(), context),
                    const SizedBox(height: 20),
                    myContainer("${FireService.auth.currentUser!.phoneNumber}",
                        context),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: (() {
                        showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                  builder: (context, setState) {
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  margin: PMConst.kMediumPM,
                                  decoration: BoxDecoration(
                                    color: ColorConst.kButtonColor,
                                    borderRadius: BorderRadius.circular(
                                        RadiusConst.kMediumRadius),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () async {
                                          image = await _picker.pickImage(
                                              source: ImageSource.gallery);
                                          UserAddImage.addIMGtoDB(image!);
                                          UserAddImage.writeToDb();
                                          setState(() {});
                                        },
                                        child: const Text("Upload Image"),
                                      ),
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: image != null
                                              ? Image.file(
                                                  File(image!.path),
                                                )
                                              : const Text(
                                                  'Image not uploaded yet!'),
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          UserAddImage.writeToDb();
                                        },
                                        child: const Text("Set Image"),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: const Icon(
                                                  Icons.chevron_left_outlined))
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              });
                            });
                        context.read<SetStateProvider>().mySetState();
                      }),
                      child: myContainer("Upload Image", context),
                    ),
                  ],
                ),
              ),
            );
          }
        }),
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

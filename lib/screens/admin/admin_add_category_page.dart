import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kfcapp/core/constants/color_const.dart';
import 'package:kfcapp/core/constants/font_const.dart';
import 'package:kfcapp/core/constants/pm_const.dart';
import 'package:kfcapp/core/constants/radius_const.dart';
import 'package:kfcapp/core/constants/weight_const.dart';
import 'package:kfcapp/service/firestorage_service.dart';
import 'package:kfcapp/widgets/my_messenger.dart';
import 'package:kfcapp/widgets/showalertdialog_widget.dart';

class AdminAddCategoryPage extends StatefulWidget {
  AdminAddCategoryPage({Key? key}) : super(key: key);

  @override
  State<AdminAddCategoryPage> createState() => _AdminAddCategoryPageState();
}

class _AdminAddCategoryPageState extends State<AdminAddCategoryPage> {
  XFile? image;

  final _picker = ImagePicker();
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  InkWell(
                    onTap: () async {
                      ShowAlertDialogWidget.instance.showAlertDialog(context);
                      image =
                          await _picker.pickImage(source: ImageSource.gallery);
                      await UserAddImage.addIMGtoDBSC(image!);
                      Navigator.pop(context);
                      setState(() {});
                    },
                    child: Container(
                      margin: PMConst.kMediumPM,
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: const Center(
                        child: Text(
                          "Upload Image",
                          style: TextStyle(
                            color: ColorConst.kButtonColor,
                            fontSize: FontConst.kExtraLargeFont,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: ColorConst.kPrimaryColor,
                          borderRadius: BorderRadius.circular(
                              RadiusConst.kExtraLargeRadius)),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: image != null
                          ? Image.file(
                              File(image!.path),
                              fit: BoxFit.cover,
                            )
                          : const Text('Image not uploaded yet!'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: PMConst.kExtraLargePM,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _textEditingController,
                      decoration: InputDecoration(
                          labelText: "Category name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  RadiusConst.kMediumRadius)),
                          prefixIcon: const Icon(Icons.fastfood_outlined)),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () async {
                        if (_textEditingController.text.length < 5) {
                          MyMessenger.messenger(
                              context,
                              "Please fill in first!",
                              ColorConst.kPrimaryColor);
                        } else {
                          ShowAlertDialogWidget.instance
                              .showAlertDialog(context);
                          UserAddImage.foods.add(
                            {
                              "category_name": _textEditingController.text,
                              "category_photo": UserAddImage.path,
                              "foods": []
                            },
                          );
                          await UserAddImage.writeToDbSC();
                          MyMessenger.messenger(
                              context,
                              "Category successfully added!",
                              ColorConst.kSuccessfulColor);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        }
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                RadiusConst.kExtraLargeRadius),
                            color: ColorConst.kPrimaryColor),
                        child: const Center(
                          child: Text(
                            "Save category",
                            style: TextStyle(
                                color: ColorConst.kButtonColor,
                                fontSize: FontConst.kLargeFont),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

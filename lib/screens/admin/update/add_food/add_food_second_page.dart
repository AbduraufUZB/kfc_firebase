import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kfcapp/core/constants/color_const.dart';
import 'package:kfcapp/core/constants/font_const.dart';
import 'package:kfcapp/core/constants/pm_const.dart';
import 'package:kfcapp/core/constants/radius_const.dart';
import 'package:kfcapp/service/firestorage_service.dart';
import 'package:kfcapp/widgets/my_messenger.dart';
import 'package:kfcapp/widgets/showalertdialog_widget.dart';

class AddFoodScPage extends StatefulWidget {
  int index_current;
  AddFoodScPage({Key? key, required this.index_current}) : super(key: key);

  @override
  State<AddFoodScPage> createState() => _AddFoodScPageState();
}

class _AddFoodScPageState extends State<AddFoodScPage> {
  XFile? image;

  final _picker = ImagePicker();

  TextEditingController _textEditingController = TextEditingController();

  TextEditingController _textEditingController2 = TextEditingController();

  TextEditingController _textEditingController3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  InkWell(
                    onTap: () async {
                      ShowAlertDialogWidget.instance.showAlertDialog(context);
                      image =
                          await _picker.pickImage(source: ImageSource.gallery);
                      await UserAddImage.addIMGtoDBSC(image!);
                      Navigator.pop(context);
                      setState(() {
                        
                      });
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
                          labelText: "Food name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  RadiusConst.kMediumRadius)),
                          prefixIcon: const Icon(Icons.fastfood_outlined)),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _textEditingController2,
                      decoration: InputDecoration(
                          labelText: "Price",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  RadiusConst.kMediumRadius)),
                          prefixIcon: const Icon(Icons.attach_money)),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _textEditingController3,
                      decoration: InputDecoration(
                          labelText: "Comment",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  RadiusConst.kMediumRadius)),
                          prefixIcon: const Icon(Icons.comment_outlined)),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () async {
                        if (_textEditingController.text.length < 3 ||
                            _textEditingController2.text.length < 1) {
                          MyMessenger.messenger(
                              context,
                              "Please fill in first!",
                              ColorConst.kPrimaryColor);
                        } else {
                          ShowAlertDialogWidget.instance
                              .showAlertDialog(context);
                          (UserAddImage.foods[widget.index_current]["foods"] as List)
                              .add({
                            "food_photo": UserAddImage.path,
                            "food_name": _textEditingController.text,
                            "food_price": _textEditingController2.text,
                            "food_comment": _textEditingController3.text
                          });
                          await UserAddImage.writeToDbSC();
                          MyMessenger.messenger(
                              context,
                              "Food successfully added!",
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

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kfcapp/core/constants/font_const.dart';
import 'package:kfcapp/core/constants/pm_const.dart';
import 'package:kfcapp/core/constants/radius_const.dart';
import 'package:kfcapp/provider/remove_category_provider.dart';
import 'package:kfcapp/service/firestorage_service.dart';
import 'package:provider/provider.dart';

class DeleteCategoryPage extends StatefulWidget {
  const DeleteCategoryPage({Key? key}) : super(key: key);

  @override
  State<DeleteCategoryPage> createState() => _DeleteCategoryPageState();
}

class _DeleteCategoryPageState extends State<DeleteCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: UserAddImage.foods.length,
        itemBuilder: ((context, index) {
          return listViewBuilderItem(index, context);
        }),
      ),
    );
  }

  Widget listViewBuilderItem(int index, BuildContext context) {
    return Container(
      margin: PMConst.kMediumPM,
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.05),
          borderRadius: BorderRadius.circular(RadiusConst.kLargeRadius)),
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.height * 0.1,
            margin: PMConst.kMediumPM,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(RadiusConst.kMediumRadius),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  UserAddImage.foods[index]["category_photo"],
                ),
              ),
            ),
          ),
          Text(
            UserAddImage.foods[index]["category_name"],
            style: const TextStyle(fontSize: FontConst.kMediumFont + 3),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () async {
                    await context
                        .read<RemoveCategoryProvider>()
                        .removeCategoryProvider(index);
                  },
                  icon: const Icon(Icons.delete_outline),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

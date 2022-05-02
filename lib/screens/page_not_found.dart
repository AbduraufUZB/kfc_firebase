import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kfcapp/core/constants/radius_const.dart';

class PageNotFoundPage extends StatelessWidget {
  const PageNotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(RadiusConst.kMediumRadius),
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(
                      "https://img-16.ccm2.net/_SqzzXVDSG50FWb_UBrCl3XwV78=/440x/1685e17045e747a899925aa16189c7c6/ccm-encyclopedia/99776312_s.jpg"))),
        ),
      ),
    );
  }
}

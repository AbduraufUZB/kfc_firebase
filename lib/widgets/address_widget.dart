import 'package:flutter/material.dart';
import 'package:kfcapp/core/constants/color_const.dart';
import 'package:kfcapp/core/constants/font_const.dart';
import 'package:kfcapp/core/constants/radius_const.dart';
import 'package:kfcapp/core/constants/weight_const.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: RadiusConst.kExtraLargeRadius,
          backgroundColor: ColorConst.kPrimaryColor.withOpacity(0.9),
          child: const Center(
              child: Icon(
            Icons.pin_drop_outlined,
            size: FontConst.kExtraLargeFont,
          )),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Your delivery address",
                style: TextStyle(
                    color: ColorConst.kPrimaryColor,
                    fontSize: FontConst.kMediumFont,
                    fontWeight: WeightConst.kMediumFont),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.6,
                child: const Text(
                  "ADDDDDDDDDRRRRRRRREEEEEESSssssssssssssssS",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: FontConst.kSmallFont,
                    fontWeight: WeightConst.kMediumFont,
                  ),
                ),
              ),
            ],
          ),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.edit))
      ],
    );
  }
}

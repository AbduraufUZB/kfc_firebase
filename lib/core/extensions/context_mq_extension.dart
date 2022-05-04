import 'package:flutter/material.dart';

extension KFCContext on BuildContext {

  MediaQueryData get mq => MediaQuery.of(this);

  //MediaQuery height
  double get mqheight => mq.size.height;
  //MediaQuery width
  double get mqwidth => mq.size.width;
}

import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:temp_task2/core/functions/get_device_type.dart';

import '../../theme/themes.dart';
import 'splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Orientation deviceOrientation =
        getScreenOrientation(MediaQuery.of(context));
    return Scaffold(
      // backgroundColor: Themes.BackgroundColor,
      body: deviceOrientation == Orientation.portrait
          ? Container(
              decoration:
                  BoxDecoration(gradient: Themes.backgroundColorGradient),
              child: Center(
                child: DropShadowImage(
                  image: Image.asset(
                    'assets/images/image.png',
                    height: 47.h,
                    width: 100.w,
                  ),
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ),
            )
          : Container(
              decoration:
                  BoxDecoration(gradient: Themes.backgroundColorGradient),
              child: Center(
                child: DropShadowImage(
                  image: Image.asset(
                    'assets/images/image.png',
                    height: 100.w,
                    width: 47.h,
                  ),
                  blurRadius: 4,
                  offset: const Offset(4, 0),
                ),
              ),
            ),
    );
  }
}

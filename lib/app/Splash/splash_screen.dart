import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:temp_task2/app/LogIn/login_screen.dart';
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
                  child: AnimatedSplashScreen(
                backgroundColor: Colors.transparent.withOpacity(0),
                animationDuration: const Duration(milliseconds: 2300),
                splashIconSize: 100.h,
                splashTransition: SplashTransition.rotationTransition,
                splash: DropShadowImage(
                  image: Image.asset(
                    'assets/images/image.png',
                    height: 50.h,
                    width: 100.w,
                    fit: BoxFit.cover,
                  ),
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
                nextScreen: const LogInScreen(),
              )))
          : Container(
              decoration:
                  BoxDecoration(gradient: Themes.backgroundColorGradient),
              child: Center(
                  child: AnimatedSplashScreen(
                backgroundColor: Colors.transparent.withOpacity(0),
                animationDuration: const Duration(milliseconds: 2300),
                splashIconSize: 100.h,
                splashTransition: SplashTransition.rotationTransition,
                splash: DropShadowImage(
                  image: Image.asset(
                    'assets/images/image.png',
                    height: 50.h,
                    width: 50.h,
                    fit: BoxFit.cover,
                  ),
                  blurRadius: 4,
                  offset: const Offset(4, 0),
                ),
                nextScreen: const LogInScreen(),
              )),
            ),
    );
  }
}

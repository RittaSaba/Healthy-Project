import 'package:get/get.dart';

import '../app/Splash/splash_controller.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SplashController());
  }

}
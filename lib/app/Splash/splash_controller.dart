
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../routes/app_routes.dart';

class SplashController extends GetxController {
  final getStorage = GetStorage();

  @override
  Future<void> onReady() async {
    super.onReady();

    Future.delayed(
        const Duration(
          seconds: 3,
        ), () {
      Get.offAllNamed(
        Routes.LOGIN,
      );
    });
  }
/*
@override
  void onReady() {
    super.onReady();

    if (getStorage.read("id") != null) {
      Future.delayed(Duration(microseconds: 9000), () {
        Get.offAllNamed(Routes.HOME);
      });
    } else {
      Future.delayed(Duration(microseconds: 9000), () {
        Get.offAllNamed(Routes.LOGIN);
      });
    }
  }*/
}

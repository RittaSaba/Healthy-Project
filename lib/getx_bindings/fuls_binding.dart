import 'package:get/get.dart';

import '../app/Fuls/fuls_controller.dart';

class FulsBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(FulsController());
  }

}
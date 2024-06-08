
import 'package:get/get.dart';
import 'package:temp_task2/app/Success/success_controller.dart';

class SuccessBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SuccessController());
  }

}
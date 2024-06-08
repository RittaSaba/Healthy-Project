

import 'package:get/get.dart';
import 'package:temp_task2/app/WrongMessage/wrong_message_controller.dart';

class WrongMessageBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(WrongMessageController());
  }

}
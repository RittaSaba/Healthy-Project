

import 'package:get/get.dart';
import 'package:temp_task2/app/SignUp/sign_up_controller.dart';

class SignUpBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SignUpController());
  }

}
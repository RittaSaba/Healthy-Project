
import 'package:get/get.dart';
import 'package:temp_task2/app/Authenticated/authenticated_controller.dart';
class AuthenticatedBinding extends Bindings{
  @override
  void dependencies() {
    Get.put( AuthenticatedController());
  }

}
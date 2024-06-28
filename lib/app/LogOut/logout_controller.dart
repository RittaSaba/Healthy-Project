import 'package:get/get.dart';
import 'package:temp_task2/config/end_points.dart';

import '../../config/api_services.dart';
import '../../native_service/get_storage.dart';
import '../../routes/app_routes.dart';
import 'logout_response_model.dart';

class LogOutController extends GetxController {
  //final getStorage=GetStorage();
  // var name="";
  late LogOutModel logOutModel;
  late UserStorage storage;
  String message='';
  // void logOut(){
  //   DioHelper.postData();
  //
  //   storage.delete('access_token');
  //   Get.offAllNamed(
  //     Routes.LOGIN,
  //   );
  // }
  void logOut() {
    storage=UserStorage();
    DioHelper.postData(url: LOGOUT, data: {
      'token': storage.read('access_token'),

    }).then((value)  {
      print(value.data);
      logOutModel=LogOutModel.fromJson(value.data);
      message=logOutModel.message.toString();
      print(message);
      print(logOutModel.data);
if(message=='Logged out successfully.')
  {
    storage.delete('access_token');
      Get.offAllNamed(
        Routes.LOGIN,
      );
  }
    }).catchError((error) {
      print(error);
    });
  }
  @override
  void onInit() {
    super.onInit();
    //  name=getStorage.read("name");
  }
/* logout(){
    getStorage.erase();
  //  Get.offAllNamed(Routes.LOGIN);
  }*/
}

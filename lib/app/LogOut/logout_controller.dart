import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:temp_task2/config/end_points.dart';

import '../../config/api_services.dart';
import '../../native_service/get_storage.dart';
import '../../routes/app_routes.dart';
import '../../core/models/logout_response_model.dart';

class LogOutController extends GetxController {
  //final getStorage=GetStorage();
  // var name="";
  late LogOutModel logOutModel;
  late UserStorage storage;
  int? statusCode=0;
  String message='';

  @override
  void onInit() {
    storage=UserStorage();
    super.onInit();

  }
  void logOut() {

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
  Future<bool> userLogOut() async {
    print('Token is :');
    print(storage.read('access_token'));


    try {
      print('token');
      print(storage.read('access_token'));
      dynamic response = await DioHelper.postLogOut(url: 'api/auth/logout', token: storage.read('access_token'));


      LogOutModel logOutModel =
      LogOutModel.fromJson(response.data);
      print('Response:');
      print(logOutModel.message);
      storage.delete('access_token');
      return true; // Indicate success
    } catch (error) {
      if (error is DioException) {
        print('DioException occurred:');
        print(error.message);

        if (error.response != null) {
          print('Response data:');
          print(error.response?.data);
          print('Status code:');
          print(error.response?.statusCode);
          statusCode = error.response?.statusCode!;
        }
      } else {
        print('An unexpected error occurred:');
        print(error);
      }
      return false; // Indicate failure
    }
  }



}

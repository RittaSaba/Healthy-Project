import 'dart:io';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:temp_task2/config/server_config.dart';

import '../app/SignUp/sign_up_model.dart';
import 'end_points.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://task5-heba-kaddour.trainees-mad-s.com/',
        receiveDataWhenStatusError: true,
        headers: {'Accept': 'application/json'}));
  }

  static Future<Response> postData({
    required String url,

    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
  }) async {
    return dio.post(url, queryParameters: query, data: data);
  }
 static Future<Response>  register({required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String phoneNumber,
    required String imagePathing,
  required String imageName,
   required String filePathing,
   required String fileName,
  })async {
    final data=FormData.fromMap({
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'phone_number': phoneNumber,
      'profile_photo':await MultipartFile.fromFile(imagePathing,filename:imageName),
      'certificate':await MultipartFile.fromFile(filePathing,filename:fileName),
    });
    print(name);
    print(email);
    print(password);
    print(passwordConfirmation);
    print(phoneNumber);
    print(imageName);
    print(imagePathing);
    print(fileName);
    print(filePathing);
    return dio.post(REGISTER, data: data) ;
  }
}
/*

  /*Future<List<Student>> fetchStudents(String endPoint) async {
    try {
      final response = await dio.get(endPoint);
      print(response.statusCode);
      if (response.statusCode == 200) {
        final data = response.data as List<dynamic>;
        print(data);
        List<Student> students = data.map((studentData) {
          return Student(
              name: studentData['name'],
              age: studentData['age'],
              major: studentData['major'],
              gpa: studentData['gpa'],
              id: studentData['id']);
        }).toList();
        return students;
      } else {
        throw Exception('Failed to load students');
      }
    } catch (e) {
      throw Exception('Faild to load students: $e');
    }
  }*/

  Future<bool> signUpService (
      {required String name,
    required String email,

    required String password,
    required String passwordConfirmation,
    required String phoneNumber,
    required PlatformFile certificate,


    required String imageProfilePathing,

  }) async {
    try {
      final formData = FormData.fromMap({
        'name': name,
        'email':email,
        'password':password,
        'password_confirmation':passwordConfirmation,
        'phone_number':phoneNumber,

        'profile_photo': await MultipartFile.fromFile(
            imageProfilePathing, ),
        'certificate':
          await MultipartFile.fromFile(certificate.path.toString(), filename: certificate.name),
      });

      dio.options.headers={ 'Accept': 'application/json'};
      final response = await dio.post(ServerConfig.register, data: formData);
      print('***************');
      print(response.data);
      print("status code is ${ response.statusCode}");
    //  statusCodeOfResponse=response.statusCode;
      if (response.statusCode == 201) {
      //  final responseData = response.data as Map<String, dynamic>;
      //   message = responseData['message'];
        return true;
      } else {
        //final responseData = response.data as Map<String, dynamic>;
       // message = responseData['message'];
       // statusCodeOfResponse=response.statusCode;
        return false;
      }
    } catch (e) {
      throw Exception('Failed to signup: $e');
    }
  }
*/

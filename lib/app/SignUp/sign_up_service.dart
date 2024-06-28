import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:temp_task2/config/server_config.dart';
import 'package:temp_task2/core/models/user.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import '../../core/models/sign_up_response_model.dart';

class SignUpService {}
/*
  var message; var statusCodeOfResponse;
  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.register);

late  SignUpModel signUpModel;
  Future<SignUpModel> signUp({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String phoneNumber,
    required XFile certificate,
    required XFile image,})async{
    try{
      var uri=Uri.https('https://task5-heba-kaddour.trainees-mad-s.com','/api/auth/register');
      final request=http.MultipartRequest('POST',uri);
      request.headers["Accept"]="application/json";
      request.fields["name"]=name;
      request.fields["email"]=email;
      request.fields["password"]=password;
      request.fields["password_confirmation"]=passwordConfirmation;
      request.fields["phone_number"]=phoneNumber;
      request.files.add(await http.MultipartFile.fromPath('profile_photo', image.path),);
      request.files.add(await http.MultipartFile.fromPath('certificate', certificate.path));

      var requestResponse=await request.send();
      print(requestResponse.statusCode);
      requestResponse.stream.transform(utf8.decoder).listen((value) {
        var jsonResponse=jsonDecode(value)as Map<String,dynamic>;
        if(requestResponse.statusCode==200){
          signUpModel=SignUpModel.fromJson(jsonResponse);
print(signUpModel.message);
        }
      });
    }catch(e){return Future.error(e);}
    return signUpModel;
  }
 /* Future<bool> register( {required String name,
    required String email,

    required String password,
    required String passwordConfirmation,
    required String phoneNumber,
    required PlatformFile certificate,


    required String imageProfilePathing,

  }) async {

  /*  var request = http.MultipartRequest('POST',url);


    request.files.add(
      await http.MultipartFile.fromPath(
        'certificate',
       certificate.path.toString(),filename: certificate.name
      ),
    );

    // إضافة الصورة إلى الطلب
    request.files.add(
      await http.MultipartFile.fromPath(
        'profile_photo',
          imageProfilePathing
      ),
    );*/
  /*  final request=http.MultipartRequest('POST',url);
    request.fields['name']= name;
    request.fields['email']= email;
    request.fields['password']= password;
    request.fields['password_confirmation']= passwordConfirmation;
    request.fields['phone_number']= phoneNumber;
    request.files.add(await http.MultipartFile.fromPath('profile_photo', imageProfilePathing));
    request.files.add(await http.MultipartFile.fromPath('certificate', certificate.path.toString()));
    var response=await request.send();*/
       var response = await http.post(url, headers: {
      'Accept': 'application/json'
    }, body: {
      'name': name,
      'email':email,
      'password':password,
      'password_confirmation':passwordConfirmation,
      'phone_number':phoneNumber,
      'profile_photo':imageProfilePathing,
      'certificate':jsonDecode(certificate.path.toString()),
    });
    print('*****************11111************************');
    print(response.statusCode);
    statusCodeOfResponse=response.statusCode;
    print('********************22222*********************');
    print(response.statusCode);
    print('*******************33333**********************');
       message = response.body;
       print(message);
    if (response.statusCode == 200) {


      message = response.body;
      print(message);
      return true;
    } else if (response.statusCode == 422) {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse['message'];
      print(jsonResponse['message']);
      return false;
    } else {
      return false;
    }
  }*/
  Future<void> sendImage(  {required String name,
    required String email,

    required String password,
    required String passwordConfirmation,
    required String phoneNumber,
    required XFile certificate,


    required String imageProfilePathing,

  }) async {
    // Convert image to bytes
    var bytes = await rootBundle.load(imageProfilePathing);
    var buffer = bytes.buffer;
    var imageBytes = buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);

    // Encode the bytes
    var base64Image = base64Encode(imageBytes);

    // Send the API request
    var uri=Uri.https('https://task5-heba-kaddour.trainees-mad-s.com','/api/auth/register');
    var response = await http.post(uri,headers: {
      'Accept': 'application/json'
    }, body: {

      'profile_photo': base64Image,
      'name': name,
      'email':email,
      'password':password,
      'password_confirmation':passwordConfirmation,
      'phone_number':phoneNumber,

      'certificate':jsonDecode(certificate.path.toString()),
    });

    // Handle the API response
    if (response.statusCode == 200) {
      print('200');
      // Success
    } else {
      // Error
      print(response.statusCode);
    }
  }*/


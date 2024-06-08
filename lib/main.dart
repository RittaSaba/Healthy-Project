
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import 'package:temp_task2/core/functions/get_device_type.dart';
import 'package:temp_task2/routes/app_pages.dart';

import 'package:temp_task2/theme/themes.dart';

void main() async {
  await GetStorage.init();
  runApp(/*DevicePreview(builder:(context) => */MyApp() /*)*/);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   // var mediaQueryData=MediaQuery.of(context);
    //  double screenHeight = MediaQuery.of(context).size.height;
    //double screenWidth = MediaQuery.of(context).size.width;
    return Sizer(builder: (context, orientation, deviceType) {

      return GetMaterialApp(
        builder:DevicePreview.appBuilder ,
        debugShowCheckedModeBanner: false,
        theme: Themes.customLightTheme,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,

      );
    });
  }
}

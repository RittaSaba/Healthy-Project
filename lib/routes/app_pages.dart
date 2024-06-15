import 'package:get/get.dart';
import 'package:temp_task2/app/Authenticated/authenticated_screen.dart';
import 'package:temp_task2/getx_bindings/sign_up_binding.dart';
import 'package:temp_task2/app/SignUp/sign_up_screen.dart';
import 'package:temp_task2/getx_bindings/success_binding.dart';
import 'package:temp_task2/app/Success/success_bottom_sheet.dart';
import 'package:temp_task2/getx_bindings/wrong_message_binding.dart';
import 'package:temp_task2/app/WrongMessage/wrong_message_dialog.dart';

import '../app/Splash/splash_screen.dart';
import '../getx_bindings/authenticated_binding.dart';
import '../getx_bindings/login_binding.dart';
import '../app/LogIn/login_screen.dart';
import '../getx_bindings/logout_binding.dart';
import '../app/LogOut/logout_dialog.dart';
import '../getx_bindings/splash_binding.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;
  static final routes = [
    //Splash
    GetPage(
        name: Paths.SPLASH,
        page: () => const SplashScreen(),
        binding: SplashBinding()),
    //LogIn
    GetPage(
        name: Paths.LOGIN,
        page: () =>  LogInScreen(),
        binding: LoginBinding()),
    //LogOut
    GetPage(
        name: Paths.LOGOUT,
        page: () => const LogOutDialog(),
        binding: LogOutBinding()),
    //WrongMessage
    GetPage(
        name: Paths.WRONG_MESSAGE,
        page: () => const WrongMessageDialog(),
        binding: WrongMessageBinding()),
    //SignUp
    GetPage(
        name: Paths.SIGNUP,
        page: () => const SignUpScreen(),
        binding: SignUpBinding()),
    //Authenticated
    GetPage(
        name: Paths.AUTHENTICATED,
        page: () => const AuthenticatedScreen(),
        binding: AuthenticatedBinding()),
    //Success
    GetPage(
        name: Paths.SUCCESS,
        page: () => const SuccessBottomSheet(),
        binding: SuccessBinding()),
  ];
}

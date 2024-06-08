import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:temp_task2/app/SignUp/sign_up_controller.dart';
import '../../core/components/custom_text.dart';
import '../../core/components/custom_text_button.dart';
import '../../core/components/custom_text_form_field.dart';
import '../../core/functions/get_device_type.dart';
import '../../core/functions/open_file.dart';
import '../../routes/app_routes.dart';
import '../../theme/themes.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Orientation deviceOrientation =
        getScreenOrientation(MediaQuery.of(context));
    return Scaffold(
      body: deviceOrientation == Orientation.portrait
          ? Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: Themes.backgroundColorGradient,
              ),

              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: SingleChildScrollView(
                child: Form(
                  key: controller.signupFormKey,
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 13.1.h,
                      ),
                      Container(
                        width: 24.w,
                        height: 10.5.h,
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 1.5, color: Themes.fontColor1),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          'assets/images/camera.svg',
                          color: Themes.fontColor1,
                          height: 3.h,
                          width: 8.2.w,
                          fit: BoxFit.none,
                        ),
                      ),
                      SizedBox(
                        height: 6.4.h,
                      ),
                      CustomTextFormField(
                        isPassword: false,

                        controller: controller.userNameController,
                        textInputType: TextInputType.name,

                        labelText: 'Username',
                        hintText: 'Enter your name',
                        validate: controller.usernameValidator,
                        //  suffix_icon: Icons.cancel,
                        focusNode: controller.usernameFocusNode,
                      ),
                      SizedBox(
                        height: 1.8.h,
                      ),
                      CustomTextFormField(
                        isPassword: false,

                        focusNode: controller.emailFocusNode,
                        controller: controller.emailController,
                        textInputType: TextInputType.emailAddress,

                        labelText: 'Email',
                        hintText: 'Enter your email',
                        //  validate: controller.emailValidator,
                        suffixIcon: Icon(
                          Icons.edit,
                          color: Themes.iconColorAtTextFormField,
                        ),
                      ),
                      SizedBox(
                        height: 1.8.h,
                      ),
                      CustomTextFormField(
                        isPassword: false,

                        focusNode: controller.mobileNumberFocusNode,
                        controller: controller.mobileNumberController,
                        textInputType: TextInputType.phone,

                        labelText: 'Mobile Number',
                        hintText: 'Enter your mobile phone',
                        validate: controller.mobilePhoneValidator,
                        //     suffix_icon: Icons.cancel,
                      ),
                      SizedBox(
                        height: 1.8.h,
                      ),
                      Obx(
                        () => CustomTextFormField(
                          isPassword: controller.isPasswordHidden.value,
                          suffixIcon: InkWell(
                            child: Icon(
                              controller.isPasswordHidden.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Themes.iconColorAtTextFormField,
                            ),
                            onTap: () {
                              controller.isPasswordHidden.value =
                                  !controller.isPasswordHidden.value;
                            },
                          ),

                          focusNode: controller.passwordFocusNode,
                          controller: controller.passwordController,
                          textInputType: TextInputType.visiblePassword,

                          labelText: 'Password',
                          hintText: 'Enter your password',
                          validate: controller.passwordValidator,
                          //    suffix_icon: Icons.visibility_off,
                        ),
                      ),
                      SizedBox(
                        height: 1.8.h,
                      ),
                      Obx(
                        () => CustomTextFormField(
                          isPassword: controller.isPasswordConfirmHidden.value,
                          suffixIcon: InkWell(
                            child: Icon(
                              controller.isPasswordConfirmHidden.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Themes.iconColorAtTextFormField,
                            ),
                            onTap: () {
                              controller.isPasswordConfirmHidden.value =
                                  !controller.isPasswordConfirmHidden.value;
                            },
                          ),
                          focusNode: controller.confirmPasswordFocusNode,
                          controller: controller.confirmPasswordController,
                          textInputType: TextInputType.visiblePassword,
                          labelText: 'Confirm Password',
                          hintText: 'Enter your password',
                          validate: controller.confirmPasswordValidator,
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      MaterialButton(
                        onPressed: () {
                          openFile();
                        },
                        height: 4.3.h,
                        minWidth: 43.w,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              color: Themes.borderFieldColor, width: 1.0),
                        ),
                        color: Themes.dialogColor,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomMontagaText(
                                text: 'Certificate PDF file   ',
                                size: 14.sp,
                                line_height: 17.01,
                                font_weight: '500',
                                color: Themes.fontColorAtTextFormField),
                            SvgPicture.asset(
                              'assets/images/up.svg',
                              color: Themes.iconColor,
                              height: 3.h,
                              width: 8.2.w,
                              fit: BoxFit.none,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 4.5.h,
                      ),
                      CustomTextButton(
                          onSubmit: () {
                            Get.toNamed(Routes.AUTHENTICATED);
                          } /* async {
                      if (controller.signupFormKey.currentState!.validate()) {
                        // LoadingOverlay.show(message: 'Registering...');
                        print('Registering');
                        try {
                          ///  await controller.signup();

                          controller.signupFormKey.currentState!.save();
                          log('response signup');

                          Get.offAllNamed(Routes.HOME);
                        } catch (err, _) {
                          printError(info: err.toString());
                          // LoadingOverlay.hide();
                          Get.snackbar(
                            "Error",
                            err.toString(),
                            snackPosition: SnackPosition.TOP,
                            backgroundColor: Colors.red.withOpacity(.75),
                            colorText: Colors.white,
                            icon: const Icon(Icons.error, color: Colors.white),
                            shouldIconPulse: true,
                            barBlur: 20,
                          );
                        } finally {}
                      }
                    }*/
                          ,
                          text: 'Sign up',
                          border_radius_circular: 50,
                          width: 80.9.w,
                          height: 4.4.h,
                          font_size: 16.sp,
                          font_type: 'Montaga',
                          font_weight: '400',
                          line_height: 19.71,
                          border_color: Themes.borderLogInButtonColor,
                          font_color: Themes.darkGreenColor,
                          button_color: Themes.logInButtonColor,
                          hasColor: true),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                        children: [
                          CustomMontagaText(
                              text: 'Already have an account ?',
                              size: 12.sp,
                              line_height: 14.58,
                              font_weight: '500',
                              color: Themes.fontColor1),
                          SizedBox(
                            height: 2.h,
                            child: MaterialButton(
                              minWidth: 5.h,
                              height: 1.5.h,
                              onPressed: () {
                                Get.offAllNamed(Routes.LOGIN);
                              },
                              child: CustomMontagaText(
                                  text: 'Log in',
                                  size: 12.sp,
                                  line_height: 14.58,
                                  font_weight: '500',
                                  color: Themes.darkGreenColor2),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: Themes.backgroundColorGradient,
              ),
              //color: Themes.BackgroundColor,
              padding: EdgeInsets.symmetric(vertical: 4.w),
              child: SingleChildScrollView(
                child: Form(
                  key: controller.signupFormKey,
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 13.1.w,
                      ),
                      Container(
                        width: 24.h,
                        height: 10.5.h,
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 1.5, color: Themes.fontColor1),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          'assets/images/camera.svg',
                          color: Themes.fontColor1,
                          height: 3.h,
                          width: 8.2.h,
                          fit: BoxFit.none,
                        ),
                      ),
                      SizedBox(
                        height: 6.4.w,
                      ),
                      CustomTextFormField(
                        isPassword: false,

                        controller: controller.userNameController,
                        textInputType: TextInputType.name,

                        labelText: 'Username',
                        hintText: 'Enter your name',
                        validate: controller.usernameValidator,
                        //  suffix_icon: Icons.cancel,
                        focusNode: controller.usernameFocusNode,
                      ),
                      SizedBox(
                        height: 1.8.w,
                      ),
                      CustomTextFormField(
                        isPassword: false,

                        focusNode: controller.emailFocusNode,
                        controller: controller.emailController,
                        textInputType: TextInputType.emailAddress,

                        labelText: 'Email',
                        hintText: 'Enter your email',
                        //  validate: controller.emailValidator,
                        suffixIcon: Icon(
                          Icons.edit,
                          color: Themes.iconColorAtTextFormField,
                        ),
                      ),
                      SizedBox(
                        height: 1.8.w,
                      ),
                      CustomTextFormField(
                        isPassword: false,

                        focusNode: controller.mobileNumberFocusNode,
                        controller: controller.mobileNumberController,
                        textInputType: TextInputType.phone,

                        labelText: 'Mobile Number',
                        hintText: 'Enter your mobile phone',
                        validate: controller.mobilePhoneValidator,
                        //     suffix_icon: Icons.cancel,
                      ),
                      SizedBox(
                        height: 1.8.w,
                      ),
                      Obx(
                        () => CustomTextFormField(
                          isPassword: controller.isPasswordHidden.value,
                          suffixIcon: InkWell(
                            child: Icon(
                              controller.isPasswordHidden.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Themes.iconColorAtTextFormField,
                            ),
                            onTap: () {
                              controller.isPasswordHidden.value =
                                  !controller.isPasswordHidden.value;
                            },
                          ),

                          focusNode: controller.passwordFocusNode,
                          controller: controller.passwordController,
                          textInputType: TextInputType.visiblePassword,

                          labelText: 'Password',
                          hintText: 'Enter your password',
                          validate: controller.passwordValidator,
                          //    suffix_icon: Icons.visibility_off,
                        ),
                      ),
                      SizedBox(
                        height: 1.8.w,
                      ),
                      Obx(
                        () => CustomTextFormField(
                          isPassword: controller.isPasswordConfirmHidden.value,
                          suffixIcon: InkWell(
                            child: Icon(
                              controller.isPasswordConfirmHidden.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Themes.iconColorAtTextFormField,
                            ),
                            onTap: () {
                              controller.isPasswordConfirmHidden.value =
                                  !controller.isPasswordConfirmHidden.value;
                            },
                          ),

                          focusNode: controller.confirmPasswordFocusNode,
                          controller: controller.confirmPasswordController,
                          textInputType: TextInputType.visiblePassword,

                          labelText: 'Confirm Password',
                          hintText: 'Enter your password',
                          validate: controller.confirmPasswordValidator,
                          //suffix_icon: Icons.visibility_off,
                        ),
                      ),
                      SizedBox(
                        height: 3.w,
                      ),
                      MaterialButton(
                        onPressed: () {
                          openFile();
                        },
                        height: 4.3.h,
                        minWidth: 43.h,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              color: Themes.borderFieldColor, width: 1.0),
                        ),
                        color: Themes.dialogColor,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomMontagaText(
                                text: 'Certificate PDF file   ',
                                size: 14.sp,
                                line_height: 17.01,
                                font_weight: '500',
                                color: Themes.fontColorAtTextFormField),
                            SvgPicture.asset(
                              'assets/images/up.svg',
                              color: Themes.iconColor,
                              height: 3.h,
                              width: 8.2.h,
                              fit: BoxFit.none,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 4.5.w,
                      ),
                      CustomTextButton(
                          onSubmit: () {
                            Get.toNamed(Routes.AUTHENTICATED);
                          } /* async {
                      if (controller.signupFormKey.currentState!.validate()) {
                        // LoadingOverlay.show(message: 'Registering...');
                        print('Registering');
                        try {
                          ///  await controller.signup();

                          controller.signupFormKey.currentState!.save();
                          log('response signup');

                          Get.offAllNamed(Routes.HOME);
                        } catch (err, _) {
                          printError(info: err.toString());
                          // LoadingOverlay.hide();
                          Get.snackbar(
                            "Error",
                            err.toString(),
                            snackPosition: SnackPosition.TOP,
                            backgroundColor: Colors.red.withOpacity(.75),
                            colorText: Colors.white,
                            icon: const Icon(Icons.error, color: Colors.white),
                            shouldIconPulse: true,
                            barBlur: 20,
                          );
                        } finally {}
                      }
                    }*/
                          ,
                          text: 'Sign up',
                          border_radius_circular: 50,
                          width: 80.9.h,
                          height: 4.4.h,
                          font_size: 16.sp,
                          font_type: 'Montaga',
                          font_weight: '400',
                          line_height: 19.71,
                          border_color: Themes.borderLogInButtonColor,
                          font_color: Themes.darkGreenColor,
                          button_color: Themes.logInButtonColor,
                          hasColor: true),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomMontagaText(
                              text: 'Already have an account ?',
                              size: 12.sp,
                              line_height: 14.58,
                              font_weight: '500',
                              color: Themes.fontColor1),
                          SizedBox(
                            height: 2.5.h,
                            child: MaterialButton(
                              minWidth: 5.h,
                              height: 1.5.h,
                              onPressed: () {
                                Get.offAllNamed(Routes.LOGIN);
                              },
                              child: CustomMontagaText(
                                  text: 'Log in',
                                  size: 12.sp,
                                  line_height: 14.58,
                                  font_weight: '500',
                                  color: Themes.darkGreenColor2),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }


}
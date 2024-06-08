import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:sizer/sizer.dart';
import 'package:temp_task2/app/Fuls/fuls_dialog.dart';
import 'package:temp_task2/app/Success/success_dialog.dart';
import 'package:temp_task2/routes/app_routes.dart';
import '../../core/components/custom_text.dart';
import '../../core/components/custom_text_button.dart';
import '../../core/components/custom_text_form_field.dart';
import '../../core/functions/get_device_type.dart';
import '../../theme/themes.dart';
import 'login_controller.dart';

class LogInScreen extends GetView<LoginController> {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Orientation deviceOrientation =
        getScreenOrientation(MediaQuery.of(context));
    return Scaffold(
      body: deviceOrientation == Orientation.portrait
          ? Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              decoration:
                  BoxDecoration(gradient: Themes.backgroundColorGradient),
              height: double.infinity,
              width: double.infinity,
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: controller.signInFormKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 33.h,
                          width: 80.w,
                          child: Image.asset(
                            'assets/images/image.png',
                            fit: BoxFit.cover,
                            height: 35.h,
                            width: 75.w,
                          ),
                        ),
                        SizedBox(
                          height: 0.h,
                        ),
                        CustomTextFormField(
                          isPassword: false,
                          controller: controller.emailController,
                          textInputType: TextInputType.emailAddress,
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          validate: (String) {},
                          suffixIcon: Icon(
                            Icons.edit,
                            color: Themes.iconColorAtTextFormField,
                          ),
                        ),
                        SizedBox(
                          height: 2.4.h,
                        ),
                        CustomTextFormField(
                          isPassword: false,
                          controller: controller.mobileNumberController,
                          textInputType: TextInputType.phone,

                          labelText: 'Mobile Number',
                          hintText: 'Enter your mobile phone',
                          validate: (String) {},
                          //  suffix_icon: Icons.cancel,
                        ),
                        SizedBox(
                          height: 2.4.h,
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
                            controller: controller.passwordController,
                            textInputType: TextInputType.visiblePassword,
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            validate: (String) {},
                          ),
                        ),
                        SizedBox(
                          height: 2.4.h,
                        ),
                        Obx(
                          () => CustomTextButton(
                              onSubmit: controller.rememberMe.value == false
                                  ? () {
                                      Get.defaultDialog(
                                        backgroundColor:
                                            Themes.backGroundDialogColor,
                                        title: '',
                                        content: const FulsDialog(),
                                      );
                                    }
                                  : () {
                                      Get.bottomSheet(
                                        backgroundColor:
                                            Themes.backGroundDialogColor,
                                        const SuccessScreen(),
                                      );
                                    },
                              text: 'Log in',
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
                        ),
                        SizedBox(
                          width: 80.9.w,
                          height: 4.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Obx(
                                      () => RoundCheckBox(
                                        size: 15.sp,

                                        uncheckedColor: Colors.white,
                                        checkedWidget: Icon(
                                          Icons.check,
                                          size: 12.sp,
                                          weight: 20.sp,
                                          color: Themes.rightIcon,
                                        ),
                                        checkedColor: Colors.white,
                                        isChecked: controller.rememberMe.value,
                                        onTap: (value) {
                                          controller.toggleRememberMe(value!);
                                        },

                                        border: Border.all(
                                          width: 1.5.sp,
                                          color: Themes.rightIcon,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 0.5.w,
                                    ),
                                    CustomMontagaText(
                                        text: 'Remember me',
                                        size: 13.sp,
                                        line_height: 16.02,
                                        font_weight: '400',
                                        color: Themes.darkGreenColor),
                                  ],
                                ),
                              ),
                              MaterialButton(
                                minWidth: 26.4.w,
                                height: 1.9.h,
                                onPressed: () {},
                                child: CustomCabinText(
                                    text: 'Forget Password?',
                                    size: 11.sp,
                                    line_height: 17.01,
                                    font_weight: '400',
                                    color: Themes.darkGreenColor),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.8.h,
                        ),
                        CustomTextButton(
                            onSubmit: () {
                              Get.toNamed(Routes.SIGNUP);
                            },
                            text: 'Create new account',
                            border_radius_circular: 50,
                            width: 80.9.w,
                            height: 4.4.h,
                            font_size: 16.sp,
                            font_type: 'Montaga',
                            font_weight: '400',
                            line_height: 19.71,
                            border_color: Themes.borderButtonColor,
                            font_color: Themes.darkGreenColor,
                            button_color: Themes.createNewAccountButtonColor,
                            hasColor: true),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : Container(
              padding: EdgeInsets.symmetric(vertical: 4.w),
              decoration:
                  BoxDecoration(gradient: Themes.backgroundColorGradient),
              height: double.infinity,
              width: double.infinity,
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: controller.signInFormKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 80.w,
                          width: 33.h,
                          child: Image.asset(
                            'assets/images/image.png',
                            fit: BoxFit.cover,
                            height: 75.w,
                            width: 35.h,
                          ),
                        ),
                        CustomTextFormField(
                          isPassword: false,
                          controller: controller.emailController,
                          textInputType: TextInputType.emailAddress,
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          validate: (String) {},
                          suffixIcon: Icon(
                            Icons.edit,
                            color: Themes.iconColorAtTextFormField,
                          ),
                        ),
                        SizedBox(
                          height: 2.4.w,
                        ),
                        CustomTextFormField(
                          isPassword: false,
                          controller: controller.mobileNumberController,
                          textInputType: TextInputType.phone,

                          labelText: 'Mobile Number',
                          hintText: 'Enter your mobile phone',
                          validate: (String) {},
                          //  suffix_icon: Icons.cancel,
                        ),
                        SizedBox(
                          height: 2.4.w,
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
                            controller: controller.passwordController,
                            textInputType: TextInputType.visiblePassword,

                            labelText: 'Password',
                            hintText: 'Enter your password',
                            validate: (String) {},
                            // isPassword:controller.isPasswordHidden.value==true?true.obs:false.obs,
                            //  suffix_icon:controller.isPasswordHidden.value? Icons.visibility_off:Icons.visibility,
                          ),
                        ),
                        SizedBox(
                          height: 2.4.w,
                        ),
                        Obx(
                          () => CustomTextButton(
                              onSubmit: controller.rememberMe.value == false
                                  ? () {
                                      const FulsDialog();
                                    }
                                  : () {
                                      const SuccessScreen();
                                    },
                              text: 'Log in',
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
                        ),
                        SizedBox(
                          width: 80.9.h,
                          height: 4.w,
                          // margin: EdgeInsets.fromLTRB(16.5, 0, 0, 135),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Obx(
                                    () => RoundCheckBox(
                                      size: 15.sp,
                                      uncheckedColor: Colors.white,
                                      checkedWidget: Icon(
                                        Icons.check,
                                        size: 12.sp,
                                        weight: 20.sp,
                                        color: Themes.rightIcon,
                                      ),
                                      checkedColor: Colors.white,
                                      isChecked: controller.rememberMe.value,
                                      onTap: (value) {
                                        controller.toggleRememberMe(value!);
                                      },
                                      border: Border.all(
                                        width: 1.5.sp,
                                        color: Themes.rightIcon,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 0.5.h,
                                  ),
                                  CustomMontagaText(
                                      text: 'Remember me',
                                      size: 13.sp,
                                      line_height: 16.02,
                                      font_weight: '400',
                                      color: Themes.darkGreenColor),
                                ],
                              ),
                              MaterialButton(
                                minWidth: 26.4.h,
                                height: 1.9.w,
                                onPressed: () {},
                                child: CustomCabinText(
                                    text: 'Forget Password?',
                                    size: 11.sp,
                                    line_height: 17.01,
                                    font_weight: '400',
                                    color: Themes.darkGreenColor),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.8.w,
                        ),
                        CustomTextButton(
                            onSubmit: () {
                              Get.toNamed(Routes.SIGNUP);
                            },
                            text: 'Create new account',
                            border_radius_circular: 50,
                            width: 80.9.h,
                            height: 4.4.h,
                            font_size: 16.sp,
                            font_type: 'Montaga',
                            font_weight: '400',
                            line_height: 19.71,
                            border_color: Themes.borderButtonColor,
                            font_color: Themes.darkGreenColor,
                            button_color: Themes.createNewAccountButtonColor,
                            hasColor: true),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}

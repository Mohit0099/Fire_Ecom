import 'package:ecom_firebase/Login/LoginController/login_screen_controller.dart';
import 'package:ecom_firebase/Login/loginScreen.dart';
import 'package:ecom_firebase/Login/otp_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  LoginScreenController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          10.h.heightBox,
          // Center(
          //   child: Row(
          //     children: [
          //       for (int i = 0; i < 6; i++)
          //         otpinput(
          //           controller: controller.otp[i],
          //           autoFocus: i == 0 ? true : false,
          //         )
          //     ],
          //   ),
          // ),
          SizedBox(
            height: 10.h,
            width: 80.w,
            child: PinCodeTextField(
              appContext: context,
              controller: controller.otp,
              length: 6,
              onChanged: (val) {},
              pinTheme: PinTheme(
                  shape: PinCodeFieldShape.circle,
                  fieldHeight: 5.h,
                  fieldWidth: 10.w),
              keyboardType: TextInputType.number,
            ),
          ),
          4.h.heightBox,
          Container(
            width: 40.w,
            height: 4.h,
            color: Colors.red,
            child: Center(child: Text("Login").text.color(Colors.white).make()),
          ).onTap(() {
            controller.signInWithPhoneNumber();

            // Get.offAll(() => LoginSCreen());
          }),
        ],
      ),
    );
  }
}

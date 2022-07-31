import 'package:ecom_firebase/Login/LoginController/login_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginSCreen extends StatelessWidget {
  const LoginSCreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginScreenController loginScreenController =
        Get.put(LoginScreenController());
    return Scaffold(
        body: GetBuilder<LoginScreenController>(
            init: LoginScreenController(),
            builder: (value) {
              if (!value.isLoading) {
                return Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // key: _loginController.loginkey,
                  child: SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          3.h.heightBox,
                          Center(
                            child: Container(
                              height: 10.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(30.sp)),
                              child:
                                  Center(child: Text("Logo").text.white.make()),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 1,
                            width: MediaQuery.of(context).size.height * 0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Column(children: [
                              SizedBox(
                                height: 2.h,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Welcome',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange,
                                  ),
                                ),
                              ).p2(),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Login in to get started and experience',
                                  style: TextStyle(
                                    fontSize: 12,
                                    // fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ).p2(),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Great shoping deals',
                                  style: TextStyle(
                                    fontSize: 12,
                                    // fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ).p1(),
                              2.h.heightBox,
                              TextFormField(
                                // validator: _loginController.phonevalidate,
                                controller: loginScreenController.phone,
                                decoration: const InputDecoration(
                                  hintText: 'Mobile No',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 0.5),
                                  ),
                                ),
                              ).pSymmetric(h: 4.w),
                              // TextFormField(
                              //   obscureText: true,
                              //   // validator:,
                              //   // controller: ,
                              //   decoration: const InputDecoration(
                              //     hintText: 'password',
                              //     enabledBorder: UnderlineInputBorder(
                              //       borderSide: BorderSide(
                              //         color: Colors.blue,
                              //       ),
                              //     ),
                              //     focusedBorder: UnderlineInputBorder(
                              //       borderSide:
                              //           BorderSide(color: Colors.blue, width: 0.5),
                              //     ),
                              //   ),
                              // ).pSymmetric(h: 4.w),
                              10.h.heightBox,
                              3.h.heightBox,
                              Container(
                                width: 40.w,
                                height: 4.h,
                                color: Colors.red,
                                child: Center(
                                    child: Text("Login")
                                        .text
                                        .color(Colors.white)
                                        .make()),
                              ).onTap(() {
                                loginScreenController.verifyPhoneNum();
                              }),
                              5.h.heightBox,
                              InkWell(
                                onTap: () {
                                  // Get.to(ForgetPassword());
                                },
                                child: Text(
                                  "Forget Password?",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ).px12(),
                              15.h.heightBox,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don\'t have an account? ",
                                    style: TextStyle(
                                        fontSize: 13.sp, color: Colors.black),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      // Get.to(CreateAccount());
                                    },
                                    child: Text(
                                      "Signup",
                                      style: TextStyle(
                                          fontSize: 13.sp, color: Colors.red),
                                    ),
                                  )
                                ],
                              )
                            ]),
                          ),
                          3.h.heightBox,
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}

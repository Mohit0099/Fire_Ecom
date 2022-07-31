import 'package:ecom_firebase/Login/homepgae.dart';
import 'package:ecom_firebase/Login/loginScreen.dart';
import 'package:ecom_firebase/Login/otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LoginScreenController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController phone = TextEditingController();
  final TextEditingController otp = TextEditingController();
  // List<TextEditingController> otp = [
  //   TextEditingController(),
  //   TextEditingController(),
  //   TextEditingController(),
  //   TextEditingController(),
  //   TextEditingController(),
  //   TextEditingController(),
  // ];
  String result = '';
  String verificationId = "";
  bool isLoading = false;

  void verifyPhoneNum() async {
    isLoading = true;
    update();
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: "+91 ${phone.text}",
          verificationCompleted: (PhoneAuthCredential credential) async {
            await _auth.signInWithCredential(credential);
            print("Verified");
          },
          verificationFailed: (FirebaseAuthException exception) {
            print("Failed $exception");
          },
          codeSent: (String _verificationId, int? forceRespondToken) {
            print("Verification code sent");
            verificationId = _verificationId;
            Get.to(() => OtpScreen());
          },
          codeAutoRetrievalTimeout: (String _verificationId) {
            verificationId = _verificationId;
          });
    } catch (e) {
      print("error $e");
    }
  }

  // otpdigits() {
  //   result = '';
  //   for (int i = 0; i < 6; i++) result += otp[i].text;
  //   print(result);
  // }

  void signInWithPhoneNumber() async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp.text);
      var signInUser = await _auth.signInWithCredential(credential);
      final User? user = signInUser.user;
      print(" sign in succesfully : {$user.uid}");
      // Get.to(() => HomePage());
    } catch (e) {
      print("error $e");
    }
  }
}

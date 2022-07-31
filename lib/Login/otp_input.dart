import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class otpinput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const otpinput({Key? key, required this.controller, required this.autoFocus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SizedBox(
        height: 40,
        width: 10.w,
        child: Container(
          height: 9.h,
          width: 13.w,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,

              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 8),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                hintText: '0',
                hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                counterText: '',
                focusColor: Colors.blue,
              ),
              autofocus: autoFocus,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              // controller: controller,
              maxLength: 1,
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

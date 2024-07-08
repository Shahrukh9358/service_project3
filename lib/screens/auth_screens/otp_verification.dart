import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:service_project3/screens/auth_screens/signup_screen.dart';


class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  String enteredOTP = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(Icons.arrow_back, size: 20),
                SizedBox(width: 10.0),
                Text(
                  'Verification',
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
            SizedBox(height: 40.0),
            Center(
              child: Text(
                'A verification code has been sent to you',
                style: TextStyle(fontSize: 15.0),
              ),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(
                '+923456798971',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20.0),
            // OtpTextField(
            //   length: 6,
            //   width: MediaQuery.of(context).size.width,
            //   fieldWidth: 40,
            //   style: TextStyle(fontSize: 17),
            //   textFieldAlignment: MainAxisAlignment.spaceAround,
            //   fieldStyle: FieldStyle.underline,
            //   onChanged: (pin) {
            //     // Handle onChanged
            //   },
            //   onCompleted: (pin) {
            //     // Handle onCompleted (when all 6 digits are entered)
            //     print("Completed: $pin");
            //   },
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5, // Number of OTP fields
                    (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Center(
                    child: Text(
                      enteredOTP.length > index ? enteredOTP[index] : '',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Center(
              child: Container(
                width: 400, // Adjust width as needed
                height: 45, // Adjust height as needed
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xffF501E6), Color(0xff8B19FC)],
                    begin: Alignment.bottomRight,
                    end: Alignment.bottomLeft,
                  ),
                  borderRadius: BorderRadius.circular(25), // Adjust border radius as needed
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: TextButton(
                  onPressed: () {
                    Get.to(SignupScreen());
                  },
                  child: Text(
                    "Verify",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
                    elevation: WidgetStateProperty.all<double>(0),
                    shadowColor: WidgetStateProperty.all<Color>(Colors.transparent),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Center(
              child: Text(
                '00:57', // You can implement a countdown timer here
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

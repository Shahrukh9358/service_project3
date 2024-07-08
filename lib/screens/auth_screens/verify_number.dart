import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'otp_verification.dart';

class VerifyNumber extends StatefulWidget {
  const VerifyNumber({super.key});

  @override
  State<VerifyNumber> createState() => _VerifyNumberState();
}

class _VerifyNumberState extends State<VerifyNumber> {
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
                  'Phone Number',
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
            SizedBox(height: 60.0),
            Text(
              'Country',
              style: TextStyle(fontSize: 16.0, color: Colors.grey.shade700),
            ),
            SizedBox(height: 8.0),
            Text(
              'India',
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w400),
            ),
            Divider(
              thickness: 1,
              color: Colors.black,
            ),
            SizedBox(height: 16.0),
            Text(
              'Phone Number',
              style: TextStyle(fontSize: 16.0, color: Colors.grey.shade700),
            ),
            SizedBox(height: 8.0),
            const Stack(
              children: [
                Row(
                  children: [
                    Text(
                      '09239319329',
                      style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w400),
                    ),
                    // Spacer(),
                  ],
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  top: 0,
                  child: Icon(
                    CupertinoIcons.check_mark_circled_solid,
                    color: Colors.green,
                    size: 20.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Divider(
              thickness: 1,
              color: Colors.black,
            ),
            SizedBox(height: 16.0),

            Center(
              child: Container(
                width: 300, // Adjust width as needed
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
                    Get.to(OtpVerification());
                  },
                  child: Text(
                    "Sign Up/Login with Phone",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
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
            )
          ],
        ),
      ),
    );
  }
}

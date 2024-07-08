import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../home_screen/home.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(Icons.arrow_back, size: 20),
                SizedBox(width: 10.0),
                Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
            SizedBox(height: 40.0),
            Text(
              'Mobile Number',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter your mobile number',
                border: UnderlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 16.0),
            Text(
              'Password',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Enter your password',
                border: UnderlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.visibility),
                  onPressed: () {
                    // Implement toggle visibility
                  },
                ),
              ),
            ),
            SizedBox(height: 20.0),
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
                    Get.to(const HomeScreen());
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
            ),
          ],
        ),
      ),
    );
  }
}

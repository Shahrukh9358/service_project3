import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'InputNumber.dart'; // Assuming this is your next screen import

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool _isSwitched = false;

  // URLs for the Terms of Service and Privacy Policy
  final String termsOfServiceUrl = 'https://www.example.com/terms';
  final String privacyPolicyUrl = 'https://www.example.com/privacy';

  // Function to launch URLs
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await canLaunch(uri.toString())) {
      throw 'Could not launch $url';
    }
    await launch(uri.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/abc.png"),
            SizedBox(height: 80),
            Container(
              width: 220,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: TextButton(
                onPressed: () {
                  if (_isSwitched) {
                    // Add your Google sign-in logic here
                  } else {
                    showTermsAgreementSnackbar(context);
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/google.png', // Ensure you have the Google logo in your assets folder
                      height: 24,
                      width: 24,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Sign in with Google',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 220,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: TextButton(
                onPressed: () {
                  if (_isSwitched) {
                    // Add your Facebook login logic here
                  } else {
                    showTermsAgreementSnackbar(context);
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFF1A52C4), // Facebook blue color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/fb.png', // Ensure you have the Facebook logo in your assets folder
                      height: 24,
                      width: 24,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Login with Facebook',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: IconButton(
                      icon: const ImageIcon(
                        AssetImage('assets/images/google.png'), // Replace with your image asset path
                        size: 40,
                        color: Colors.amberAccent,
                      ),
                      onPressed: () {
                        if (_isSwitched) {
                          Get.to(const Inputnumber());
                        } else {
                          showTermsAgreementSnackbar(context);
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: IconButton(
                      icon: const ImageIcon(
                        AssetImage('assets/images/google.png'), // Replace with your image asset path
                        size: 40,
                        color: Colors.amber,
                      ),
                      onPressed: () {
                        if (_isSwitched) {
                          // Define the action on button press
                        } else {
                          showTermsAgreementSnackbar(context);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Switch(
                    value: _isSwitched,
                    onChanged: (newValue) {
                      setState(() {
                        _isSwitched = newValue;
                      });
                    },
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'By continuing, you agree to the ',
                            style: TextStyle(color: Colors.grey,fontSize: 15),
                          ),
                          TextSpan(
                            text: 'Terms of \nService',
                            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 17),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                _launchUrl(termsOfServiceUrl);
                              },
                          ),
                          const TextSpan(
                            text: ' and',
                            style: TextStyle(color: Colors.black,fontSize: 15),
                          ),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 17),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                _launchUrl(privacyPolicyUrl);
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showTermsAgreementSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Please agree to the Terms of Service and Privacy Policy'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}

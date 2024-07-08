import 'package:get/get.dart';
import 'package:service_project3/screens/auth_screens/InputNumber.dart';
import 'package:service_project3/screens/auth_screens/onboarding_screen.dart';
import 'package:service_project3/screens/auth_screens/otp_verification.dart';
import 'package:service_project3/screens/auth_screens/signup_screen.dart';
import 'package:service_project3/screens/auth_screens/verify_number.dart';
import 'package:service_project3/screens/home_screen/home.dart';

final AppRoutes = [

  GetPage(name: "/onboarding", page: ()=> const OnboardingScreen()),
  GetPage(name: "/inputNumber", page: ()=> const Inputnumber()),
  GetPage(name: "/verifyNumber", page: ()=> const VerifyNumber()),
  GetPage(name: "/otpscreen", page: ()=> const OtpVerification()),
  GetPage(name: "/signUp", page: ()=> const SignupScreen()),
  GetPage(name: "/homeScreen", page: ()=> const HomeScreen()),

];
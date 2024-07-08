import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_project3/routes.dart';

void main(){
  runApp(
      GetMaterialApp(
    initialRoute:  "/onboarding",
    getPages: AppRoutes,
        theme: ThemeData(
          useMaterial3: false
        ),

  ));
}
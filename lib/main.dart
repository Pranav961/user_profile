import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_screen.dart';

void main() {
  runApp(
    const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  );
}

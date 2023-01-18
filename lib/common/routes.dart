import 'package:flutter/material.dart';
import 'package:test_assignment/pages/add_page.dart';
import 'package:test_assignment/pages/google_map_page.dart';
import 'package:test_assignment/pages/home_page.dart';
import 'package:test_assignment/pages/otp_page.dart';
import 'package:test_assignment/pages/phone_input_page.dart';
import 'package:test_assignment/pages/detail_page.dart';
import 'package:test_assignment/pages/splash_page.dart';

Map<String, Widget Function(BuildContext)> routes = {
  SplashPage.routeName: (context) => const SplashPage(),
  PhoneInputPage.routeName: (context) => const PhoneInputPage(),
  OtpPage.routeName: (context) => const OtpPage(),
  HomePage.routeName: (context) => const HomePage(),
  DetailPage.routeName: (context) => DetailPage(),
  AddPage.routeName: (context) => AddPage(),
  MapSample.routeName: (context) => MapSample(),
};

import 'package:flutter/material.dart';
import 'package:test_assignment/pages/home_page.dart';
import 'package:test_assignment/pages/otp_page.dart';
import 'package:test_assignment/pages/phone_input_page.dart';
import 'package:test_assignment/pages/detail_page.dart';
import 'package:test_assignment/pages/splash_page.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => const PhoneInputPage(),
  '/otp': (context) => OtpPage(),
  '/home': (context) => const HomePage(),
  '/detail': (context) => const DetailPage(),
};

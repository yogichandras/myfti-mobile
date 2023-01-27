import 'package:flutter/material.dart';
import 'package:myfti/screens/sample_ui_screen.dart';
import 'package:myfti/screens/login_screen.dart';
import 'package:myfti/screens/register_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  // since apps grow, we need to get rid of 'SampleUIWidgets'
  '/': (context) => const SampleUIWidgets(),
  // define your routes here
  '/login': (context) => const LoginScreen(),
  '/register': (context) => const RegisterScreen(),
};

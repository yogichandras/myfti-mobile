import 'package:flutter/material.dart';
import 'package:myfti/screens/login_screen.dart';
import 'package:myfti/screens/register_screen.dart';
import 'package:myfti/screens/root_screen.dart';
import 'package:myfti/screens/splash_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => const SplashScreen(),
  '/home': (context) => const RootScreen(),
  '/login': (context) => const LoginScreen(),
  '/register': (context) => const RegisterScreen(),
};

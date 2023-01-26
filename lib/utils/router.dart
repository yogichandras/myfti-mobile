import 'package:flutter/material.dart';
import 'package:myfti/screens/login_screen.dart';
import 'package:myfti/screens/register_screen.dart';
import 'package:myfti/screens/root_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/login': (context) => const LoginScreen(),
  '/register': (context) => const RegisterScreen(),
  '/': (context) => const RootScreen(),
};

import 'package:flutter/material.dart';
import 'package:myfti/screens/sample_ui_screen.dart';

import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/schedule_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  // since apps grow, we need to get rid of 'SampleUIWidgets'
  '/': (context) => const SampleUIWidgets(),
  // define your routes here
  // '/login': (context) => const LoginScreen(),
  // '/register': (context) => const RegisterScreen(),

  // task figur
  // Home Screen
  // Profile Screen
  // Schedule Screen
  '/home': (context) => const HomeScreenWidgets(),
  '/profile': (context) => const ProfileScreen(),
  '/schedule': (context) => const ScheduleScreen(),
  // '/home': (context) => const HomeScreenWidgets(),
  // '/profile': (context) => const ProfileScreen(),
  // '/': (context) => const ScheduleScreen(),
};

import 'package:flutter/material.dart';

import 'package:myfti/providers/auth_provider.dart';
import 'package:myfti/screens/home_screen.dart';
import 'package:myfti/screens/profile_screen.dart';
import 'package:myfti/screens/schedule_screen.dart';
import 'package:myfti/screens/unauthenticated_screen.dart';
import 'package:myfti/utils/colors.dart';
import 'package:provider/provider.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int selectedIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const ScheduleScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  onTapItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var authProvider = context.watch<AuthProvider>();

    if (!authProvider.isLogin) {
      return const UnauthenticatedScreen();
    }

    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Schedule',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_rounded),
              label: 'Profile',
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: primaryColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: onTapItemSelected,
        ),
        body: screens[selectedIndex]);
  }
}

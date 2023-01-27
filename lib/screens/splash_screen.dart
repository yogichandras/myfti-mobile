import 'package:flutter/material.dart';
import 'package:myfti/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    var authProvider = Provider.of<AuthProvider>(context, listen: false);

    Future.delayed(const Duration(seconds: 3), () {
      if (authProvider.isLogin || authProvider.token.isNotEmpty) {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/unibi-logo.png',
            height: 310,
            width: 250,
            alignment: Alignment.center,
          ),
        ],
      ),
    ));
  }
}

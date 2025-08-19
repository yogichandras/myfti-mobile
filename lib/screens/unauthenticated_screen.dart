import 'package:flutter/material.dart';
import 'package:myfti/ui/custom_button_widget.dart';
import 'package:myfti/utils/colors.dart';

class UnauthenticatedScreen extends StatelessWidget {
  const UnauthenticatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyFTI'),
        backgroundColor: primaryColor,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(children: [
              Text('Sesi habis',
                  style: TextStyle(fontSize: 20, color: tertiaryColor)),
              const SizedBox(
                height: 20,
              ),
              const Text(
                  'Ups, sesi anda telah berakhir silahkan login kembali :(')
            ]),
            CustomButtonWidget(text: "Login".toUpperCase(), onPressed: () {}),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:myfti/utils/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          backgroundColor: primaryColor,
          minimumSize: const Size.fromHeight(50.0)),
      child: Text(text,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.normal)),
    );
  }
}

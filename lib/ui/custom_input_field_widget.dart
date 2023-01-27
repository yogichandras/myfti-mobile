import 'package:flutter/material.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final AutovalidateMode? autovalidateMode;
  final TextInputType? keyboardType;

  const CustomTextFormFieldWidget(
      {super.key,
      required this.labelText,
      this.controller,
      this.validator,
      this.obscureText,
      this.autovalidateMode,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        key: key,
        autovalidateMode: autovalidateMode,
        controller: controller,
        obscureText: obscureText ?? false,
        validator: validator,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            focusColor: Colors.black,
            errorBorder: const UnderlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.red, style: BorderStyle.solid),
            ),
            border: const UnderlineInputBorder(),
            label: Text(labelText),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromARGB(255, 8, 5, 5),
                  style: BorderStyle.solid),
            ),
            focusedErrorBorder: const UnderlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.red, style: BorderStyle.solid),
            ),
            floatingLabelStyle:
                MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
              final Color color = states.contains(MaterialState.error)
                  ? Theme.of(context).colorScheme.error
                  : Colors.black;
              return TextStyle(color: color, letterSpacing: 1.3);
            })));
  }
}

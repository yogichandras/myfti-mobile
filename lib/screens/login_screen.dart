import 'dart:html';

import 'package:flutter/material.dart';
import 'package:myfti/ui/custom_button_widget.dart';
import 'package:myfti/ui/custom_input_field_widget.dart';
import 'package:myfti/utils/colors.dart';
import 'package:myfti/utils/router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _username_emailController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/fti-logo.png',
                      height: 310,
                      width: 250,
                      alignment: Alignment.topRight,
                    ),
                    Expanded(
                        child: Container(
                      padding: const EdgeInsets.all(13.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: <Widget>[
                              CustomTextFormFieldWidget(
                                  controller: _username_emailController,
                                  labelText: 'Username/Email',
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  }),
                              CustomTextFormFieldWidget(
                                  controller: _passwordController,
                                  labelText: "Password",
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  }),
                              const SizedBox(height: 20.0),
                              CustomButtonWidget(
                                  text: "Login".toUpperCase(),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text('Processing Data')),
                                      );
                                    }
                                  }),
                              const Text('Lupa Password?'),
                              const Text('Belum punya akun myfti? register'),
                            ],
                          )
                        ],
                      ),
                    ))
                  ],
                ))));
  }
}

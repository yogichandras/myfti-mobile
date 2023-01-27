import 'package:flutter/material.dart';
import 'package:myfti/models/base_response_model.dart';
import 'package:myfti/providers/auth_provider.dart';
import 'package:myfti/ui/custom_button_widget.dart';
import 'package:myfti/ui/custom_input_field_widget.dart';
import 'package:myfti/utils/colors.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  onLogin() async {
    try {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final navigator = Navigator.of(context);

      if (_formKey.currentState!.validate()) {
        await authProvider.login(
            _usernameController.text, _passwordController.text);

        navigator.pushNamedAndRemoveUntil('/home', (route) => false);
      }
    } on BaseResponse catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message ?? e.toString()),
      ));
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    print("Login Screen ${authProvider.isLogin}");

    return Scaffold(
        body: SafeArea(
      maintainBottomViewPadding: true,
      child: SingleChildScrollView(
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              decoration: const BoxDecoration(color: Colors.white),
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
                      children: [
                        Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              CustomTextFormFieldWidget(
                                  controller: _usernameController,
                                  labelText: 'Username/Email',
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  }),
                              const SizedBox(height: 10.0),
                              CustomTextFormFieldWidget(
                                  controller: _passwordController,
                                  labelText: "Password",
                                  obscureText: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  }),
                              const SizedBox(height: 20.0),
                              CustomButtonWidget(
                                  text: "Login".toUpperCase(),
                                  onPressed: onLogin),
                              const SizedBox(
                                height: 20,
                              ),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Belum punya akun myfti?',
                                        style: TextStyle(
                                          color: tertiaryColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context)
                                              .pushNamed('/register');
                                        },
                                        child: const Text(
                                          'Register',
                                          style: TextStyle(
                                            color: Colors.blue,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ))
                ],
              ))),
    ));
  }
}

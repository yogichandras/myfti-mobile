import 'package:flutter/material.dart';
import 'package:myfti/ui/custom_button_widget.dart';
import 'package:myfti/ui/custom_input_field_widget.dart';
import 'package:myfti/ui/custom_input_file_field_widget.dart';
import 'package:myfti/utils/colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  onRegister() {
    if (_formKey.currentState!.validate()) {
      // If the form is valid, display a Snackbar.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Register'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: secondaryColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/fti-logo.png',
                    height: 310,
                    width: 250,
                    alignment: Alignment.topRight,
                  ),
                  CustomTextFormFieldWidget(
                    labelText: 'NPM',
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Mohon isi NPM dengan angka';
                      }

                      return null;
                    },
                  ),
                  CustomTextFormFieldWidget(
                    labelText: 'Nama',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormFieldWidget(
                    labelText: 'Username',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10.0),
                  CustomTextFormFieldWidget(
                    labelText: 'Email',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }

                      if (!value.contains('@')) {
                        return 'Please enter a valid email';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 10.0),
                  CustomTextFormFieldWidget(
                    labelText: 'Semester',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 10.0),
                  CustomTextFormFieldWidget(
                    labelText: 'Jurusan',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 10.0),
                  CustomTextFormFieldWidget(
                    labelText: 'Bio',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 10.0),
                  CustomTextFormFieldWidget(
                    labelText: 'Password',
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }

                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 10.0),
                  CustomTextFormFieldWidget(
                    labelText: 'Confirm Password',
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }

                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  CustomInputFileFieldWidget(
                    validator: (p0) {
                      if (p0 == null) {
                        return 'Mohon isi foto profil';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  CustomButtonWidget(
                    text: 'Register',
                    onPressed: onRegister,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

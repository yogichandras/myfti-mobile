import 'package:flutter/material.dart';
import 'package:myfti/models/base_response_model.dart';
import 'package:myfti/services/auth_service.dart';
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

  bool _isLoading = false;

  final Map<String, dynamic> _formData = {
    'npm': '',
    'nama': '',
    'username': '',
    'email': '',
    'semester': '',
    'jurusan': '',
    'bio': '',
    'foto': '',
    'password': '',
    'confirm_password': '',
  };

  @override
  void initState() {
    super.initState();
  }

  _onRegister() async {
    var snackbar = ScaffoldMessenger.of(context);
    var navigator = Navigator.of(context);
    try {
      setState(() {
        _isLoading = true;
      });
      if (_formKey.currentState!.validate()) {
        final AuthService authService = AuthService();
        await authService.register(_formData);

        snackbar.showSnackBar(
          const SnackBar(
            content: Text('Register berhasil'),
            backgroundColor: Colors.green,
          ),
        );

        navigator.pushReplacementNamed('/login');
      }
    } on BaseResponse catch (e) {
      snackbar.showSnackBar(
        SnackBar(
          content: Text(e.message.toString()),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  _onChanged(String field, String value) {
    setState(() {
      _formData[field] = value;
    });
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
                    onChanged: (p0) {
                      _onChanged('npm', p0);
                    },
                  ),
                  CustomTextFormFieldWidget(
                    labelText: 'Nama',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Mohon isi nama';
                      }
                      return null;
                    },
                    onChanged: (p0) {
                      _onChanged('nama', p0);
                    },
                  ),
                  CustomTextFormFieldWidget(
                    labelText: 'Username',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Mohon isi username';
                      }
                      return null;
                    },
                    onChanged: (p0) {
                      _onChanged('username', p0);
                    },
                  ),
                  const SizedBox(height: 10.0),
                  CustomTextFormFieldWidget(
                    labelText: 'Email',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Mohon isi email';
                      }

                      if (!value.contains('@')) {
                        return 'Format email tidak valid';
                      }

                      return null;
                    },
                    onChanged: (p0) {
                      _onChanged('email', p0);
                    },
                  ),
                  const SizedBox(height: 10.0),
                  CustomTextFormFieldWidget(
                    labelText: 'Semester',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Mohon isi semester';
                      }

                      return null;
                    },
                    onChanged: (p0) {
                      _onChanged('semester', p0);
                    },
                  ),
                  const SizedBox(height: 10.0),
                  CustomTextFormFieldWidget(
                    labelText: 'Jurusan',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Mohon isi Jurusan';
                      }

                      return null;
                    },
                    onChanged: (p0) {
                      _onChanged('jurusan', p0);
                    },
                  ),
                  const SizedBox(height: 10.0),
                  CustomTextFormFieldWidget(
                    labelText: 'Bio',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Mohon isi bio';
                      }

                      return null;
                    },
                    onChanged: (p0) {
                      _onChanged('bio', p0);
                    },
                  ),
                  const SizedBox(height: 10.0),
                  CustomTextFormFieldWidget(
                    labelText: 'Password',
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Mohon isi konfirmasi password';
                      }

                      if (value.length < 6) {
                        return 'Password minimal 6 karakter';
                      }

                      return null;
                    },
                    onChanged: (p0) {
                      _onChanged('password', p0);
                    },
                  ),
                  const SizedBox(height: 10.0),
                  CustomTextFormFieldWidget(
                    labelText: 'Confirm Password',
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Mohon isi konfirmasi password';
                      }

                      if (value.length < 6) {
                        return 'Password minimal 6 karakter';
                      }

                      if (value != _formData['password']) {
                        return 'Password tidak sama';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  CustomInputFileFieldWidget(
                    onSaved: (p0) {
                      _onChanged('foto', p0!.path);
                    },
                    validator: (p0) {
                      if (p0 == null) {
                        return 'Mohon isi foto profil';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  _isLoading
                      ? const CircularProgressIndicator()
                      : CustomButtonWidget(
                          text: 'Register',
                          onPressed: _onRegister,
                        ),
                ],
              )),
        ),
      ),
    );
  }
}

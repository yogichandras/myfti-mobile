import 'package:flutter/material.dart';
import 'package:myfti/ui/article_card_widget.dart';
import 'package:myfti/ui/custom_button_widget.dart';
import 'package:myfti/ui/custom_input_field_widget.dart';
import 'package:myfti/ui/information_card_widget.dart';
import 'package:myfti/ui/schedule_class_card_widget.dart';
import 'package:myfti/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(body: SampleUIWidgets()),
    );
  }
}

class SampleUIWidgets extends StatefulWidget {
  const SampleUIWidgets({super.key});

  @override
  State<SampleUIWidgets> createState() => _SampleUIWidgets();
}

class _SampleUIWidgets extends State<SampleUIWidgets> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text(
          'Test Unit UI',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 100.0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      CustomTextFormFieldWidget(
                          controller: _controller,
                          labelText: "Test",
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
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                            }
                          })
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                const InformationCardWidget(
                  paragraph:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc sit amet aliquam luctus, nisi nunc aliquam massa, nec aliquam nunc nisl sit amet nunc. Sed euismod, nunc sit amet aliquam luctus, nisi nunc aliquam massa, nec aliquam nunc nisl sit amet nunc.",
                  title: "Test",
                ),
                const SizedBox(
                  height: 20,
                ),
                const ArticleCardWidget(
                  category: "Pengabdian",
                  date: "12/12/2020",
                  description:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc sit amet aliquam luctus, nisi nunc aliquam massa, nec aliquam nunc nisl sit amet nunc. Sed euismod, nunc sit amet aliquam luctus, nisi nunc aliquam massa, nec aliquam nunc nisl sit amet nunc.",
                  imageUrl: "assets/images/unibi-cover.png",
                  place: "Bandung",
                ),
                const SizedBox(
                  height: 20,
                ),
                const ScheduleClassCardWidget(
                    lecturer: "GRAHA PRAKASA",
                    room: "B2231",
                    time: "08:00 - 10:00")
              ],
            ),
          ),
        ),
      ),
    );
  }
}

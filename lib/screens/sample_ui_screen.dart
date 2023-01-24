import 'package:flutter/material.dart';

import 'package:myfti/models/article_model.dart';
import 'package:myfti/models/profile_model.dart';
import 'package:myfti/models/schedule_class_model.dart';
import 'package:myfti/ui/article_card_widget.dart';
import 'package:myfti/ui/class_card_widget.dart';
import 'package:myfti/ui/custom_button_widget.dart';
import 'package:myfti/ui/custom_input_field_widget.dart';
import 'package:myfti/ui/information_card_widget.dart';
import 'package:myfti/ui/profile_information_widget.dart';
import 'package:myfti/ui/schedule_class_card_widget.dart';
import 'package:myfti/utils/colors.dart';

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
          'Sample Unit UI',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _exampleProfileInformationWidget(context),
                _exampleCustomInputFieldAndButtonWidgets(context),
                const SizedBox(height: 20.0),
                _exampleInformationCardWidget(context),
                const SizedBox(
                  height: 20,
                ),
                _exampleArticleCardWidget(context),
                const SizedBox(
                  height: 20,
                ),
                _exampleScheduleClassCardWidget(context),
                const SizedBox(
                  height: 20,
                ),
                _exampleClassCardWidget(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _exampleProfileInformationWidget(BuildContext context) {
    return ProfileInformationWidget(
      profile: ProfileModel(
        name: "Muhammad Fajar",
        semester: "3",
        major: "Teknik Informatika",
        imageUrl: "assets/images/rizky.png",
        bio:
            "HI, IM RIZKY ARDIANSYAH I’M A STUDENT OF UNIBI ON 5TH SEMESTER I LIKE PHOTOGRAPHY, CODING AND DESIGN",
      ),
    );
  }

  Widget _exampleCustomInputFieldAndButtonWidgets(BuildContext context) {
    return Form(
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
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              })
        ],
      ),
    );
  }

  Widget _exampleInformationCardWidget(BuildContext context) {
    return const InformationCardWidget(
      paragraph:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc sit amet aliquam luctus, nisi nunc aliquam massa, nec aliquam nunc nisl sit amet nunc. Sed euismod, nunc sit amet aliquam luctus, nisi nunc aliquam massa, nec aliquam nunc nisl sit amet nunc.",
      title: "Test",
    );
  }

  Widget _exampleArticleCardWidget(BuildContext context) {
    return ArticleCardWidget(
        article: ArticleModel(
      category: "Pengabdian",
      date: "12/12/2020",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc sit amet aliquam luctus, nisi nunc aliquam massa, nec aliquam nunc nisl sit amet nunc. Sed euismod, nunc sit amet aliquam luctus, nisi nunc aliquam massa, nec aliquam nunc nisl sit amet nunc.",
      coverUrl: "assets/images/unibi-cover.png",
      id: "1",
      place: "Bandung",
    ));
  }

  Widget _exampleScheduleClassCardWidget(BuildContext context) {
    return ScheduleClassCardWidget(
      item: ScheduleClassModel(
          lecturer: "GRAHA PRAKASA",
          room: "B2231",
          time: "08:00 - 10:00",
          id: "1",
          subject: "Pengabdian Masyarakat"),
    );
  }

  Widget _exampleClassCardWidget(BuildContext context) {
    return ClassCardWidget(
      item: ScheduleClassModel(
          lecturer: "GRAHA PRAKASA",
          room: "B2231",
          time: "08:00 - 10:00",
          id: "1",
          subject: "Pengabdian Masyarakat"),
    );
  }
}


// class _SampleUIWidgets extends State<SampleUIWidgets> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           elevation: 0.0,
//           title: const Text(
//             'Sample Unit UI',
//             style: TextStyle(
//               color: Colors.white,
//             ),
//           ),
//           backgroundColor: primaryColor,
//         ),
//         body: GridView(
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2, crossAxisSpacing: 3),
//           children: const [
//             ClassCardWidget(),
//             ClassCardWidget(),
//             ClassCardWidget(),
//             ClassCardWidget(),
//             ClassCardWidget(),
//             ClassCardWidget(),
//             ClassCardWidget(),
//             ClassCardWidget(),
//             ClassCardWidget(),
//             ClassCardWidget(),
//             ClassCardWidget(),
//             ClassCardWidget()
//           ],
//         ));
//   }
// }

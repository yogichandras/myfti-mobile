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

class HomeScreenWidgets extends StatefulWidget {
  const HomeScreenWidgets({super.key});

  @override
  State<HomeScreenWidgets> createState() => _HomeScreenWidgets();
}

class _HomeScreenWidgets extends State<HomeScreenWidgets> {
  // final _formKey = GlobalKey<FormState>();
  // final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text(
          'Home Screen',
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
                // _backgroundCardWidget(context),
                // const SizedBox(
                //   height: 20,
                // ),
                _sejarahCardWidget(context),
                _visiCardWidget(context),
                _misiCardWidget(context),
                _pengabdianArticleCardWidget(context),
                _makrabftiArticleCardWidget(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget _backgroundCardWidget(BuildContext context) {
  //   return ArticleCardWidget(
  //       article: ArticleModel(
  //     category: "Pengabdian",
  //     date: "12/12/2020",
  //     description:
  //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc sit amet aliquam luctus, nisi nunc aliquam massa, nec aliquam nunc nisl sit amet nunc. Sed euismod, nunc sit amet aliquam luctus, nisi nunc aliquam massa, nec aliquam nunc nisl sit amet nunc.",
  //     coverUrl: "assets/images/unibi-cover.png",
  //     id: "1",
  //     place: "Bandung",
  //   ));
  // }

  Widget _sejarahCardWidget(BuildContext context) {
    return const InformationCardWidget(
      paragraph:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc sit amet aliquam luctus, nisi nunc aliquam massa, nec aliquam nunc nisl sit amet nunc. Sed euismod, nunc sit amet aliquam luctus, nisi nunc aliquam massa, nec aliquam nunc nisl sit amet nunc.",
      title: "Test",
    );
  }

  Widget _visiCardWidget(BuildContext context) {
    return const InformationCardWidget(
      paragraph:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc sit amet aliquam luctus, nisi nunc aliquam massa, nec aliquam nunc nisl sit amet nunc. Sed euismod, nunc sit amet aliquam luctus, nisi nunc aliquam massa, nec aliquam nunc nisl sit amet nunc.",
      title: "Test",
    );
  }

  Widget _misiCardWidget(BuildContext context) {
    return const InformationCardWidget(
      paragraph:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc sit amet aliquam luctus, nisi nunc aliquam massa, nec aliquam nunc nisl sit amet nunc. Sed euismod, nunc sit amet aliquam luctus, nisi nunc aliquam massa, nec aliquam nunc nisl sit amet nunc.",
      title: "Test",
    );
  }

  Widget _pengabdianArticleCardWidget(BuildContext context) {
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

  Widget _makrabftiArticleCardWidget(BuildContext context) {
    return ArticleCardWidget(
        article: ArticleModel(
      category: "Makrab FTI",
      date: "12/12/2020",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc sit amet aliquam luctus, nisi nunc aliquam massa, nec aliquam nunc nisl sit amet nunc. Sed euismod, nunc sit amet aliquam luctus, nisi nunc aliquam massa, nec aliquam nunc nisl sit amet nunc.",
      coverUrl: "assets/images/unibi-cover.png",
      id: "1",
      place: "Bandung",
    ));
  }
}

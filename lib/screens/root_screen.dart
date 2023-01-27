import 'package:flutter/material.dart';

import 'package:myfti/models/article_model.dart';
import 'package:myfti/providers/auth_provider.dart';
import 'package:myfti/screens/home_screen.dart';
import 'package:myfti/screens/profile_screen.dart';
import 'package:myfti/screens/schedule_screen.dart';
import 'package:myfti/screens/unauthenticated_screen.dart';
import 'package:myfti/ui/article_card_widget.dart';
import 'package:myfti/ui/information_card_widget.dart';
import 'package:myfti/utils/colors.dart';
import 'package:provider/provider.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  onTapItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var authProvider = context.watch<AuthProvider>();

    if (!authProvider.isLogin) {
      return const UnauthenticatedScreen();
    }

    List<Widget> widgetOptions = [
      const HomeScreen(),
      const ScheduleScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Schedule',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_rounded),
              label: 'Profile',
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: primaryColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: onTapItemSelected,
        ),
        body: widgetOptions[selectedIndex]);
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
      title: "Sejarah",
    );
  }

  Widget _visiCardWidget(BuildContext context) {
    return const InformationCardWidget(
      paragraph:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc sit amet aliquam luctus, nisi nunc aliquam massa, nec aliquam nunc nisl sit amet nunc. Sed euismod, nunc sit amet aliquam luctus, nisi nunc aliquam massa, nec aliquam nunc nisl sit amet nunc.",
      title: "Visi",
    );
  }

  Widget _misiCardWidget(BuildContext context) {
    return const InformationCardWidget(
      paragraph:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc sit amet aliquam luctus, nisi nunc aliquam massa, nec aliquam nunc nisl sit amet nunc. Sed euismod, nunc sit amet aliquam luctus, nisi nunc aliquam massa, nec aliquam nunc nisl sit amet nunc.",
      title: "Misi",
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

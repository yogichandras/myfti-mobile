import 'package:flutter/material.dart';

import 'package:myfti/models/article_model.dart';
import 'package:myfti/ui/article_card_widget.dart';
import 'package:myfti/ui/carousel_banner_widget.dart';
import 'package:myfti/ui/information_card_widget.dart';
import 'package:myfti/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Text(
          'Hi Rizky, Selamat Datang!',
          style: TextStyle(
            color: secondaryColor,
          ),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: primaryColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      // body: SingleChildScrollView(
      //   physics: const ScrollPhysics(),
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 20),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         // _backgroundCardWidget(context),
      //         // const SizedBox(
      //         //   height: 20,
      //         // ),
      //         GridView.count(
      //           physics: const NeverScrollableScrollPhysics(),
      //           crossAxisCount: 2,
      //           shrinkWrap: true,
      //           mainAxisSpacing: 2,
      //           children: [
      //             _sejarahCardWidget(context),
      //             _visiCardWidget(context),
      //             _misiCardWidget(context),
      //           ],
      //         ),
      //         Divider(
      //           color: primaryColor,
      //           height: 40,
      //           thickness: 2,
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TODO: Carousel Banner
              const CarouselBannerWidget(
                images: [
                  'assets/images/unibi-logo.png',
                  'assets/images/unibi-cover.png',
                  'assets/images/fti-logo.png',
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                shrinkWrap: true,
                children: [
                  _sejarahCardWidget(context),
                  _visiCardWidget(context),
                  _misiCardWidget(context),
                ],
              ),
              Divider(
                color: primaryColor,
                height: 40,
                thickness: 2,
              ),

              const Text(
                "Artikel",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                  itemCount: 2,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
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
                  })
            ],
          ),
        ),
      ),
    );
  }

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
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc sit amet aliquam luctus, nisi nunc aliquam massa, nec aliquam nunc nisl sit amet nunc. Sed euismod, nunc sit amet aliquam luctus, nisi nunc aliquam massa, nec aliquam nunc nisl sit amet nunc. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc sit amet aliquam luctus, nisi nunc aliquam massa, nec aliquam nunc nisl sit amet nunc. Sed euismod, nunc sit amet aliquam luctus, nisi nunc aliquam massa, nec aliquam nunc nisl sit amet nunc. ",
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
}

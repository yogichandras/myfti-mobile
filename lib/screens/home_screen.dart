import 'package:flutter/material.dart';

import 'package:myfti/models/banner_model.dart';
import 'package:myfti/models/base_response_model.dart';
import 'package:myfti/models/information_model.dart';
import 'package:myfti/ui/article_card_widget.dart';
import 'package:myfti/ui/carousel_banner_widget.dart';
import 'package:myfti/ui/information_card_widget.dart';
import 'package:myfti/utils/colors.dart';

import 'package:myfti/services/information_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  List<String> mapBannerListToListString(
      BaseResponse<List<BannerModel>>? response) {
    if (response == null) {
      return [];
    }

    return response.obj!
        .map((e) => "https://fti.vokratif.com/_temp/uploads/img/${e.image!}")
        .toList();
  }

  refetchData() async {
    // NOTES: This is just a trigger to rebuild the widget or re-fetch the data
    setState(() {});
  }

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
      body: RefreshIndicator(
        onRefresh: () => refetchData(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              carouselBannerWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      children: [
                        informationCardWidget(
                            future: InformationService().getSejarah(),
                            title: "Sejarah"),
                        informationCardWidget(
                            future: InformationService().getVisi(),
                            title: "Visi"),
                        informationCardWidget(
                            future: InformationService().getMisi(),
                            title: "Misi"),
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
                    articleWidgets(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget carouselBannerWidget() {
    return FutureBuilder(
        future: InformationService().getBanners(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: SkeletonCarouselWidget(),
            );
          }

          List<String> images = mapBannerListToListString(snapshot.data);

          return CarouselBannerWidget(
            images: images,
          );
        });
  }

  Widget informationCardWidget(
      {required Future<BaseResponse<InformationModel>>? future,
      required String title}) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SkeletonInformationCardWidget();
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text("Terjadi kesalahan"),
            );
          }

          return InformationCardWidget(
            paragraph: snapshot.data?.obj?.description ?? "",
            title: title,
          );
        });
  }

  Widget articleWidgets() {
    return FutureBuilder(
        future: InformationService().getArticles(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SkeletonArticleCardWidget();
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text("Terjadi kesalahan"),
            );
          }

          var articles = snapshot.data?.obj;

          return ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
              itemCount: articles?.length ?? 0,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ArticleCardWidget(article: articles![index]);
              });
        }));
  }
}

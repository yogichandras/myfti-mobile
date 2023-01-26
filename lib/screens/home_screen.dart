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
  BaseResponse<InformationModel>? _visi;
  BaseResponse<InformationModel>? _misi;
  BaseResponse<InformationModel>? _sejarah;
  BaseResponse<List<BannerModel>>? _banners;

  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      await initializeData();
    });
  }

  initializeData() async {
    var informationService = InformationService();

    var visi = await informationService.getVisi();
    var misi = await informationService.getMisi();
    var sejarah = await informationService.getSejarah();
    var banners = await informationService.getBanners();

    setState(() {
      _visi = visi;
      _misi = misi;
      _sejarah = sejarah;
      _banners = banners;
    });
  }

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
    setState(() {
      _visi = null;
      _misi = null;
      _sejarah = null;
      _banners = null;
    });

    await initializeData();
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
              CarouselBannerWidget(
                images: mapBannerListToListString(_banners),
              ),
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
                        _informationCardWidget(context, "Sejarah", _sejarah),
                        _informationCardWidget(context, "Visi", _visi),
                        _informationCardWidget(context, "Misi", _misi),
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
                    FutureBuilder(
                        future: InformationService().getArticles(),
                        builder: ((context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          if (snapshot.hasError) {
                            return const Center(
                              child: Text("Terjadi kesalahan"),
                            );
                          }

                          var articles = snapshot.data?.obj;

                          return ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: 10,
                                  ),
                              itemCount: articles?.length ?? 0,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return ArticleCardWidget(
                                    article: articles![index]);
                              });
                        })),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _informationCardWidget(BuildContext context, String title,
      BaseResponse<InformationModel>? visi) {
    var result = visi?.obj;

    if (visi?.success == false || result == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return InformationCardWidget(
      paragraph: result.description ?? "",
      title: title,
    );
  }
}

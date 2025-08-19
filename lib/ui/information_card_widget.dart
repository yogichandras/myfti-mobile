import 'package:flutter/material.dart';
import 'package:myfti/utils/colors.dart';
import 'package:shimmer/shimmer.dart';

class InformationCardWidget extends StatelessWidget {
  final String title;
  final String paragraph;

  const InformationCardWidget(
      {super.key, required this.title, required this.paragraph});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: primaryColor.withOpacity(0.8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          showModalBottomSheet<void>(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            builder: (context) {
              return DraggableScrollableSheet(
                expand: false,
                initialChildSize: 0.32,
                maxChildSize: 1,
                minChildSize: 0.32,
                builder: (context, scrollController) {
                  return SingleChildScrollView(
                    controller: scrollController,
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.topCenter,
                      children: [
                        Positioned(
                            top: -14,
                            child: Container(
                              height: 8,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            )),
                        Container(
                          padding: const EdgeInsets.only(
                            top: 20,
                            left: 40,
                            right: 40,
                          ),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(title,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold)),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                paragraph,
                                style: TextStyle(
                                  color: secondaryColor,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 20,
            top: 10,
            left: 20,
            right: 20,
          ),
          child: SingleChildScrollView(
            clipBehavior: Clip.hardEdge,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  paragraph,
                  maxLines: 6,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SkeletonInformationCardWidget extends StatelessWidget {
  const SkeletonInformationCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
            padding: const EdgeInsets.only(
              bottom: 20,
              top: 10,
              left: 20,
              right: 20,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade400,
                child: Container(
                  width: 100,
                  height: 10,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade400,
                child: Container(
                  width: 100,
                  height: 5,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade400,
                child: Container(
                  width: 100,
                  height: 5,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade400,
                child: Container(
                  width: 100,
                  height: 5,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade400,
                child: Container(
                  width: 50,
                  height: 5,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ])));
  }
}

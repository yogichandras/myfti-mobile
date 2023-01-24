import 'package:flutter/material.dart';
import 'package:myfti/utils/colors.dart';

class ArticleCardWidget extends StatelessWidget {
  final String imageUrl;
  final String description;
  final String category;
  final String place;
  final String date;

  const ArticleCardWidget(
      {super.key,
      required this.imageUrl,
      required this.description,
      required this.category,
      required this.place,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
                colorFilter: const ColorFilter.mode(
                  Colors.black26,
                  BlendMode.darken,
                )),
          ),
          width: double.infinity,
          height: 200,
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Text(
                    category,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          '$place, $date',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          description,
          style: const TextStyle(
            fontSize: 15,
          ),
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

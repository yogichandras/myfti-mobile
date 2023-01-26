import 'package:flutter/material.dart';
import 'package:myfti/utils/colors.dart';

class InformationCardWidget extends StatelessWidget {
  final String title;
  final String paragraph;

  const InformationCardWidget(
      {super.key, required this.title, required this.paragraph});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: primaryColor.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
              const SizedBox(
                height: 10,
              ),
              Text(
                paragraph,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                ),
                textAlign: TextAlign.justify,
              )
            ],
          ),
        ),
      ),
    );
  }
}

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
        borderRadius: BorderRadius.circular(0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(title,
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
              subtitle: Column(
                children: [
                  const SizedBox(height: 10),
                  Text(
                    paragraph,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

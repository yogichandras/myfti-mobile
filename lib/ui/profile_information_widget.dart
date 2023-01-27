import 'package:flutter/material.dart';
import 'package:myfti/models/profile_model.dart';
import 'package:myfti/utils/colors.dart';

class ProfileInformationWidget extends StatelessWidget {
  final ProfileModel profile;

  const ProfileInformationWidget({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      constraints: const BoxConstraints(
        minWidth: 400,
      ),
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(profile.imageUrl!),
            ),
            const SizedBox(height: 20),
            Text(
              profile.name ?? "",
              style: const TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(profile.semester!),
                          const Text(
                            "Semester",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(profile.major!),
                          const Text(
                            "Jurusan",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    profile.bio ?? "",
                    style: TextStyle(color: secondaryColor, fontSize: 12),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:myfti/models/profile_model.dart';
import 'package:myfti/utils/colors.dart';
import 'package:shimmer/shimmer.dart';

class ProfileInformationWidget extends StatelessWidget {
  final ProfileModel? profile;

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
              backgroundImage: NetworkImage(
                  profile?.imageUrl ?? "assets/images/unibi-logo.png"),
            ),
            const SizedBox(height: 20),
            Text(
              profile?.name ?? "",
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
                          Text(profile?.semester ?? ''),
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
                          Text(profile?.major ?? ''),
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
                    profile?.bio ?? "",
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

class SkeletonProfileInformationWidget extends StatelessWidget {
  const SkeletonProfileInformationWidget({super.key});

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
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 200,
                height: 20,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.white,
                ),
              ),
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
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              width: 100,
                              height: 5,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              width: 100,
                              height: 5,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              width: 100,
                              height: 5,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              width: 100,
                              height: 5,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: 300,
                      height: 5,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: 300,
                      height: 5,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: 300,
                      height: 5,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

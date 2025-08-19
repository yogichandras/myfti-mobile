import 'package:flutter/material.dart';

import 'package:myfti/models/schedule_class_model.dart';
import 'package:myfti/providers/auth_provider.dart';
import 'package:myfti/ui/class_card_widget.dart';
import 'package:myfti/ui/profile_information_widget.dart';
import 'package:myfti/utils/colors.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> _refetchData() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    double width = MediaQuery.of(context).size.width;
    int widthCard = 170;

    int countRow = width ~/ widthCard;

    onLogout() async {
      final navigator = Navigator.of(context);

      await authProvider.removeTokenFromSharedPreferences();
      await authProvider.removeProfileFromSharedPreferences();

      navigator.pushReplacementNamed('/login');
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: false,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: secondaryColor,
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              color: secondaryColor,
            ),
            tooltip: 'Logout',
            onPressed: onLogout,
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refetchData,
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
              child: Column(
                children: [
                  FutureBuilder(
                      future: authProvider.getUserProfile(),
                      builder: ((context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const SkeletonProfileInformationWidget();
                        }

                        if (snapshot.hasError) {
                          return const Text("Terjadi kesalahan");
                        }

                        var profile = snapshot.data?.obj;

                        return ProfileInformationWidget(
                          profile: profile,
                        );
                      })),
                  Divider(
                    color: primaryColor,
                    thickness: 2,
                    height: 20,
                  ),
                  Text(
                    "Kelas Anda",
                    style: TextStyle(fontSize: 20, color: tertiaryColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: countRow,
                    shrinkWrap: true,
                    children: <Widget>[
                      _classCardWidget(context),
                      _classCardWidget1(context),
                      _classCardWidget2(context),
                      _classCardWidget3(context),
                      _classCardWidget4(context),
                      _classCardWidget5(context),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _classCardWidget(BuildContext context) {
    return ClassCardWidget(
      item: ScheduleClassModel(
          lecturer: "GRAHA PRAKASA",
          room: "B2231",
          time: "08:00 - 10:00",
          id: "1",
          subject: "Pengabdian Masyarakat"),
    );
  }

  Widget _classCardWidget1(BuildContext context) {
    return ClassCardWidget(
      item: ScheduleClassModel(
          lecturer: "GRAHA PRAKASA",
          room: "B2231",
          time: "08:00 - 10:00",
          id: "1",
          subject: "Pengabdian Masyarakat"),
    );
  }

  Widget _classCardWidget2(BuildContext context) {
    return ClassCardWidget(
      item: ScheduleClassModel(
          lecturer: "GRAHA PRAKASA",
          room: "B2231",
          time: "08:00 - 10:00",
          id: "1",
          subject: "Pengabdian Masyarakat"),
    );
  }

  Widget _classCardWidget3(BuildContext context) {
    return ClassCardWidget(
      item: ScheduleClassModel(
          lecturer: "GRAHA PRAKASA",
          room: "B2231",
          time: "08:00 - 10:00",
          id: "1",
          subject: "Pengabdian Masyarakat"),
    );
  }

  Widget _classCardWidget4(BuildContext context) {
    return ClassCardWidget(
      item: ScheduleClassModel(
          lecturer: "GRAHA PRAKASA",
          room: "B2231",
          time: "08:00 - 10:00",
          id: "1",
          subject: "Pengabdian Masyarakat"),
    );
  }

  Widget _classCardWidget5(BuildContext context) {
    return ClassCardWidget(
      item: ScheduleClassModel(
          lecturer: "GRAHA PRAKASA",
          room: "B2231",
          time: "08:00 - 10:00",
          id: "1",
          subject: "Pengabdian Masyarakat"),
    );
  }
}

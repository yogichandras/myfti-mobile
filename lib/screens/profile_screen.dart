import 'package:flutter/material.dart';

import 'package:myfti/models/profile_model.dart';
import 'package:myfti/models/schedule_class_model.dart';
import 'package:myfti/ui/class_card_widget.dart';
import 'package:myfti/ui/profile_information_widget.dart';
import 'package:myfti/utils/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  // final _formKey = GlobalKey<FormState>();
  // final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    int widthCard = 170;

    int countRow = width ~/ widthCard;

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
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
            child: Column(
              children: [
                _profileInformationWidget(context),
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
    );
  }

  Widget _profileInformationWidget(BuildContext context) {
    return ProfileInformationWidget(
      profile: ProfileModel(
        name: "Muhammad Fajar",
        semester: "3",
        major: "Teknik Informatika",
        imageUrl: "assets/images/rizky.png",
        bio:
            "HI, IM RIZKY ARDIANSYAH I’M A STUDENT OF UNIBI ON 5TH SEMESTER I LIKE PHOTOGRAPHY, CODING AND DESIGN",
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

import 'package:flutter/material.dart';
import 'package:myfti/models/base_response_model.dart';

import 'package:myfti/models/schedule_class_model.dart';
import 'package:myfti/services/schedule_class_service.dart';
import 'package:myfti/ui/schedule_class_card_widget.dart';
import 'package:myfti/utils/colors.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreen();
}

class _ScheduleScreen extends State<ScheduleScreen> {
  // final _formKey = GlobalKey<FormState>();
  // final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: secondaryColor,
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          )),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: FutureBuilder(
              future: ScheduleClassService().getScheduleClasses(),
              builder: (context, snapshot) {
                return renderListViewBuilder(snapshot);
              }),
        ),
      ),
    );
  }

  Widget renderListViewBuilder(
      AsyncSnapshot<BaseResponse<List<ScheduleClassModel>>> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }

    if (snapshot.hasError) {
      return const Center(child: Text("Terjadi kesalahan"));
    }

    var scheduleClasses = snapshot.data!.obj;

    return ListView.separated(
      shrinkWrap: true,
      itemCount: scheduleClasses!.length,
      itemBuilder: (_, index) => ScheduleClassCardWidget(
        item: scheduleClasses[index],
      ),
      separatorBuilder: (_, index) => const SizedBox(
        height: 20,
      ),
    );
  }
}

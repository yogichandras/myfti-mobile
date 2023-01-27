import 'package:flutter/material.dart';

import 'package:myfti/services/schedule_class_service.dart';
import 'package:myfti/ui/schedule_class_card_widget.dart';
import 'package:myfti/utils/colors.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreen();
}

class _ScheduleScreen extends State<ScheduleScreen> {
  Future<void> _refetchData() async {
    setState(() {});
  }

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
      body: RefreshIndicator(
        onRefresh: _refetchData,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: FutureBuilder(
              future: Future.delayed(
                const Duration(seconds: 3),
                () => ScheduleClassService().getScheduleClasses(),
              ),
              builder: (context, snapshot) {
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
              }),
        ),
      ),
    );
  }
}

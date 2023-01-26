import 'package:flutter/material.dart';
import 'package:myfti/models/schedule_class_model.dart';

class ClassCardWidget extends StatelessWidget {
  final ScheduleClassModel item;

  const ClassCardWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Center(
                child: Image.asset(
                  'assets/images/unibi-logo.png',
                  fit: BoxFit.contain,
                  width: 50,
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Kelas : ${item.room}"),
                    Text(item.subject?.toUpperCase() ?? ""),
                    Text(item.time ?? ""),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:myfti/models/schedule_class_model.dart';

class ClassCardWidget extends StatelessWidget {
  final ScheduleClassModel item;

  const ClassCardWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Image.asset(
                      'assets/images/unibi-logo.png',
                      fit: BoxFit.contain,
                      width: 50,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("Kelas : ${item.room}"),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(item.subject ?? ""),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(item.time ?? ""),
                ])
          ],
        ),
      ),
    );
  }
}

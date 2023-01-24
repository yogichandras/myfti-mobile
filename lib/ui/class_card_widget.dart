import 'package:flutter/material.dart';

class ClassCardWidget extends StatelessWidget {
  const ClassCardWidget({super.key});

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
                  Image.asset(
                    'assets/images/unibi-logo.png',
                    fit: BoxFit.contain,
                    width: double.infinity,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Kelas : B20200"),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text('METODOLOGI PENELITIAN'),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text('GRAHA PRAKASA'),
                ])
          ],
        ),
      ),
    );
  }
}

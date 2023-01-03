import 'package:flutter/material.dart';

class MarkerWidget extends StatelessWidget {
  const MarkerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
      backgroundColor: Colors.blue.withOpacity(0.4),
      child: CircleAvatar(
        radius: 13,
        backgroundColor: Colors.blue,
      ),
    );
  }
}

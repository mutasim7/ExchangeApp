import 'package:flutter/material.dart';

class AbuteUsWidget extends StatelessWidget {
  const AbuteUsWidget(
      {super.key,
      required this.width,
      required this.text,
      required this.decoration});

  final double width;
  final String text;final BoxDecoration decoration;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width,
      decoration: decoration,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
    );
  }
}

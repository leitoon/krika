import 'package:flutter/material.dart';

class TextStock extends StatelessWidget {
  const TextStock({
    super.key, required this.tamfuen,
  });
  final double tamfuen;
  @override
  Widget build(BuildContext context) {
    return Text(
      'En stock',
      style: TextStyle(
          fontSize: tamfuen, color: const Color(0xffF334A0), 
          fontWeight: FontWeight.w400),
      textAlign: TextAlign.start,
    );
  }
}
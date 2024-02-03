

import 'package:flutter/material.dart';

class TextoNormal extends StatelessWidget {
   TextoNormal({
    super.key,
    required color,
    required fontWeight,
     required this.texto, 
     required this.sizefont,
  });
late Color color;
late FontWeight fontWeight;
final String texto;
final double sizefont;
  @override
  Widget build(BuildContext context) {
    return Text(texto,
    style:  TextStyle(
    fontSize: sizefont,
    fontWeight: FontWeight.w400,
    color: Colors.black
    ), 
    );
  }
}
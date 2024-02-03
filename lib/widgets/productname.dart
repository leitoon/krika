
import 'package:flutter/material.dart';

class ProductText extends StatelessWidget {
  const ProductText({
    super.key,
    required this.product, 
    required this.tamfuen,
  });

  final  product;
  final double tamfuen;


  @override
  Widget build(BuildContext context) {
    return Text(
          product['ProductName'],
          style:  TextStyle(
          fontSize: tamfuen, 
          color: const Color(0xffF334A0),
          fontWeight: FontWeight.w500),
          textAlign: TextAlign.start,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        );
  }
}
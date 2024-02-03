import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PrecioText extends StatelessWidget {
  const PrecioText({
    super.key, required this.tamfuen,
  });
  final double tamfuen;
  @override
  Widget build(BuildContext context) {
    return Text(
      '\$${NumberFormat("#,##0.00", "en_US").format(35000.0)}',
      style: TextStyle(
          fontSize: tamfuen,
          color: Color(0xff0D0D0D), fontWeight: FontWeight.w400),
      textAlign: TextAlign.start,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
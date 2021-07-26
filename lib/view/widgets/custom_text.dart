import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final Alignment alignment;
  final TextAlign textAlign;
  final int maxLine;
  final double height;
  final FontWeight fontWeight;
  final TextOverflow overFlow;

  CustomText({
    this.text = '',
    this.fontSize = 16,
    this.color = Colors.black,
    this.alignment = Alignment.topLeft,
    this.textAlign,
    this.maxLine,
    this.height,
    this.fontWeight,
    this.overFlow,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        textAlign: textAlign,
        style: GoogleFonts.montserrat(
          color: color,
          fontSize: fontSize,
          height: height,
          fontWeight: fontWeight,
        ),
        maxLines: maxLine,
        overflow: overFlow,
      ),
    );
  }
}

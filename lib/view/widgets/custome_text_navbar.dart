import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextNavBar extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final Alignment alignment;
  final TextAlign textAlign;
  final int maxLine;
  final double height;
  final FontWeight fontWeight;

  CustomTextNavBar({
    this.text = '',
    this.fontSize = 16,
    this.color = Colors.black,
    this.alignment = Alignment.topLeft,
    this.textAlign,
    this.maxLine,
    this.height = 1,
    this.fontWeight,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Column(
        children: [
          Text(
            text,
            textAlign: textAlign,
            style: GoogleFonts.montserrat(
              color: color,
              fontSize: fontSize,
              height: height,
              fontWeight: fontWeight,
            ),
            maxLines: maxLine,
          ),
          SizedBox(
            height: 4,
          ),
          Container(
              height: 6,
              width: 6,
              decoration: BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.circular(10),
              )),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:planty_shop/view/widgets/custom_text.dart';

class CustomSocialButton extends StatelessWidget {
  final String text;
  final String imageUrl;
  final Function onPressed;
  CustomSocialButton({this.text, this.imageUrl, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), color: Colors.grey.shade200),
      // ignore: deprecated_member_use
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageUrl,
              width: 50,
            ),
            CustomText(
              text: text,
              fontSize: 14,
              color: Colors.black87,
            ),
          ],
        ),
      ),
    );
  }
}

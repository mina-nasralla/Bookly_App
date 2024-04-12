import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key,
      required this.bgcolor,
      required this.textcolor,
      this.border_Radius,
      required this.text, this.on_Pressed});

  final Color bgcolor;
  final String text;
  final Color textcolor;
  final BorderRadius? border_Radius;
  final void Function()? on_Pressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed: on_Pressed,
        style: TextButton.styleFrom(
            backgroundColor: bgcolor,
            shape: RoundedRectangleBorder(
                borderRadius: border_Radius ?? BorderRadius.circular(16))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                  fontSize: 17, fontWeight: FontWeight.w900, color: textcolor),
            ),
          ],
        ),
      ),
    );
  }
}

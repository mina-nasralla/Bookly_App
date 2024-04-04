import 'package:booklyapp/Core/utilites/widgets/Text_Button.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width *.06),
      child: const Row(
        children: [
          Expanded(
              child: CustomTextButton(
                bgcolor: Colors.white,
                border_Radius: BorderRadius.only(topLeft: Radius.circular(16),bottomLeft: Radius.circular(16)),
                textcolor: Colors.black, text: '19.99 €',
              )),
          Expanded(
              child: CustomTextButton(
                bgcolor: Color(0xffEF8262),
                border_Radius: BorderRadius.only(topRight: Radius.circular(16),bottomRight: Radius.circular(16)),
                textcolor: Colors.white, text: 'Free preview',
              )),
        ],
      ),
    );
  }
}

import 'package:booklyapp/Core/utilites/widgets/Text_Button.dart';
import 'package:booklyapp/Features/Home/data/Models/book_model/book_model.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width *.06),
      child: Row(
        children: [
          ConditionalBuilder(
            condition: bookModel.accessInfo!.epub?.acsTokenLink == null,
          builder : (BuildContext context)=>const Expanded(
                child: CustomTextButton(
                  bgcolor: Colors.white38,
                  border_Radius: BorderRadius.only(topLeft: Radius.circular(14),bottomLeft: Radius.circular(16)),
                  textcolor: Colors.white, text: 'No download',
                )),
          fallback  : (BuildContext context)=>Expanded(
                child: CustomTextButton(
                  bgcolor: Colors.white,
                  border_Radius: const BorderRadius.only(topLeft: Radius.circular(14),bottomLeft: Radius.circular(16)),
                  textcolor: Colors.black, text: 'Free download',
                  on_Pressed: ()async{
                    Uri uri = Uri.parse(bookModel.accessInfo!.epub!.acsTokenLink!);
                    if (!await launchUrl(uri)) {
                    throw Exception('Could not launch $uri');
                    }
                  },
                )),
          ),
          ConditionalBuilder(
             condition: bookModel.volumeInfo.previewLink == null,
             fallback: (BuildContext context)=>Expanded(
                child: CustomTextButton(
                  on_Pressed: ()async{
                    Uri uri = Uri.parse(bookModel.volumeInfo.previewLink!);
                    if (!await launchUrl(uri)) {
                      throw Exception('Could not launch $uri');
                    }
                  },
                  bgcolor: const Color(0xffEF8262),
                  border_Radius: const BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(16)),
                  textcolor: Colors.white, text: 'Preview',
                )),
            builder: (BuildContext context)=>const Expanded(
                child:  CustomTextButton(
                  bgcolor:  Colors.white38,
                  border_Radius: BorderRadius.only(topRight: Radius.circular(13),bottomRight: Radius.circular(16)),
                  textcolor: Colors.black, text: 'No Preview',
                )),
           ),
        ],
      ),
    );
  }
}

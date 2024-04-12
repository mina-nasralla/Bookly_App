import 'package:booklyapp/Features/Home/data/Models/book_model/book_model.dart';
import 'package:booklyapp/Features/Home/presentation/views/widgets/Book_Detailes/Book_Detailes_View.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Featuredbooksitem extends StatelessWidget {
   Featuredbooksitem({
    super.key,
    required this.imgurl,
    required this.bookModel,
  });

  final String? imgurl;
  BookModel bookModel;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BookDetailes(
                  bookModel: bookModel,
                )));
      },

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: AspectRatio(
                  aspectRatio: 2.6 / 4,
                  child: CachedNetworkImage(
                    imageUrl: imgurl!,
                    fit: BoxFit.fill,
                    errorWidget: (context, url, error) => Container(
                        decoration: const BoxDecoration(color: Color(0xa3ff0404)),
                        child: const Icon(Icons.error)),
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

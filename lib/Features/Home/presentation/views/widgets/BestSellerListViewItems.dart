import 'package:booklyapp/Features/Home/data/Models/book_model/book_model.dart';
import 'package:booklyapp/Features/Home/presentation/views/widgets/Book_Detailes/Book_Detailes_View.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BestSellerListViewItems extends StatelessWidget {
  BestSellerListViewItems(
      {super.key, required this.bookModel, required this.imgurl});

  BookModel bookModel;
  final String imgurl;

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
      child: SizedBox(
        height: 130,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: AspectRatio(
                aspectRatio: 2.6 / 4,
                child: CachedNetworkImage(
                  imageUrl: imgurl,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => Container(
                      decoration: const BoxDecoration(color: Color(0xa3ff0404)),
                      child: const Icon(Icons.error)),
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: MediaQuery.sizeOf(context).width * .5,
                      child: Text(
                        bookModel.volumeInfo.title!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(
                    height: 3,
                  ),
                  SizedBox(
                    child: Text(
                      bookModel.volumeInfo.authors!.toString(),
                      overflow: TextOverflow.ellipsis,
                      style:
                          const TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Free',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.numbers_outlined,
                        color: Colors.cyanAccent,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        '${bookModel.volumeInfo.pageCount?.toString()} page',
                        style: const TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

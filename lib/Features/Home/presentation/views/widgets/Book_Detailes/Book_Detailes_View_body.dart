import 'package:booklyapp/Features/Home/data/Models/book_model/book_model.dart';
import 'package:booklyapp/Features/Home/presentation/Manger/Similar_Books_Cubit/similar_books_cubit.dart';
import 'package:booklyapp/Features/Home/presentation/views/widgets/Book_Detailes/BooksAction.dart';
import 'package:booklyapp/Features/Home/presentation/views/widgets/Book_Detailes/SimilarList.dart';
import 'package:booklyapp/Features/Home/presentation/views/widgets/Featured_books_items.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailesViewBody extends StatelessWidget {
  const BookDetailesViewBody({
    super.key, required this.bookModel,
  });


final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        return SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(CupertinoIcons.xmark)),
                    ConditionalBuilder(
                      condition: bookModel.saleInfo?.buyLink != null,
                      builder:(BuildContext context)=> IconButton(
                          onPressed: () async {
                            Uri uri = Uri.parse(bookModel.saleInfo!.buyLink!);
                            if (!await launchUrl(uri)) {
                            throw Exception('Could not launch $uri');
                            }
                          },
                          icon: const Icon(CupertinoIcons.cart)),
                      fallback: (BuildContext context)=>const Icon(Icons.remove_shopping_cart_outlined),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.sizeOf(context).width * .25),
                  child:Featuredbooksitem(
                    imgurl: bookModel.volumeInfo.imageLinks?.thumbnail, bookModel: bookModel,
                  )),
              const SizedBox(
                height: 30,
              ),
               Text(bookModel.volumeInfo.title!,
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              const SizedBox(height: 4),
               Text(
                bookModel.volumeInfo.authors![0],
                style: const TextStyle(fontSize: 18, color: Colors.white70),
              ),
              const SizedBox(height: 14),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.numbers_outlined, color: Colors.purpleAccent, size: 20),
                  const SizedBox(width: 6),
                  const Text('Number of pages:', style: TextStyle(fontSize: 25,color: Colors.white)),
                  const SizedBox(width: 8),
                  Text(bookModel.volumeInfo.pageCount.toString(),
                      style: const TextStyle(fontSize: 17, color: Colors.grey)),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
               BooksAction(bookModel:bookModel,),
              const SizedBox(
                height: 35,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'You can also like',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Similar_List(bookModel: bookModel,),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ));
      },
    );
  }
}

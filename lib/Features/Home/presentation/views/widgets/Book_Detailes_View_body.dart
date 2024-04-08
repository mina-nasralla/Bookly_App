import 'package:booklyapp/Features/Home/presentation/views/widgets/BooksAction.dart';
import 'package:booklyapp/Features/Home/presentation/views/widgets/DetailesList.dart';
import 'package:booklyapp/Features/Home/presentation/views/widgets/Featured_books_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookDetailesViewBody extends StatelessWidget {
  const BookDetailesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
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
                IconButton(
                    onPressed: () {}, icon: const Icon(CupertinoIcons.cart))
              ],
            ),
          ),
          const SizedBox(height: 15),
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width * .25),
              child: const Featuredbooksitem(imgurl: 'data:image/jpeg;base64,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',)),
          const SizedBox(
            height: 30,
          ),
          const Text('Harry Potter and t',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
          const SizedBox(height: 4),
          const Text(
            'Olivia Wilson ',
            style: TextStyle(fontSize: 18, color: Colors.white70),
          ),
          const SizedBox(height: 14),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star_rounded, color: Colors.yellow, size: 20),
              SizedBox(width: 6),
              Text('4.8', style: TextStyle(fontSize: 17)),
              SizedBox(width: 8),
              Text('(2631)',
                  style: TextStyle(fontSize: 14, color: Colors.grey)),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          const BooksAction(),
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
          const DetailesList(),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    ));
  }
}


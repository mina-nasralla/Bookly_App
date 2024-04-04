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
              child: const Featuredbooksitem()),
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


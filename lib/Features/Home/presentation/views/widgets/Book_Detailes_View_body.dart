import 'package:booklyapp/Features/Home/presentation/views/widgets/Featured_books_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookDetailesViewBody extends StatelessWidget {
  const BookDetailesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                  onPressed: () {}, icon: const Icon(CupertinoIcons.cart)),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * .25),
          child: const Featuredbooksitem(),
        ),
        const SizedBox(
          height: 40,
        ),
        const Text(
          'Harry Potter and the Goblet of Fire',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 6,
        ),
        const Text(
          'Olivia Wilson ',
          style: TextStyle(fontSize: 18, color: Colors.white70),
        ),
        const SizedBox(
          height: 14,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star_rounded,
              color: Colors.yellow,
              size: 20,
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              '4.8',
              style: TextStyle(fontSize: 17),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              '(2631)',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ],
    ));
  }
}

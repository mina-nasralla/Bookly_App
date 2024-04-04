import 'package:booklyapp/Features/Home/presentation/views/widgets/Featured_books_items.dart';
import 'package:flutter/material.dart';

class DetailesList extends StatelessWidget {
  const DetailesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .16,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => const Featuredbooksitem()),
    );
  }
}

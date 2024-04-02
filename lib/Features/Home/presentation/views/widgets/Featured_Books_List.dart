import 'package:booklyapp/Features/Home/presentation/views/widgets/Featured_books_items.dart';
import 'package:flutter/material.dart';

class FeaturedBooksList extends StatelessWidget {
  const FeaturedBooksList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .25,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index)=>const Featuredbooksitem()),
    );
  }
}

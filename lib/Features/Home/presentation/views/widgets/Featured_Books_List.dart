import 'package:booklyapp/Core/utilites/widgets/Error_widget.dart';
import 'package:booklyapp/Features/Home/presentation/Manger/Featured_books_cubit/featured_books_cubit.dart';
import 'package:booklyapp/Features/Home/presentation/views/widgets/Featured_books_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksList extends StatelessWidget {
  const FeaturedBooksList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is SuccessFeaturedBooks) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .25,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => const Featuredbooksitem()),
          );
        } else if (state is ErrorFeaturedBooks) {
          return CustomErrorWidget(Errormssg: state.Error);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

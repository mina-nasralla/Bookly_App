import 'package:booklyapp/Core/utilites/widgets/Error_widget.dart';
import 'package:booklyapp/Features/Home/presentation/Manger/Newset_Books_Cubit/newset_books_cubit.dart';
import 'package:booklyapp/Features/Home/presentation/views/widgets/BestSellerListViewItems.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellersListView extends StatelessWidget {
  const BestSellersListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit, NewsetBooksState>(
      builder: (context, state) {
        if (state is SuccessNewsetBooks) {
          return ListView.builder(
            scrollDirection: Axis.vertical,

            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
              child: BestSellerListViewItems(
                bookModel: state.Books[index],
                imgurl:
                    state.Books[index].volumeInfo.imageLinks?.thumbnail ?? '',
              ),
            ),
            itemCount: state.Books.length,
          );
        } else if (state is ErrorNewsetBooks) {
          return CustomErrorWidget(Errormssg: state.Error);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

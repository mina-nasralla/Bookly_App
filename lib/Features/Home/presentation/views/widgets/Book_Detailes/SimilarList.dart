import 'package:booklyapp/Core/utilites/Service_locator/service.dart';
import 'package:booklyapp/Core/utilites/widgets/Error_widget.dart';
import 'package:booklyapp/Features/Home/data/Models/book_model/book_model.dart';
import 'package:booklyapp/Features/Home/data/Repos/Home%20_Repo_Impl.dart';
import 'package:booklyapp/Features/Home/presentation/Manger/Similar_Books_Cubit/similar_books_cubit.dart';
import 'package:booklyapp/Features/Home/presentation/views/widgets/Featured_books_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Similar_List extends StatelessWidget {
  const Similar_List({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          SimilarBooksCubit(getIt.get<HomeRepoEmpl>())
            ..fetchSimilarBooks(category: bookModel.volumeInfo.categories![0]),
      child: BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
        builder: (context, state) {
          if (state is SuccessSimilarBooks) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * .16,
              child: ListView.builder(
                  itemCount: state.Books.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Featuredbooksitem(
                        imgurl: state.Books[index].volumeInfo.imageLinks
                                ?.thumbnail ??
                            '',
                        bookModel: state.Books[index],
                      )),
            );
          } else if (state is ErrorSimilarBooks) {
            return CustomErrorWidget(
              Errormssg: state.Error,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

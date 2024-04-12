import 'package:booklyapp/Core/utilites/Service_locator/service.dart';
import 'package:booklyapp/Features/Home/data/Models/book_model/book_model.dart';
import 'package:booklyapp/Features/Home/data/Repos/Home%20_Repo_Impl.dart';
import 'package:booklyapp/Features/Home/presentation/Manger/Similar_Books_Cubit/similar_books_cubit.dart';
import 'package:booklyapp/Features/Home/presentation/views/widgets/Book_Detailes/Book_Detailes_View_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailes extends StatelessWidget {
  const BookDetailes({super.key,  required this.bookModel,});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
      SimilarBooksCubit(getIt.get<HomeRepoEmpl>())
        ..fetchSimilarBooks(category: bookModel.volumeInfo.categories![0]),
      child:Scaffold(
        body: BookDetailesViewBody(bookModel:bookModel,),
      ),
    );
  }
}

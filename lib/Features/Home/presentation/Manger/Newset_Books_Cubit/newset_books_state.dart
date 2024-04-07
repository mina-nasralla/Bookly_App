part of 'newset_books_cubit.dart';

sealed class NewsetBooksState {}

final class NewsetBooksInitial extends NewsetBooksState {}

final class LoadingNewsetBooks extends NewsetBooksState {}

final class SuccessNewsetBooks extends NewsetBooksState {
  final List<BookModel> Books;

   SuccessNewsetBooks(this.Books);
}

final class ErrorNewsetBooks extends NewsetBooksState {
  final String Error;

  ErrorNewsetBooks(this.Error);
}

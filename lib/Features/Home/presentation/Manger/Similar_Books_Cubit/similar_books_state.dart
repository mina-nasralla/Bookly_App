part of 'similar_books_cubit.dart';

sealed class SimilarBooksState {}

final class SimilarBooksInitial extends SimilarBooksState {}

final class LoadingSimilarBooks extends SimilarBooksState {}

final class SuccessSimilarBooks extends SimilarBooksState {
  final List<BookModel> Books;

  SuccessSimilarBooks(this.Books);
}

final class ErrorSimilarBooks extends SimilarBooksState {
  final String Error;

  ErrorSimilarBooks(this.Error);
}

part of 'featured_books_cubit.dart';

sealed class FeaturedBooksState {}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class LoadingFeaturedBooks extends FeaturedBooksState {}

final class SuccessFeaturedBooks extends FeaturedBooksState {
  final List<BookModel> Books;

  SuccessFeaturedBooks(this.Books);
}

final class ErrorFeaturedBooks extends FeaturedBooksState {
  final String Error;

  ErrorFeaturedBooks(this.Error);
}

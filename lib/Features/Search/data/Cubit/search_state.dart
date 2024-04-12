part of 'search_cubit.dart';

sealed class SearchState {}

final class SearchInitial extends SearchState {}
final class LoadingSearch extends SearchState {}
final class SuccessSearch extends SearchState {
  final List<BookModel> Books;

  SuccessSearch(this.Books);
}
final class ErrorSearch extends SearchState {
  final String Error;

  ErrorSearch(this.Error);
}

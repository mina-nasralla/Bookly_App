import 'package:bloc/bloc.dart';
import 'package:booklyapp/Features/Home/data/Models/book_model/book_model.dart';
import 'package:booklyapp/Features/Home/data/Repos/Home_Repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  static SimilarBooksCubit get(context) => BlocProvider.of(context);

  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(LoadingSimilarBooks());
    var result = await homeRepo.fetchSimilarBooks(category: category);
    result.fold((failure) {
      emit(ErrorSimilarBooks(failure.error_message));
    }, (books) {
      emit(SuccessSimilarBooks(books));
    });
  }
}

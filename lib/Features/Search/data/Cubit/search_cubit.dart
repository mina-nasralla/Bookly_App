import 'package:booklyapp/Features/Home/data/Models/book_model/book_model.dart';
import 'package:booklyapp/Features/Home/data/Repos/Home_Repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.homeRepo) : super(SearchInitial());
  static SearchCubit get(context) => BlocProvider.of(context);

  final HomeRepo homeRepo;

  Future<void> fetchSearchedBooks({required String Search}) async {
    emit(LoadingSearch());
    var result = await homeRepo.fetchSearchedBooks( Search_name: Search);
    result.fold((failure) {
      emit(ErrorSearch(failure.error_message));
    }, (books) {
      print(books[3].volumeInfo!.categories);
      emit(SuccessSearch(books));
    });
  }

}

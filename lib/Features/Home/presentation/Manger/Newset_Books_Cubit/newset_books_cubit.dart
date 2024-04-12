import 'package:booklyapp/Features/Home/data/Models/book_model/book_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/Repos/Home_Repo.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.homeRepo) : super(NewsetBooksInitial());

  static NewsetBooksCubit get(context) => BlocProvider.of(context);

  final HomeRepo homeRepo;

  Future<void> fetchNewsetBooks() async {
    emit(LoadingNewsetBooks());
    var result = await homeRepo.fetchNewstBooks();
    result.fold((failure) {
      emit(ErrorNewsetBooks(failure.error_message));
    }, (books) {
      emit(SuccessNewsetBooks(books));
    });
  }
}

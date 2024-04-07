import 'package:booklyapp/Features/Home/data/Models/book_model/book_model.dart';
import 'package:booklyapp/Features/Home/data/Repos/Home_Repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  static FeaturedBooksCubit get(context) => BlocProvider.of(context);

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(LoadingFeaturedBooks());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold((failure) {
      emit(ErrorFeaturedBooks(failure.error_message));
    }, (books) {
      emit(SuccessFeaturedBooks(books));
    });
  }
}

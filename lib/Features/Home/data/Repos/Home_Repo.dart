import 'package:booklyapp/Core/utilites/Errors/failer.dart';
import 'package:booklyapp/Features/Home/data/Models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchNewstBooks();

  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();

  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category});
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks({required String Search_name});


}

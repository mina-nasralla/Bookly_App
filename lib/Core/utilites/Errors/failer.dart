import 'package:dio/dio.dart';

abstract class Failure {
  final String error_message;

  const Failure(this.error_message);
}

class ServerFailure extends Failure {
  ServerFailure(super.error_message);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection TimeOut with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('Send Timeout with bad Certificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResposnse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Connection TimeOut with Cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocetException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error, please try again !');
      default:
        return ServerFailure('Opp\'s There was an error ,try again later ');
    }
  }

  factory ServerFailure.fromResposnse(int statuscode, dynamic response) {
    if (statuscode == 400 || statuscode == 401 || statuscode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statuscode == 404) {
      return ServerFailure('Your request Not Found, please try again later');
    } else if (statuscode == 500) {
      return ServerFailure('Internal Server error, please try again later');
    } else {
      return ServerFailure('Opp\'s There was an error ,try again later ');
    }
  }
}

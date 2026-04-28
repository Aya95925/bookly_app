import 'package:dio/dio.dart';

class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {

      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with server');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Request took too long to send');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Response took too long');

      case DioExceptionType.badCertificate:
        return ServerFailure('Bad SSL certificate');

      case DioExceptionType.cancel:
        return ServerFailure('Request was cancelled');

      case DioExceptionType.connectionError:
        return ServerFailure('No internet connection');

      case DioExceptionType.unknown:
        return ServerFailure('Unexpected error, please try again');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response?.statusCode,
          dioException.response?.data,
        );
    }
  }

   factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else {
      return ServerFailure('Opps There was an Error, Please try again');
    }
  }
}

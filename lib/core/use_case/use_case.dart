import 'package:bookly_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';


abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call([Param param]);
}

class NoParam {}

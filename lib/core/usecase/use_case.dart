import 'package:almuhafiz_teachers/core/networking/firebase_error_model.dart';
import 'package:dartz/dartz.dart';

abstract class UseCases<ReturnType , Param>{
  Future<Either<ErrorModel , ReturnType>> call(Param param);
}
abstract class UseCasesNoParams<ReturnType> {
  Future<Either<ErrorModel, ReturnType>> call();
}

abstract class StreamUseCase<ReturnType, Params> {
  Stream<Either<ErrorModel, ReturnType>> call(Params params);
}

abstract class StreamUseCaseNoParams<ReturnType> {
  Stream<Either<ErrorModel, ReturnType>> call();
}

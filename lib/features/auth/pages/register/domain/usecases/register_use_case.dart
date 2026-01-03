import 'package:almuhafiz_teachers/core/data/models/teacher_model.dart';
import 'package:almuhafiz_teachers/core/networking/firebase_error_model.dart';
import 'package:almuhafiz_teachers/core/usecase/use_case.dart';
import 'package:almuhafiz_teachers/features/auth/pages/register/domain/repository/register_repository.dart';
import 'package:dartz/dartz.dart';

class RegisterUseCase implements UseCases<TeacherModel , TeacherModel> {
  final RegisterRepository _repository;

  RegisterUseCase(this._repository);
  @override
  Future<Either<ErrorModel, TeacherModel>> call(TeacherModel teacher) async {
    return await _repository.register(teacher);
  }
}
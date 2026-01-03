import 'package:almuhafiz_teachers/core/data/models/teacher_model.dart';
import 'package:almuhafiz_teachers/core/networking/firebase_error_model.dart';
import 'package:almuhafiz_teachers/core/usecase/use_case.dart';
import 'package:almuhafiz_teachers/features/auth/pages/login/data/models/login_email_password_request.dart';
import 'package:almuhafiz_teachers/features/auth/pages/login/domain/repository/login_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase implements UseCases<TeacherModel , LoginEmailPasswordRequest> {
  final LoginRepository _loginRepo;

  LoginUseCase(this._loginRepo);
  @override
  Future<Either<ErrorModel, TeacherModel>> call(LoginEmailPasswordRequest loginEmailPassword) async {
    return await _loginRepo.login(loginEmailPassword);
  }
}
import 'package:almuhafiz_teachers/core/networking/firebase_error_model.dart';
import 'package:almuhafiz_teachers/core/usecase/use_case.dart';
import 'package:almuhafiz_teachers/features/auth/pages/login/data/models/social_login_response_model.dart';
import 'package:almuhafiz_teachers/features/auth/pages/login/domain/repository/login_repository.dart';
import 'package:dartz/dartz.dart';

class LoginWithGoogleUseCase implements UseCases<SocialLoginResponse ,void >{
  final LoginRepository _loginRepo;

  LoginWithGoogleUseCase(this._loginRepo);

  @override
  Future<Either<ErrorModel, SocialLoginResponse>> call(void param) async {
    return await _loginRepo.loginWithGoogle();
  }

}
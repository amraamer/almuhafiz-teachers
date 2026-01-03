import 'package:almuhafiz_teachers/core/data/models/teacher_model.dart';
import 'package:almuhafiz_teachers/core/networking/firebase_error_model.dart';
import 'package:almuhafiz_teachers/features/auth/pages/login/data/models/login_email_password_request.dart';
import 'package:almuhafiz_teachers/features/auth/pages/login/data/models/social_login_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepository {
  Future<Either<ErrorModel, TeacherModel>> login(LoginEmailPasswordRequest loginEmailPasswordRequest);
  Future<Either<ErrorModel , SocialLoginResponse>> loginWithGoogle();
  Future<Either<ErrorModel , SocialLoginResponse>> loginWithApple();
}
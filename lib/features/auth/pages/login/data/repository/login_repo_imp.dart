import 'package:almuhafiz_teachers/core/data/models/teacher_model.dart';
import 'package:almuhafiz_teachers/core/networking/firebase_error_factory.dart';
import 'package:almuhafiz_teachers/core/networking/firebase_error_model.dart';
import 'package:almuhafiz_teachers/features/auth/pages/login/data/data_source/login_data_source.dart';
import 'package:almuhafiz_teachers/features/auth/pages/login/data/models/login_email_password_request.dart';
import 'package:almuhafiz_teachers/features/auth/pages/login/data/models/social_login_response_model.dart';
import 'package:almuhafiz_teachers/features/auth/pages/login/domain/repository/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_utils/src/extensions/export.dart';

class LoginRepoImp implements LoginRepository {
  final LoginDataSource _loginDataSource;

  LoginRepoImp(this._loginDataSource);

  @override
  Future<Either<ErrorModel, TeacherModel>> login(
      LoginEmailPasswordRequest signInEmailPasswordRequestModel,
  ) async {
    try {
      final userModel = await _loginDataSource.signIn(
        signInEmailPasswordRequestModel,
      );
      return right(userModel);
    }
    catch (error) {
      debugPrint("error while Login $error");
      if (error is FirebaseException) {
        return left(ErrorFactory.fromFirebaseError(error));
      } else {
        return left(ErrorFactory.unKnownError());
      }
    }
  }



  @override
  Future<Either<ErrorModel, SocialLoginResponse>> loginWithApple() async {
    try {
      final loginWithAppleReturnDataType = await _loginDataSource.signInWithApple();
      final credential =  loginWithAppleReturnDataType.userCredential;
      if(credential.user != null){
       final isUserExist = await _loginDataSource.isTeacherExist(credential.user!.uid);
        if(isUserExist){
          final teacher = await _loginDataSource.getTeacherById(
            credential.user!.uid,
          );
          return right(SocialLoginResponse(newTeacher: false, teacher: teacher, teacherId: credential.user!.uid,teacherEmail: loginWithAppleReturnDataType.userEmail ?? credential.user!.email,teacherName: loginWithAppleReturnDataType.userName));

        }else{
          return right(SocialLoginResponse(newTeacher: true, teacher: null, teacherId: credential.user!.uid,teacherEmail: loginWithAppleReturnDataType.userEmail ?? credential.user!.email,teacherName: loginWithAppleReturnDataType.userName));
        }
      }else{
        debugPrint("error in create teacher model");
        return left(ErrorFactory.unKnownError());
      }

    } catch (error) {
      if (error is FirebaseException) {
        debugPrint("errorFirebaseException is $error");
        return left(ErrorFactory.fromFirebaseError(error));
      } else if (error is UnsupportedError) {
        return left(ErrorModel(
          message:
          'accountRegisteredAsTutor'.tr,
          code: "0",
        ));
      } else {
        debugPrint("error is $error");
        return left(ErrorFactory.unKnownError());
      }
    }
  }

  @override
  Future<Either<ErrorModel, SocialLoginResponse>> loginWithGoogle() async {
    try {
      final credential =  await _loginDataSource.signInWithGoogle();
      if(credential.user != null){
        final isUserExist = await _loginDataSource.isTeacherExist(credential.user!.uid);
        if(isUserExist){
          final teacher = await _loginDataSource.getTeacherById(
            credential.user!.uid,
          );
          return right(SocialLoginResponse(newTeacher: false, teacher: teacher, teacherId: credential.user!.uid,teacherEmail: credential.user!.email));

        }else{
          return right(SocialLoginResponse(newTeacher: true, teacher: null, teacherId: credential.user!.uid,teacherEmail: credential.user!.email));
        }
      }else{
        debugPrint("error in create teacher model");
        return left(ErrorFactory.unKnownError());
      }

    } catch (error) {
      if (error is FirebaseException) {
        debugPrint("errorFirebaseException is $error");
        return left(ErrorFactory.fromFirebaseError(error));
      } else if (error is UnsupportedError) {
        return left(ErrorModel(
          message:
          'accountRegisteredAsTutor'.tr,
          code: "0",
        ));
      } else {
        debugPrint("error is $error");
        return left(ErrorFactory.unKnownError());
      }
    }
  }
}

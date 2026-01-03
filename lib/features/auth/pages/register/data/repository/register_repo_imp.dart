import 'package:almuhafiz_teachers/core/data/models/teacher_model.dart';
import 'package:almuhafiz_teachers/core/networking/firebase_error_factory.dart';
import 'package:almuhafiz_teachers/core/networking/firebase_error_model.dart';
import 'package:almuhafiz_teachers/features/auth/pages/register/data/data_source/register_data_source.dart';
import 'package:almuhafiz_teachers/features/auth/pages/register/domain/repository/register_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';

class RegisterRepoImp implements RegisterRepository {
  final RegisterDataSource _registerDataSource;

  RegisterRepoImp(this._registerDataSource);

  @override
  Future<Either<ErrorModel, TeacherModel>> register(TeacherModel teacher) async {
    try {
      final userId = await _registerDataSource.createUserWithEmailAndPassword(
          email: teacher.email, password: teacher.password);
      final fcmToken = await _registerDataSource.getDeviceToken();
      final newTeacher = teacher.copyWith(id: userId, fcmToken : fcmToken);
      await _registerDataSource.saveTeacherInFireStore(newTeacher);
      return right(newTeacher);
    } catch (error) {
      if (error is FirebaseException) {
        return left(ErrorFactory.fromFirebaseError(error));
      } else {
        return left(ErrorFactory.unKnownError());
      }
    }
  }

  @override
  Future<Either<ErrorModel, TeacherModel>> completeProfile(TeacherModel teacher) async {
    try {
      final result = await _registerDataSource.completeProfile(teacher);
      if (result != null) {
        return Right(result);
      }
    } catch (error) {
      if (error is FirebaseException) {
        return left(ErrorFactory.fromFirebaseError(error));
      } else {
        return left(ErrorFactory.unKnownError());
      }
    }
    return left(ErrorFactory.unKnownError());
  }
}

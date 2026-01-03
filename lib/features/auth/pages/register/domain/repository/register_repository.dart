import 'package:almuhafiz_teachers/core/data/models/teacher_model.dart';
import 'package:almuhafiz_teachers/core/networking/firebase_error_model.dart';
import 'package:dartz/dartz.dart';

abstract class RegisterRepository {
  Future<Either<ErrorModel, TeacherModel>> register(TeacherModel teacher);

  Future<Either<ErrorModel, TeacherModel>> completeProfile(TeacherModel teacher);

}
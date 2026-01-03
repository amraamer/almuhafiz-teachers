import 'package:almuhafiz_teachers/core/data/models/teacher_model.dart';

class SocialLoginResponse {
  final bool newTeacher;
  final TeacherModel? teacher;
  final String teacherId;
  final String? teacherEmail;
  final String? teacherName;

  SocialLoginResponse({
    required this.newTeacher,
    required this.teacher,
    required this.teacherId,
    required this.teacherEmail,
    this.teacherName,
  });
}
import 'package:almuhafiz_teachers/core/data/models/teacher_model.dart';
import 'package:almuhafiz_teachers/core/networking/firebase_constants.dart';
import 'package:almuhafiz_teachers/core/networking/firebase_keys.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class RegisterDataSource {
  final _firebaseAuth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  final _firebaseMessaging = FirebaseMessaging.instance;

  RegisterDataSource();

  Future<String> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    final response = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return response.user!.uid;
  }

  Future<String?> getDeviceToken() async {
    return await _firebaseMessaging.getToken();
  }

  Future<void> saveTeacherInFireStore(TeacherModel teacher) async {
    await _fireStore
        .collection(FirebaseConstants.teachersCollection)
        .doc(teacher.id)
        .set(teacher.toMap());
  }

  Future<TeacherModel?> completeProfile(TeacherModel teacher) async {
    try {
      await _fireStore
          .collection(FirebaseConstants.teachersCollection)
          .doc(teacher.id)
          .update({
        FireKeys.age: teacher.age,
        FireKeys.job: teacher.job,
        FireKeys.gender: teacher.gender,
        FireKeys.riwayat: teacher.riwayat,
        FireKeys.worksInAnotherApps: teacher.worksInAnotherApps,
        FireKeys.updatedAt: FieldValue.serverTimestamp(),
      });

      return teacher;
    } catch (e) {
      return null;
    }
  }
}

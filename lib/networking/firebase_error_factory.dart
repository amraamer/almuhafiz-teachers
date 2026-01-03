import 'package:almuhafiz_teachers/networking/firebase_constants.dart';
import 'package:almuhafiz_teachers/networking/firebase_error_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ErrorFactory {
  static ErrorModel unKnownError() {
    return ErrorModel(
      message: FirebaseErrorKeys.unknownError,
      code: "0",
    );
  }

  static ErrorModel dreamDetailsNullError() {
    return ErrorModel(
      message:
          "معلومات الرؤيا غير متوفرة الان برجاء المحاولة في وقت لاحق او تواصل مع الدعم لحل المشكلة",
      code: '0',
    );
  }

  static ErrorModel noInterpreterSelected() {
    return ErrorModel(
      message:
      "يجب اختيار علي الاقل مفسر واحد لتفسير حلمك او اختيار تفسير فوري",
      code: '0',
    );
  }

  static ErrorModel fromFirebaseError(FirebaseException error) {
    String message = _getDefaultMessageForFirebaseError(error);

    return ErrorModel(
      message: message,
      code: error.code,
    );
  }

  static String _getDefaultMessageForFirebaseError(FirebaseException error) {
    switch (error.code) {
      // Authentication Errors
      case 'invalid-email':
        return FirebaseErrorKeys.invalidEmail;
      case 'weak-password':
        return FirebaseErrorKeys.weakPassword;
      case 'email-already-in-use':
        return FirebaseErrorKeys.emailAlreadyInUse;
      case 'user-disabled':
        return FirebaseErrorKeys.userDisabled;
      case 'user-not-found':
        return FirebaseErrorKeys.userNotFound;
      case 'wrong-password':
        return FirebaseErrorKeys.wrongPassword;

      // Database Errors
      case 'permission-denied':
        return FirebaseErrorKeys.permissionDenied;
      case 'not-found':
        return FirebaseErrorKeys.notFound;
      case 'unavailable':
        return FirebaseErrorKeys.unavailable;
      case 'invalid-argument':
        return FirebaseErrorKeys.invalidArgument;

      // Storage Errors
      case 'unauthorized':
        return FirebaseErrorKeys.unauthorized;
      case 'quota-exceeded':
        return FirebaseErrorKeys.quotaExceeded;

      // Common Errors
      case 'invalid-credential':
        return FirebaseErrorKeys.invalidCredential;
      case 'network-error':
        return FirebaseErrorKeys.networkError;
      case 'cancelled':
        return FirebaseErrorKeys.cancelled;
      case 'resource-exists':
        return FirebaseErrorKeys.resourceExists;
      case 'operation-not-supported':
        return FirebaseErrorKeys.operationNotSupported;
      case 'internal-error':
        return FirebaseErrorKeys.internalError;
      case 'invalid-state-error':
        return FirebaseErrorKeys.invalidStateError;

      default:
        return FirebaseErrorKeys
            .unknownError; // Use this key for any unspecified errors
    }
  }
}
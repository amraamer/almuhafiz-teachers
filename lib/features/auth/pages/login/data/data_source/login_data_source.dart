import 'dart:convert';
import 'dart:math';
import 'package:almuhafiz_teachers/core/data/models/teacher_model.dart';
import 'package:almuhafiz_teachers/core/networking/firebase_constants.dart';
import 'package:almuhafiz_teachers/core/networking/firebase_keys.dart';
import 'package:almuhafiz_teachers/features/auth/pages/login/data/models/login_email_password_request.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginDataSource {
  final _firebaseAuth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;

  Future<TeacherModel> signIn(LoginEmailPasswordRequest loginEmailPassword) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
      email: loginEmailPassword.email,
      password: loginEmailPassword.password,
    );
    final doc = await _fireStore
        .collection(FirebaseConstants.teachersCollection)
        .doc(userCredential.user?.uid)
        .get();

    return TeacherModel.fromJson({
      ...doc.data()!,
      FireKeys.id: doc.id,
    });
  }

  Future<bool> isTeacherExist(String id) async {
    final data = await _fireStore
        .collection(FirebaseConstants.teachersCollection)
        .doc(id)
        .get();
    return data.exists;
  }

  Future<TeacherModel> getTeacherById(String id) async {
    final doc = await _fireStore
        .collection(FirebaseConstants.teachersCollection)
        .doc(id)
        .get();

    return TeacherModel.fromJson(doc.data()!);
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn.instance.attemptLightweightAuthentication();
    final String? email = googleUser?.email;

    if (email != null) {
      final snapshot = await _fireStore
          .collection(FirebaseConstants.teachersCollection)
          .where(FireKeys.email, isEqualTo: email)
          .get();

      if (snapshot.docs.isNotEmpty) {
        throw UnsupportedError(
            'This email is already registered. Please log in using your password.');
      }
    }

    final GoogleSignInAuthentication? googleAuth = googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.idToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<SignInWithAppleReturnDataType> signInWithApple() async {
    final rawNonce = _generateNonce();
    final nonce = _sha256ofString(rawNonce);

    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    final String? email = appleCredential.email;
    if (email != null) {
      final snapshot = await _fireStore
          .collection(FirebaseConstants.teachersCollection)
          .where(FireKeys.email, isEqualTo: email)
          .get();

      if (snapshot.docs.isNotEmpty) {
        throw UnsupportedError(
            'This email is already registered. Please log in using your password.');
      }
    }

    // Create an `OAuthCredential` from the credential returned by Apple.
    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
      accessToken: appleCredential.authorizationCode,
    );

    // Sign in the user with Firebase. If the nonce we generated earlier does
    // not match the nonce in `appleCredential.identityToken`, sign in will fail.
    final cred =
        await FirebaseAuth.instance.signInWithCredential(oauthCredential);
    return SignInWithAppleReturnDataType(
      userCredential: cred,
      userName: appleCredential.givenName,
      userEmail: appleCredential.email,
    );
  }

  /// Private

  String _generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String _sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}

class SignInWithAppleReturnDataType {
  final UserCredential userCredential;
  final String? userName;
  final String? userEmail;

  SignInWithAppleReturnDataType(
      {required this.userCredential,
      required this.userName,
      required this.userEmail});
}

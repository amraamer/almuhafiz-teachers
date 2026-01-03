import 'package:almuhafiz_teachers/core/data/enums/country_code.dart';
import 'package:almuhafiz_teachers/core/data/enums/languages.dart';
import 'package:almuhafiz_teachers/core/data/enums/riwayah.dart';
import 'package:almuhafiz_teachers/core/data/enums/user_levels.dart';
import 'package:almuhafiz_teachers/core/networking/firebase_constants.dart';
import 'package:almuhafiz_teachers/core/networking/firebase_keys.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  // Personal Info
  final String id;
  final String name;
  final String email;
  final String? phone;
  final String? imageProfile;
  final int age;
  final String? job;
  final int gender; // 0: male, 1: female
  final int? maritalStatus; // 0: single, 1: married, 2: divorced, 3: widowed
  final String password;
  final String? fcmToken;

  // Financial Info
  final double balance;
  final int numberOfPurchase;
  final double totalPurchase;
  final int bonus;

  // Account Info
  final bool accountStatus; // true: active, false: inactive
  final DateTime createdAt;
  final DateTime updatedAt;
  final CountryCode countryCode;
  final String cityName;
  final bool isAndroid;
  final DateTime? lastTimeOpenedApp;
  final bool notificationsEnabled;

  // Learning Info
  final Riwayah riwayah;
  final UserLevel level;
  final Languages language;
  final int totalMemorizedSurah;
  final int totalReadSurah;
  final List<String> learningMapIds;

  // Sessions Info
  final int totalPrivetSessions;
  final int totalGroupSessions;

  // Rating & Reviews
  final double rating;
  final double totalRating;
  final int totalReviews;
  final int rank;

  // Favorites
  final List<String>? favoriteTeacherIds;
  final bool sessionRecordingEnabled;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.phone = '',
    this.imageProfile,
    required this.age,
    this.job = '',
    required this.gender,
    this.maritalStatus = 0,
    this.fcmToken = '',
    this.password = '',
    required this.balance,
    required this.numberOfPurchase,
    this.accountStatus = true,
    required this.createdAt,
    required this.updatedAt,
    required this.countryCode,
    required this.cityName,
    required this.isAndroid,
    this.lastTimeOpenedApp,
    this.notificationsEnabled = true,
    required this.riwayah,
    required this.totalPrivetSessions,
    required this.totalGroupSessions,
    required this.bonus,
    required this.rank,
    required this.level,
    required this.language,
    required this.totalPurchase,
    required this.totalMemorizedSurah,
    required this.totalReadSurah,
    required this.learningMapIds,
    this.favoriteTeacherIds,
    required this.rating,
    required this.totalRating,
    required this.totalReviews,
    this.sessionRecordingEnabled = true,
  });


  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      // Personal Info
      id: json[FireKeys.id] ?? '',
      name: json[FireKeys.name] ?? '',
      email: json[FireKeys.email] ?? '',
      phone: json[FireKeys.phone] ?? '',
      imageProfile: json[FireKeys.imageProfile] ?? '',
      age: json[FireKeys.age] ?? 0,
      job: json[FireKeys.job] ?? '',
      gender: json[FireKeys.gender] ?? 0,
      maritalStatus: json[FireKeys.maritalStatus] ?? 0,

      // 🚫 لا يقرأ من Firestore
      password: '',
      fcmToken: json[FireKeys.fcmToken] ?? '',

      // Financial Info
      balance: (json[FireKeys.balance] ?? 0).toDouble(),
      numberOfPurchase: json[FireKeys.numberOfPurchase] ?? 0,
      totalPurchase: (json[FireKeys.totalPurchase] ?? 0).toDouble(),
      bonus: json[FireKeys.bonus] ?? 0,

      // Account Info
      accountStatus: json[FireKeys.accountStatus] ?? true,
      createdAt: (json[FireKeys.createdAt] as Timestamp?)?.toDate()
          ?? DateTime.now(),
      updatedAt: (json[FireKeys.updatedAt] as Timestamp?)?.toDate()
          ?? DateTime.now(),
      countryCode: CountryCodeExt.fromString(
        json[FireKeys.countryCode] ?? CountryCode.eg.key,
      ),
      cityName: json[FireKeys.cityName] ?? '',
      isAndroid: json[FireKeys.isAndroid] ?? true,
      lastTimeOpenedApp:
      (json[FireKeys.lastTimeOpenedApp] as Timestamp?)?.toDate(),
      notificationsEnabled: json[FireKeys.notificationsEnabled] ?? true,

      // Learning Info
      riwayah: RiwayahExt.fromString(
        json[FireKeys.riwayah] ?? Riwayah.hafsAnAsim.key,
      ),
      level: UserLevelExt.fromString(
        json[FireKeys.level] ?? UserLevel.beginner.key,
      ),
      language: LanguagesExt.fromString(
        json[FireKeys.language] ?? Languages.ar.key,
      ),
      totalMemorizedSurah: json[FireKeys.totalMemorizedSurah] ?? 0,
      totalReadSurah: json[FireKeys.totalReadSurah] ?? 0,
      learningMapIds:
      List<String>.from(json[FireKeys.learningMapIds] ?? []),

      // Sessions Info
      totalPrivetSessions: json[FireKeys.totalPrivetSessions] ?? 0,
      totalGroupSessions: json[FireKeys.totalGroupSessions] ?? 0,

      // Rating & Reviews
      rating: (json[FireKeys.rating] ?? 0).toDouble(),
      totalRating: (json[FireKeys.totalRating] ?? 0).toDouble(),
      totalReviews: json[FireKeys.totalReviews] ?? 0,
      rank: json[FireKeys.rank] ?? 0,

      // Favorites
      favoriteTeacherIds:
      List<String>.from(json[FireKeys.favoriteTeacherIds] ?? []),
      sessionRecordingEnabled: json[FireKeys.sessionRecordingEnabled] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // Personal Info
      FireKeys.name: name,
      FireKeys.email: email,
      if (phone != null) FirebaseConstants.phone: phone,
      if (imageProfile != null) FirebaseConstants.imageProfile: imageProfile,
      FireKeys.age: age,
      if (job != null) FirebaseConstants.job: job,
      FireKeys.gender: gender,
      if (maritalStatus != null) FirebaseConstants.maritalStatus: maritalStatus,
      FirebaseConstants.password: password,
      if (fcmToken != null) FirebaseConstants.fcmToken: fcmToken,

      // Financial Info
      FireKeys.balance: balance,
      FireKeys.numberOfPurchase: numberOfPurchase,
      FireKeys.totalPurchase: totalPurchase,
      FireKeys.bonus: bonus,

      // Account Info
      FireKeys.accountStatus: accountStatus,
      FireKeys.createdAt: Timestamp.fromDate(createdAt),
      FireKeys.updatedAt: Timestamp.fromDate(updatedAt),
      FireKeys.countryCode: countryCode.key,
      FireKeys.cityName: cityName,
      FireKeys.isAndroid: isAndroid,
      if (lastTimeOpenedApp != null)
        FirebaseConstants.lastTimeOpenedApp: Timestamp.fromDate(lastTimeOpenedApp!),
      FireKeys.notificationsEnabled: notificationsEnabled,

      // Learning Info
      FireKeys.riwayah: riwayah.key,
      FireKeys.level: level.key,
      FireKeys.language: language.key,
      FireKeys.totalMemorizedSurah: totalMemorizedSurah,
      FireKeys.totalReadSurah: totalReadSurah,
      FireKeys.learningMapIds: learningMapIds,

      // Sessions Info
      FireKeys.totalPrivetSessions: totalPrivetSessions,
      FireKeys.totalGroupSessions: totalGroupSessions,

      // Rating & Reviews
      FireKeys.rating: rating,
      FireKeys.totalRating: totalRating,
      FireKeys.totalReviews: totalReviews,
      FireKeys.rank: rank,

      // Favorites
      if (favoriteTeacherIds != null)
        FireKeys.favoriteTeacherIds: favoriteTeacherIds,
      FireKeys.sessionRecordingEnabled: sessionRecordingEnabled,
    };
  }

  // ========== CopyWith Method ==========
  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? imageProfile,
    int? age,
    String? job,
    int? gender,
    int? maritalStatus,
    String? password,
    String? fcmToken,
    double? balance,
    int? numberOfPurchase,
    bool? accountStatus,
    DateTime? createdAt,
    DateTime? updatedAt,
    CountryCode? countryCode,
    String? cityName,
    bool? isAndroid,
    DateTime? lastTimeOpenedApp,
    bool? notificationsEnabled,
    Riwayah? riwayah,
    int? totalPrivetSessions,
    int? totalGroupSessions,
    int? bonus,
    int? rank,
    UserLevel? level,
    Languages? language,
    double? totalPurchase,
    int? totalMemorizedSurah,
    int? totalReadSurah,
    List<String>? learningMapIds,
    List<String>? favoriteTeacherIds,
    double? rating,
    double? totalRating,
    int? totalReviews,
    bool? sessionRecordingEnabled,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      imageProfile: imageProfile ?? this.imageProfile,
      age: age ?? this.age,
      job: job ?? this.job,
      gender: gender ?? this.gender,
      maritalStatus: maritalStatus ?? this.maritalStatus,
      password: password ?? this.password,
      fcmToken: fcmToken ?? this.fcmToken,
      balance: balance ?? this.balance,
      numberOfPurchase: numberOfPurchase ?? this.numberOfPurchase,
      accountStatus: accountStatus ?? this.accountStatus,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      countryCode: countryCode ?? this.countryCode,
      cityName: cityName ?? this.cityName,
      isAndroid: isAndroid ?? this.isAndroid,
      lastTimeOpenedApp: lastTimeOpenedApp ?? this.lastTimeOpenedApp,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      riwayah: riwayah ?? this.riwayah,
      totalPrivetSessions: totalPrivetSessions ?? this.totalPrivetSessions,
      totalGroupSessions: totalGroupSessions ?? this.totalGroupSessions,
      bonus: bonus ?? this.bonus,
      rank: rank ?? this.rank,
      level: level ?? this.level,
      language: language ?? this.language,
      totalPurchase: totalPurchase ?? this.totalPurchase,
      totalMemorizedSurah: totalMemorizedSurah ?? this.totalMemorizedSurah,
      totalReadSurah: totalReadSurah ?? this.totalReadSurah,
      learningMapIds: learningMapIds ?? this.learningMapIds,
      favoriteTeacherIds: favoriteTeacherIds ?? this.favoriteTeacherIds,
      rating: rating ?? this.rating,
      totalRating: totalRating ?? this.totalRating,
      totalReviews: totalReviews ?? this.totalReviews,
      sessionRecordingEnabled: sessionRecordingEnabled ?? this.sessionRecordingEnabled,
    );
  }

  // ========== Helper Methods ==========

  /// Is Male
  bool get isMale => gender == 0;

  /// Is Female
  bool get isFemale => gender == 1;

  /// Total Sessions
  int get totalSessions => totalPrivetSessions + totalGroupSessions;

  /// Average Rating
  double get averageRating => totalReviews > 0 ? totalRating / totalReviews : 0;

  /// Add Rating
  UserModel addRating(double newRating) {
    return copyWith(
      totalRating: totalRating + newRating,
      totalReviews: totalReviews + 1,
      rating: (totalRating + newRating) / (totalReviews + 1),
    );
  }

  /// Add Favorite Teacher
  UserModel addFavoriteTeacher(String teacherId) {
    final currentFavorites = favoriteTeacherIds ?? [];
    if (currentFavorites.contains(teacherId)) return this;

    return copyWith(
      favoriteTeacherIds: [...currentFavorites, teacherId],
    );
  }

  /// Remove Favorite Teacher
  UserModel removeFavoriteTeacher(String teacherId) {
    final currentFavorites = favoriteTeacherIds ?? [];
    return copyWith(
      favoriteTeacherIds: currentFavorites.where((id) => id != teacherId).toList(),
    );
  }

  /// Update Balance
  UserModel updateBalance(double amount) {
    return copyWith(
      balance: balance + amount,
      updatedAt: DateTime.now(),
    );
  }

  UserModel updateNotificationsStatus(bool isEnabled){
    return copyWith(
      notificationsEnabled: isEnabled,
      updatedAt: DateTime.now(),
    );
  }

  /// Increment Private Sessions
  UserModel incrementPrivateSessions() {
    return copyWith(
      totalPrivetSessions: totalPrivetSessions + 1,
      updatedAt: DateTime.now(),
    );
  }

  UserModel incrementGroupSessions() {
    return copyWith(
      totalGroupSessions: totalGroupSessions + 1,
      updatedAt: DateTime.now(),
    );
  }

  /// Update Last Opened
  UserModel updateLastOpened() {
    return copyWith(
      lastTimeOpenedApp: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  /// Complete Profile
  UserModel completeProfile(){
    return copyWith(
      name: name,
      age: age,
      job: job,
      gender: gender,
      maritalStatus: maritalStatus,
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    email,
    phone,
    imageProfile,
    age,
    job,
    gender,
    maritalStatus,
    password,
    fcmToken,
    balance,
    numberOfPurchase,
    accountStatus,
    createdAt,
    updatedAt,
    countryCode,
    cityName,
    isAndroid,
    lastTimeOpenedApp,
    riwayah,
    totalPrivetSessions,
    totalGroupSessions,
    bonus,
    rank,
    level,
    language,
    totalPurchase,
    totalMemorizedSurah,
    totalReadSurah,
    learningMapIds,
    favoriteTeacherIds,
    rating,
    totalRating,
    totalReviews,
  ];
}
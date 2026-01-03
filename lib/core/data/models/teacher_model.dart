import 'package:almuhafiz_teachers/core/data/enums/country_code.dart';
import 'package:almuhafiz_teachers/core/data/enums/languages.dart';
import 'package:almuhafiz_teachers/core/data/enums/riwayah.dart';
import 'package:almuhafiz_teachers/core/data/enums/teacher_status.dart';
import 'package:almuhafiz_teachers/core/networking/firebase_keys.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class TeacherModel extends Equatable {
  final String id;
  final String name;
  final String bio;
  final String email;
  final String phone;
  final String? imageProfile;
  final int age;
  final int numberOfRate;
  final double rate;
  final int totalReviews;
  final String job;
  final int gender;
  final String password;
  final String? fcmToken;
  final double balance;
  final List<DateTime> workingTimes;
  final TeacherStatus status;
  final bool accountStatus;
  final CountryCode countryCode;
  final String cityName;
  final bool isAndroid;
  final DateTime? lastTimeOpenedApp;
  final List<Riwayah> riwayat;
  final int totalPrivetSessions;
  final int totalGroupSessions;
  final int bonus;
  final int? rank;
  final bool reviewedByAdmin;
  final Languages language;
  final List<String> learningMapIds;
  final List<String> worksInAnotherApps;
  final List<String> socialLinks;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const TeacherModel({
    required this.id,
    required this.name,
    required this.bio,
    required this.email,
    required this.phone,
    this.imageProfile,
    required this.age,
    required this.numberOfRate,
    required this.rate,
    required this.totalReviews,
    required this.job,
    required this.gender,
    required this.workingTimes,
    this.fcmToken,
    this.password = '',
    required this.balance,
    required this.status,
    required this.accountStatus,
    this.createdAt,
    this.updatedAt,
    required this.countryCode,
    required this.cityName,
    required this.isAndroid,
    this.lastTimeOpenedApp,
    required this.riwayat,
    required this.totalPrivetSessions,
    required this.totalGroupSessions,
    required this.bonus,
    required this.rank,
    required this.language,
    required this.learningMapIds,
    required this.worksInAnotherApps,
    required this.socialLinks,
    required this.reviewedByAdmin,
  });


  factory TeacherModel.fromJson(Map<String, dynamic> map) {
    return TeacherModel(
      id: map[FireKeys.id] ?? '',
      name: map[FireKeys.name] ?? '',
      bio: map[FireKeys.bio] ?? '',
      email: map[FireKeys.email] ?? '',
      phone: map[FireKeys.phone] ?? '',
      imageProfile: map[FireKeys.imageProfile],
      age: map[FireKeys.age] ?? 0,
      numberOfRate: map[FireKeys.numberOfRate] ?? 0,
      rate: (double.tryParse(
          ((map[FireKeys.rate] as num?) ?? 0.00).toStringAsFixed(2)) ?? 0),
      totalReviews: map[FireKeys.totalReviews] ?? 0,
      job: map[FireKeys.job] ?? '',
      gender: map[FireKeys.gender] ?? 0,
      password: map[FireKeys.password] ?? '',
      fcmToken: map[FireKeys.fcmToken],
      balance: (map[FireKeys.balance] ?? 0).toDouble(),
      workingTimes: (map[FireKeys.workingTimes] as List<dynamic>? ?? [])
          .map((e) =>
      e is Timestamp ? e.toDate() : DateTime.parse(e.toString()))
          .toList(),
      status: TeacherStatusExt.fromString(map[FireKeys.status] ?? ''),
      accountStatus: map[FireKeys.accountStatus] ?? false,
      countryCode: CountryCodeExt.fromString(map[FireKeys.countryCode] ?? ''),
      cityName: map[FireKeys.cityName] ?? '',
      isAndroid: map[FireKeys.isAndroid] ?? false,
      lastTimeOpenedApp: map[FireKeys.lastTimeOpenedApp] != null
          ? (map[FireKeys.lastTimeOpenedApp] as Timestamp).toDate()
          : null,
      riwayat: (map[FireKeys.riwayat] as List<dynamic>? ?? [])
          .map((e) => RiwayahExt.fromString(e.toString()))
          .toList(),
      totalPrivetSessions: map[FireKeys.totalPrivetSessions] ?? 0,
      totalGroupSessions: map[FireKeys.totalGroupSessions] ?? 0,
      bonus: map[FireKeys.bonus] ?? 0,
      rank: map[FireKeys.rank],
      reviewedByAdmin: map[FireKeys.reviewedByAdmin] ?? false,
      language: LanguagesExt.fromString(map[FireKeys.language] ?? ''),
      learningMapIds: (map[FireKeys.learningMapIds] as List<dynamic>? ?? [])
          .map((e) =>
      e is Map<String, dynamic> ? e[FireKeys.id] as String : e.toString())
          .toList(),
      worksInAnotherApps: (map[FireKeys.worksInAnotherApps] as List<dynamic>? ??
          []).map((e) => e.toString()).toList(),
      socialLinks: (map[FireKeys.socialLinks] as List<dynamic>? ?? []).map((
          e) => e.toString()).toList(),
      createdAt: map[FireKeys.createdAt] != null
          ? (map[FireKeys.createdAt] as Timestamp).toDate()
          : null,
      updatedAt: map[FireKeys.updatedAt] != null
          ? (map[FireKeys.updatedAt] as Timestamp).toDate()
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      FireKeys.id: id,
      FireKeys.name: name,
      FireKeys.bio: bio,
      FireKeys.email: email,
      FireKeys.phone: phone,
      FireKeys.imageProfile: imageProfile,
      FireKeys.age: age,
      FireKeys.numberOfRate: numberOfRate,
      FireKeys.rate: rate,
      FireKeys.totalReviews : totalReviews,
      FireKeys.job: job,
      FireKeys.gender: gender,
      FireKeys.password: password,
      FireKeys.fcmToken: fcmToken,
      FireKeys.balance: balance,
      FireKeys.workingTimes: workingTimes
          .map((e) => Timestamp.fromDate(e))
          .toList(),
      FireKeys.status: status.key,
      FireKeys.accountStatus: accountStatus,
      FireKeys.countryCode: countryCode.key,
      FireKeys.cityName: cityName,
      FireKeys.isAndroid: isAndroid,
      FireKeys.lastTimeOpenedApp: lastTimeOpenedApp != null ? Timestamp
          .fromDate(lastTimeOpenedApp!) : null,
      FireKeys.riwayat: riwayat.map((e) => e.key).toList(),
      FireKeys.totalPrivetSessions: totalPrivetSessions,
      FireKeys.totalGroupSessions: totalGroupSessions,
      FireKeys.bonus: bonus,
      FireKeys.rank: rank,
      FireKeys.reviewedByAdmin: reviewedByAdmin,
      FireKeys.language: language.key,
      FireKeys.learningMapIds: learningMapIds,
      FireKeys.worksInAnotherApps: worksInAnotherApps,
      FireKeys.socialLinks: socialLinks,
      FireKeys.createdAt: createdAt != null
          ? Timestamp.fromDate(createdAt!)
          : null,
      FireKeys.updatedAt: updatedAt != null
          ? Timestamp.fromDate(updatedAt!)
          : null,
    };
  }

  bool get isMale => gender == 0;

  TeacherModel copyWith({
    String? id,
    String? name,
    String? bio,
    String? email,
    String? phone,
    String? imageProfile,
    int? age,
    int? numberOfRate,
    double? rate,
    int? totalReviews,
    String? job,
    int? gender,
    String? password,
    String? fcmToken,
    double? balance,
    List<DateTime>? workingTimes,
    TeacherStatus? status,
    bool? accountStatus,
    CountryCode? countryCode,
    String? cityName,
    bool? isAndroid,
    DateTime? lastTimeOpenedApp,
    List<Riwayah>? riwayat,
    int? totalPrivetSessions,
    int? totalGroupSessions,
    int? bonus,
    int? rank,
    bool? reviewedByAdmin,
    Languages? language,
    List<String>? learningMapIds,
    List<String>? worksInAnotherApps,
    List<String>? socialLinks,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return TeacherModel(
        id: id ?? this.id,
        name: name ?? this.name,
        bio: bio ?? this.bio,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        age: age ?? this.age,
        numberOfRate: numberOfRate ?? this.numberOfRate,
        rate: rate ?? this.rate,
        totalReviews : totalReviews ?? this.totalReviews,
        job: job ?? this.job,
        gender: gender ?? this.gender,
        workingTimes: workingTimes ?? this.workingTimes,
        balance: balance ?? this.balance,
        status: status ?? this.status,
        accountStatus: accountStatus ?? this.accountStatus,
        countryCode: countryCode ?? this.countryCode,
        cityName: cityName ?? this.cityName,
        isAndroid: isAndroid ?? this.isAndroid,
        riwayat: riwayat ?? this.riwayat,
        totalPrivetSessions: totalPrivetSessions ?? this.totalPrivetSessions,
        totalGroupSessions: totalGroupSessions ?? this.totalGroupSessions,
        bonus: bonus ?? this.bonus,
        rank: rank ?? this.rank,
        language: language ?? this.language,
        learningMapIds: learningMapIds ?? this.learningMapIds,
        worksInAnotherApps: worksInAnotherApps ?? this.worksInAnotherApps,
        socialLinks: socialLinks ?? this.socialLinks,
        reviewedByAdmin: reviewedByAdmin ?? this.reviewedByAdmin);
  }

  @override
  List<Object?> get props =>
      [
        id,
        name,
        bio,
        email,
        phone,
        imageProfile,
        age,
        numberOfRate,
        rate,
        totalReviews,
        job,
        gender,
        password,
        fcmToken,
        balance,
        workingTimes,
        status,
        accountStatus,
        countryCode,
        cityName,
        isAndroid,
        lastTimeOpenedApp,
        riwayat,
        totalPrivetSessions,
        totalGroupSessions,
        bonus,
        rank,
        reviewedByAdmin,
        language,
        learningMapIds,
        worksInAnotherApps,
        socialLinks,
        createdAt,
        updatedAt
      ];

}

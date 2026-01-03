import 'dart:io';
import 'package:almuhafiz_teachers/core/common/common_snacbar.dart';
import 'package:almuhafiz_teachers/core/data/enums/country_code.dart';
import 'package:almuhafiz_teachers/core/data/enums/languages.dart';
import 'package:almuhafiz_teachers/core/data/enums/teacher_status.dart';
import 'package:almuhafiz_teachers/core/data/models/teacher_model.dart';
import 'package:almuhafiz_teachers/core/mini_models/drop_down_item_model.dart';
import 'package:almuhafiz_teachers/core/navigation/app_routes.dart';
import 'package:almuhafiz_teachers/core/networking/firebase_constants.dart';
import 'package:almuhafiz_teachers/core/services/Auth/auth_service.dart';
import 'package:almuhafiz_teachers/core/services/location/location_service.dart';
import 'package:almuhafiz_teachers/features/auth/pages/register/domain/usecases/register_use_case.dart';
import 'package:almuhafiz_teachers/features/auth/pages/register/presentation/controllers/register_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController implements RegisterManager {
  final RegisterUseCase _registerUserUseCase;
  final AuthService _authService;

  RegisterController(this._registerUserUseCase,this._authService);

  final isLoading = false.obs;
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameCtrl = TextEditingController();
  // final TextEditingController ageCtrl = TextEditingController();
  final TextEditingController phoneCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  final TextEditingController confirmedPassCtrl = TextEditingController();
  final RxBool agreeTerms = RxBool(false);

  @override
  void toggleTerms(bool? newValue) {
    agreeTerms(!agreeTerms.value);
  }

  final selectedMartialStatus = Rx<DropDownItemModel?>(null);

  @override
  void selectMartialStatus(DropDownItemModel newDepartment) {
    selectedMartialStatus(newDepartment);
  }


  @override
  Future<void> register() async {
    isLoading.value = true;
    Map<String, String>? location;
    try {
      location = await LocationService.getLocation();
    }catch(_){

    }
    final teacherModel = TeacherModel(
      id: '',
      name: nameCtrl.text,
      email: emailCtrl.text,
      password: passwordCtrl.text,
      age: 0,
      job: '',
      gender: 0,
      balance: 0,
      worksInAnotherApps: [],
      totalPrivetSessions: 0,
      totalGroupSessions: 0,
      countryCode: CountryCodeExt.fromString(location?['countryCode'] ?? CountryCode.eg.key),
      cityName: location?['city'] ?? '',
      isAndroid: Platform.isAndroid,
      lastTimeOpenedApp: DateTime.now(),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      accountStatus: true,
      rank: 0,
      bonus: 0,
      totalReviews: 0,
      rate: 0,
      numberOfRate: 0,
      learningMapIds: [],
      language: Languages.ar,
      socialLinks: [],
      reviewedByAdmin: false,
      bio: '',
      status: TeacherStatus.notFound,
      workingTimes: [],
      riwayat: [],
      imageProfile: '',
      phone: phoneCtrl.text,
      fcmToken: '',
    );
    final signUpOrFailure = await _registerUserUseCase(teacherModel);
    isLoading.value = false;
    signUpOrFailure.fold((l) {
      CommonSnackBar.error(firebaseArabicMessages[l.message] ?? l.message);
    }, (r) {
      // _authService.signIn(r);
      Get.offAllNamed(AppRoutes.completeProfile, arguments: r);
    },);
  }
}

import 'package:almuhafiz_teachers/core/services/Auth/auth_service.dart';
import 'package:almuhafiz_teachers/features/auth/pages/completeProfile/presentation/controllers/complete_profile_controller.dart';
import 'package:almuhafiz_teachers/features/auth/pages/register/data/data_source/register_data_source.dart';
import 'package:almuhafiz_teachers/features/auth/pages/register/data/repository/register_repo_imp.dart';
import 'package:almuhafiz_teachers/features/auth/pages/register/domain/repository/register_repository.dart';
import 'package:almuhafiz_teachers/features/auth/pages/register/domain/usecases/complete_profile_usecase.dart';
import 'package:get/get.dart';

class CompleteProfileBindings extends Bindings{
  @override
  void dependencies() {

    final registerDataSource = Get.put<RegisterDataSource>(RegisterDataSource());
    final registerRepo = Get.put<RegisterRepository>(RegisterRepoImp(registerDataSource));
    Get.put(CompleteProfileUseCase(registerRepo));

    Get.put(CompleteProfileController(Get.find<CompleteProfileUseCase>(), Get.find<AuthService>(), Get.find()));
  }
}
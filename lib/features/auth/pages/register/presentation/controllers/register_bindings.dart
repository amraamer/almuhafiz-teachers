import 'package:almuhafiz_teachers/core/services/Auth/auth_service.dart';
import 'package:almuhafiz_teachers/features/auth/pages/register/data/data_source/register_data_source.dart';
import 'package:almuhafiz_teachers/features/auth/pages/register/data/repository/register_repo_imp.dart';
import 'package:almuhafiz_teachers/features/auth/pages/register/domain/repository/register_repository.dart';
import 'package:almuhafiz_teachers/features/auth/pages/register/domain/usecases/register_use_case.dart';
import 'package:almuhafiz_teachers/features/auth/pages/register/presentation/controllers/register_controller.dart';
import 'package:get/get.dart';

class RegisterBindings extends Bindings {
  @override
  void dependencies() {
    final dataSource = Get.put<RegisterDataSource>(RegisterDataSource());
    final repo = Get.put<RegisterRepository>(RegisterRepoImp(dataSource));
    final registerUseCase = Get.put<RegisterUseCase>(RegisterUseCase(repo));
    Get.put(
      RegisterController(
        registerUseCase,
        Get.find<AuthService>(),
      ),
    );
  }
}

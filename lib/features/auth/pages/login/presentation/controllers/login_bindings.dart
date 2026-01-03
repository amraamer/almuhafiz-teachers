import 'package:almuhafiz_teachers/core/services/Auth/auth_service.dart';
import 'package:almuhafiz_teachers/features/auth/pages/login/data/data_source/login_data_source.dart';
import 'package:almuhafiz_teachers/features/auth/pages/login/data/repository/login_repo_imp.dart';
import 'package:almuhafiz_teachers/features/auth/pages/login/domain/repository/login_repository.dart';
import 'package:almuhafiz_teachers/features/auth/pages/login/domain/usecases/login_use_case.dart';
import 'package:almuhafiz_teachers/features/auth/pages/login/domain/usecases/login_with_apple_use_case.dart';
import 'package:almuhafiz_teachers/features/auth/pages/login/domain/usecases/login_with_google_use_case.dart';
import 'package:almuhafiz_teachers/features/auth/pages/login/presentation/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    final loginDataSource = Get.put<LoginDataSource>(LoginDataSource());
    final loginRepo = Get.put<LoginRepository>(LoginRepoImp(loginDataSource));
    final loginUseCase = Get.put<LoginUseCase>(LoginUseCase(loginRepo));
    final loginWithGoogleUseCase = Get.put<LoginWithGoogleUseCase>(LoginWithGoogleUseCase(loginRepo));
    final loginWithAppleUseCase = Get.put<LoginWithAppleUseCase>(LoginWithAppleUseCase(loginRepo));
    Get.put(
      LoginController(
        loginUseCase,
        Get.find<AuthService>(),
        loginWithGoogleUseCase,
        loginWithAppleUseCase,
      ),
    );
  }
}

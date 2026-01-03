import 'package:almuhafiz_teachers/core/networking/firebase_service.dart';
import 'package:almuhafiz_teachers/core/services/Auth/auth_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppInitBindings extends Bindings {
  @override
  void dependencies() {

    Get.put<FirebaseService>(FirebaseService());
    Get.put<GetStorage>(GetStorage());
    Get.put<AuthService>(AuthService());
    // Get.put<FavoriteService>(FavoriteService(getStorage , authService));
    // Get.put<ConnectionController>(ConnectionController());
    // Get.put<AgoraServices>(AgoraServices(), permanent: true);

    // Get.put(LoginRepo(Get.find<FirebaseService>()));
    // Get.put(
    //   LoginController(
    //     Get.find<LoginRepo>(),
    //   ),
    // );
    //

    // Get.lazyPut<MainController>(
    //   () => MainController(),
    //   fenix: true,
    // );
    //
    // Get.lazyPut<TopStudentsController>(
    //   () => TopStudentsController(),
    //   fenix: true,
    // );
    //
    // Get.lazyPut<TopTeachersController>(
    //   () => TopTeachersController(),
    //   fenix: true,
    // );
    //
    // Get.lazyPut<PackagesController>(
    //       () => PackagesController(),
    //   fenix: true,
    // );

    //
    // /// APP INFO BINDINGS
    // Get.lazyPut<AppInfoDataSource>(
    //   () => AppInfoDataSource(),
    //   fenix: true,
    // );
    // Get.lazyPut<AppInfoRepo>(
    //   () => AppInfoRepoImp(
    //     Get.find<AppInfoDataSource>(),
    //   ),
    //   fenix: true,
    // );
    // Get.lazyPut<AppInfoController>(
    //   () => AppInfoController(
    //     Get.find<AppInfoRepo>(),
    //     Get.find<MainScreenController>()
    //   ),
    //   fenix: true,
    // );


    /// Controllers
    // Get.lazyPut(() => AuthController(), fenix: true);
  }
}

import 'package:almuhafiz_teachers/features/bottom_nav/presentation/controllers/bottom_nav_controller.dart';
import 'package:get/get.dart';

class BottomNavBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<BottomNavController>(() => BottomNavController());
  }
}
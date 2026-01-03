import 'package:almuhafiz_teachers/features/auth/pages/learningAndRewayah/presentation/controllers/learning_and_riwayah_controller.dart';
import 'package:get/get.dart';

class LearningAndRiwayahBindings extends Bindings {
  @override
  void dependencies() {
   Get.put(LearningAndRiwayahController());
  }
}

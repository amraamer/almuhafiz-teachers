import 'package:almuhafiz_teachers/core/mini_models/drop_down_item_model.dart';

abstract class RegisterManager {

  void toggleTerms(bool? newValue);
  void selectMartialStatus(DropDownItemModel newDepartment);
  void register();
}
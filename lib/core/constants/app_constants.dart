import 'package:almuhafiz_teachers/core/constants/app_links.dart';
import 'package:almuhafiz_teachers/core/constants/app_strings.dart';
import 'package:almuhafiz_teachers/core/data/enums/riwayah.dart';
import 'package:almuhafiz_teachers/core/mini_models/drop_down_item_model.dart';

abstract class AppConstantsData {
  static const String shareAppText = """
تطبيق بشرى لتفسير الرؤى والأحلام، يضم نخبة من المفسرين المعتمدين لتقديم تفسيرات دقيقة لأحلامكم، بالإضافة إلى كتاب شامل لتفسير الرموز ومدونة تحتوي على مقالات مفيدة.  لتحميل التطبيق على  الأيفون
  ${AppConstantLinks.appStoreLink}
                            
  لتحميل التطبيق على الأندرويد 
  ${AppConstantLinks.playStoreLink}
  """;

  static const String loginFirstToAddNewDream = 'يجب عليك تسجيل الدخول اولاً حتى تممكن من أضافة أحلمك';

  static final List<DropDownItemModel> martialStatusForMen = [
    DropDownItemModel(title: "اعزب", value: 0),
    DropDownItemModel(title: "متزوج", value: 1),
    DropDownItemModel(title: "مطلق", value: 2),
    DropDownItemModel(title: "أرمل", value: 3),
  ];

  static final List<DropDownItemModel> martialStatusForWomen = [
    DropDownItemModel(title: "عزباء", value: 0),
    DropDownItemModel(title: "متزوجة", value: 1),
    DropDownItemModel(title: "مطلقة", value: 2),
    DropDownItemModel(title: "عزباء", value: 3),
  ];

  static final List<DropDownItemModel> genders = [
    DropDownItemModel(title: AppStrings.instance.male, value: 0),
    DropDownItemModel(title: AppStrings.instance.female, value: 1),
  ];

  static final List<DropDownItemModel> riwayat = [
    DropDownItemModel(title: Riwayah.hafsAnAsim.label, value: 0),
    DropDownItemModel(title: Riwayah.warshAnNafi.label, value: 1),
    DropDownItemModel(title: Riwayah.qalunAnNafi.label, value: 2),
    DropDownItemModel(title: Riwayah.adDuriAnAbiAmr.label, value: 3),
  ];


  //Dev Info
  static final String phoneNumber = "01016638162";
  static final String whatsAppNumber = "01553190757";


  //Get Storge keys
  static final String isDarkMode = "isDarkMode";

}

import 'package:almuhafiz_teachers/features/home/presentation/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavController extends GetxController {

  RxInt currentIndex = 0.obs;
  final List<Widget> pages = const [
    HomePage(),
    // TeachersPage(),
    // PlansPage(),
    // SessionsPage(),
    // ProfilePage()
  ];

  void changeIndex(int index) {
    currentIndex.value = index;
    update();
  }
}
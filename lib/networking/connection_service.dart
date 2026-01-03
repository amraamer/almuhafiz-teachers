// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class ConnectionController extends GetxController {
//   final Connectivity _connectivity = Connectivity();
//   final isConnected = RxBool(true);
//   bool firstTime = true;
//
//   @override
//   void onInit() {
//     super.onInit();
//     initConnection();
//   }
//
//   void initConnection() async {
//     isConnected(await checkConnection());
//     _connectivity.onConnectivityChanged.listen(_updateConnection);
//   }
//
//   void _updateConnection(List<ConnectivityResult> connectivityResults) {
//     if (firstTime) {
//       firstTime = false;
//     } else {
//       // final loginController = Get.find<LoginController>();
//       // final exploreController = Get.find<ExploreController>();
//       if (connectivityResults.contains(ConnectivityResult.mobile) ||
//           connectivityResults.contains(ConnectivityResult.wifi) ||
//           connectivityResults.contains(ConnectivityResult.ethernet)) {
//         debugPrint("ConnectionController => Connected");
//         // loginController.checkUserAuthentication();
//         // exploreController.getBanners();
//         isConnected(true);
//       } else {
//         debugPrint("ConnectionController => Not Connected");
//         isConnected(false);
//       }
//     }
//   }
//
//   Future<bool> checkConnection() async {
//     final results = await _connectivity.checkConnectivity();
//     if (!results.contains(ConnectivityResult.mobile) &&
//         !results.contains(ConnectivityResult.wifi) &&
//         !results.contains(ConnectivityResult.ethernet)) {
//       return false;
//     } else {
//       return true;
//     }
//   }
// }

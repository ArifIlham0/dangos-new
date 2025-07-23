import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class ConnectionController extends GetxController {
  late StreamSubscription<List<ConnectivityResult>> connectivitySubscription;
  List<ConnectivityResult>? results;

  var isConnected = false.obs;
  var isCheckingConnection = true.obs;

  @override
  void onInit() {
    super.onInit();
    initConnectivity();
    connectivitySubscription = Connectivity().onConnectivityChanged.listen(updateConnectionStatus);
  }

  Future<void> initConnectivity() async {
    isCheckingConnection(true);

    try {
      results = await Connectivity().checkConnectivity();
    } catch (e) {
      results = [ConnectivityResult.none];
    }

    return updateConnectionStatus(results ?? [ConnectivityResult.none]);
  }

  Future<void> updateConnectionStatus(List<ConnectivityResult> results) async {
    isConnected.value = results.contains(ConnectivityResult.mobile) || results.contains(ConnectivityResult.wifi);
    isCheckingConnection(false);
  }

  void retryConnection() async {
    initConnectivity();
  }

  @override
  void onClose() {
    connectivitySubscription.cancel();
    super.onClose();
  }
}

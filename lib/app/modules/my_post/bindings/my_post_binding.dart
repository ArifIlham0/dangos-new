import 'package:get/get.dart';

import '../controllers/my_post_controller.dart';

class MyPostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyPostController>(
      () => MyPostController(),
    );
  }
}

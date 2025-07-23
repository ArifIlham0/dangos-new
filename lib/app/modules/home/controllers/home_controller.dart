import 'package:dangos/app/data/models/responses/posts_response.dart';
import 'package:dangos/app/data/services/post_service.dart';
import 'package:dangos/common/common_export.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final globalController = Get.find<GlobalController>();
  late ScrollController scrollController;
  late ScrollController innerScrollController;

  var pinnedAppBar = true.obs;
  var listPosts = <DatumPost>[].obs;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    innerScrollController = ScrollController();
  }

  @override
  void onReady() {
    super.onReady();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    try {
      globalController.isLoading(true);
      final response = await PostService().fetchPosts();
      if (response.status == 200) {
        listPosts.assignAll(response.data ?? []);
      }
    } finally {
      globalController.isLoading(false);
    }
  }

  Future<void> toggleLike(int id) async {
    try {
      globalController.isLoading(true);
      final response = await PostService().toggleLike(id);

      fetchPosts();

      if (response.status != 200) {
        Get.snackbar(
          "Error",
          response.message ?? "Something went wrong",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } finally {
      globalController.isLoading(false);
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    innerScrollController.dispose();
    super.onClose();
  }
}

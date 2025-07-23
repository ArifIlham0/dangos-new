import 'package:dangos/app/modules/home/widgets/custom_post_card.dart';
import 'package:dangos/app/routes/app_pages.dart';
import 'package:dangos/common/common_export.dart';
import 'package:dangos/core/core_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgWhite,
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is UserScrollNotification) {
            final direction = notification.direction;
            if (direction != ScrollDirection.idle) {
              controller.pinnedAppBar.value = direction == ScrollDirection.forward;
            }
          }
          return false;
        },
        child: Scrollbar(
          controller: controller.scrollController,
          child: NestedScrollView(
            controller: controller.scrollController,
            physics: const BouncingScrollPhysics(),
            headerSliverBuilder: (context, isScrolled) {
              return [
                MainAppBar(
                  pinnedAppBar: controller.pinnedAppBar,
                  leadingIcon: SvgPicture.asset(AppIcons.bell),
                  title: "explore".tr,
                  actionIcon: SvgPicture.asset(AppIcons.person),
                  onTapLeading: () {},
                  onTapAction: () => Get.toNamed(Routes.EDIT_PROFILE),
                ),
              ];
            },
            body: Padding(
              padding: EdgeInsets.fromLTRB(0, 10.h, 0, 20.h),
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  CupertinoSliverRefreshControl(
                    builder: (context, refreshState, pulledExtent, refreshTriggerPullDistance, refreshIndicatorExtent) {
                      return SizedBox(
                        height: 40.h,
                        width: 40.h,
                        child: Lottie.asset("assets/lotties/loading.json"),
                      );
                    },
                    onRefresh: () async {
                      await controller.fetchPosts();
                    },
                  ),
                  Obx(() {
                    if (controller.listPosts.isEmpty && !controller.globalController.isLoading.value) {
                      return SliverList(
                        delegate: SliverChildListDelegate([
                          CustomNoData(title: "no_yet".trParams({"value": "posts".tr})),
                        ]),
                      );
                    } else {
                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: controller.listPosts.length,
                          (context, index) {
                            final data = controller.listPosts[index];
                            final apps = data.apps ?? [];

                            return customPostCard(
                              data,
                              apps,
                              onTapDetail: () => Get.toNamed(Routes.DETAIL_POST),
                              onTapLike: () => controller.toggleLike(data.id ?? 0),
                            );
                          },
                        ),
                      );
                    }
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dangos/app/data/data_export.dart';
import 'package:dangos/app/modules/edit_profile/widgets/custom_transparent_field.dart';
import 'package:dangos/common/common_export.dart';
import 'package:dangos/core/core_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: bgWhite,
        body: Stack(
          children: [
            Image.asset(AppImages.appBarBackground, 
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            RefreshIndicator(
              backgroundColor: bgWhite,
              color: blue,
              onRefresh: () async {
                controller.fetchProfile();
              },
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).padding.top + 100.h),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 50.h,
                          ),
                          decoration: BoxDecoration(
                            color: lightBlue,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50.w),
                              topRight: Radius.circular(50.w),
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(60.w, 20.h, 60.w, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Obx(() => Text(
                                          controller.profileData.value.data?.likesCount.toString() ?? "0", 
                                          style: textStyles(15, bgBlack, bold),
                                        )),
                                        Text(
                                          "likes".tr,
                                          style: textStyles(13, bgBlack, regular),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Obx(() => Text(
                                          controller.profileData.value.data?.point.toString() ?? "0",
                                          style: textStyles(15, bgBlack, bold),
                                        )),
                                        Text(
                                          "points".tr,
                                          style: textStyles(13, bgBlack, regular),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Obx(() {
                                return CustomTransparentField(
                                  name: controller.nameC,
                                  bio: controller.bioC,
                                  hintText: "name".tr,
                                  isEditing: controller.isEditing.value,
                                );
                              }),
                              SizedBox(height: 10.h),
                              Obx(() {
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                                  child: CustomTransparentField(
                                    name: controller.bioC,
                                    bio: controller.bioC,
                                    isEditing: controller.isEditing.value,
                                    fontSize: 13,
                                    color: lightBlack,
                                    fontWeight: regular,
                                    width: double.infinity,
                                    hintText: "no_bio".tr,
                                  ),
                                );
                              }),
                              SizedBox(height: 10.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Email",
                                    style: textStyles(11, bgBlack, regular),
                                  ),
                                  SizedBox(width: 5.w),
                                  SvgPicture.asset(AppIcons.checklist),
                                ],
                              ),
                              SizedBox(height: 15.h),
                              Obx(() {
                                final isEditing = controller.isEditing.value;
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomButton(
                                      title: isEditing ? "cancel".tr : "edit".tr,
                                      onPressed: () {
                                        if (isEditing) {
                                          customDialog(
                                            context, 
                                            title: "want_to_discard".tr, 
                                            onConfirm: () {
                                              Get.back();
                                              controller.fetchProfile();
                                            },
                                          );
                                        } else {
                                          controller.isEditing(true);
                                        }
                                      },
                                      width: isEditing ? 90.w : null,
                                    ),
                                    SizedBox(width: 25.w),
                                    CustomButton(
                                      title: isEditing ? "save".tr : "verify".tr,
                                      color: blue,
                                      textColor: bgWhite,
                                      onPressed:() {
                                        if (isEditing) {
                                          customDialog(
                                            context, 
                                            title: "want_to_update".tr, 
                                            onConfirm: () {
                                              Get.back();
                                              controller.updateProfile(
                                                UserRequest(
                                                  uuid: controller.profileData.value.data?.uuid ?? "",
                                                  name: controller.nameC.text,
                                                  bio: controller.bioC.text,
                                                  imageUrl: controller.pickedImage.value.path,
                                                ),
                                              );
                                            },
                                          );
                                        } else {
                                          // Verify email
                                        }
                                      },
                                    ),
                                  ],
                                );
                              }),
                              SizedBox(height: 15.h),
                              Text(
                                "comments".tr,
                                style: textStyles(13, bgBlack, regular),
                              ),
                              Container(
                                height: 3.h,
                                width: 15.w,
                                decoration: BoxDecoration(
                                  color: lightBlack,
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                ),
                              ),
                              SizedBox(height: 15.h),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: bgWhite,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50.w),
                                    topRight: Radius.circular(50.w),
                                  ),
                                ),
                                child: Obx(() {
                                  if (controller.profileData.value.data != null) {
                                    return Column(
                                      children: List.generate(
                                        controller.profileData.value.data?.comments?.length ?? 0, (index) {
                                          final data = controller.profileData.value.data?.comments?[index];
                                    
                                          return NotifProfileCard(
                                            index: index,
                                            title: data?.name ?? "Anonymous",
                                            message: data?.text ?? "",
                                          );
                                        },
                                      ),
                                    );
                                  } else {
                                    return CustomNoData(height: Get.height * 0.1);
                                  }
                                }),
                              ),
                            ],
                          ),
                        ),
                        Obx(() {
                          return Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: InkWell(
                              onTap: () => controller.pickImage(),
                              child: CircleAvatar(
                                radius: 50.w,
                                backgroundColor: bgWhite,
                                child: CircleAvatar(
                                  radius: 45.w,
                                  backgroundColor: lightBlue,
                                  backgroundImage: controller.pickedImage.value.path.isNotEmpty
                                      ? FileImage(controller.pickedImage.value)
                                      : (controller.profileData.value.data?.imageUrl != null
                                          ? CachedNetworkImageProvider(
                                              controller.profileData.value.data?.imageUrl ?? AppImages.defaultProfile,
                                            )
                                          : AssetImage(AppImages.defaultProfile) as ImageProvider),
                                ),
                              ),
                            ),
                          );
                        }),
                        Positioned(
                          top: 70.h,
                          right: MediaQuery.of(context).size.width / 2 - 40.w,
                          child: Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: bgWhite,
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(AppIcons.pencil, width: 15.w, height: 15.h),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            CustomBackButton(),
          ],
        ),
      ),
    );
  }
}



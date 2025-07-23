import 'dart:io';

import 'package:dangos/app/data/data_export.dart';
import 'package:dangos/common/common_export.dart';
import 'package:dangos/core/core_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  final globalController = Get.find<GlobalController>();

  final nameC = TextEditingController();
  final bioC = TextEditingController();
  var profileData = UserResponse().obs;
  var pickedImage = File("").obs;
  var isEditing = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    fetchProfile();
  }

  void pickImage() async {
    try {
      globalController.isLoading(true);
      final picker = ImagePicker();
      final picked = await picker.pickImage(source: ImageSource.gallery);

      if (picked != null) {
        pickedImage(File(picked.path));
        isEditing(true);
      }
    } finally {
      globalController.isLoading(false);
    }
  }

  Future<void> fetchProfile() async {
    try {
      globalController.isLoading(true);
      final response = await UserService().fetchProfile();

      if (response.status == 200) {
        isEditing(false);
        profileData(response);
        nameC.text = profileData.value.data?.name ?? "Anonymous";
        bioC.text = profileData.value.data?.bio ?? "";
      }
    } finally {
      globalController.isLoading(false);
    }
  }

  Future<void> updateProfile(UserRequest request) async {
    try {
      globalController.isLoading(true);
      final response = await UserService().updateProfile(request);

      if (response.status == 200) {
        pickedImage(File(""));
        fetchProfile();
      } else {
        customSnackbar(response.message ?? "Something went wrong", color: lightRed);
      }
    } finally {
      globalController.isLoading(false);
    }
  }

  @override
  void onClose() {
    nameC.dispose();
    bioC.dispose();
    super.onClose();
  }
}

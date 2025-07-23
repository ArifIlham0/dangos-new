import 'package:dangos/app/data/data_export.dart';
import 'package:dangos/common/common_export.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../modules/detail_post/bindings/detail_post_binding.dart';
import '../modules/detail_post/views/detail_post_view.dart';
import '../modules/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/edit_profile/views/edit_profile_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/my_post/bindings/my_post_binding.dart';
import '../modules/my_post/views/my_post_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static Future<String> getInitialRoute() async {
    final storageHelper = StorageHelper();
    final uuid = await storageHelper.getStorage('uuid');
    if (uuid == null || uuid.isEmpty) {
      final generatedUuid = const Uuid().v4();
      final request = UserRequest(uuid: generatedUuid, name: "Anonymous");
      await storageHelper.setStorage('uuid', generatedUuid);
      await UserService().createUser(request);
      return Routes.MAIN;
    } else {
      return Routes.MAIN;
    }
  }

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: !GetPlatform.isIOS ? Transition.rightToLeft : null,
      transitionDuration: !GetPlatform.isIOS ? const Duration(milliseconds: 100) : null,
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => const MainView(),
      binding: MainBinding(),
      transition: !GetPlatform.isIOS ? Transition.rightToLeft : null,
      transitionDuration: !GetPlatform.isIOS ? const Duration(milliseconds: 100) : null,
    ),
    GetPage(
      name: _Paths.MY_POST,
      page: () => const MyPostView(),
      binding: MyPostBinding(),
      transition: !GetPlatform.isIOS ? Transition.rightToLeft : null,
      transitionDuration: !GetPlatform.isIOS ? const Duration(milliseconds: 100) : null,
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
      transition: !GetPlatform.isIOS ? Transition.rightToLeft : null,
      transitionDuration: !GetPlatform.isIOS ? const Duration(milliseconds: 100) : null,
    ),
    GetPage(
      name: _Paths.DETAIL_POST,
      page: () => const DetailPostView(),
      binding: DetailPostBinding(),
      transition: !GetPlatform.isIOS ? Transition.rightToLeft : null,
      transitionDuration: !GetPlatform.isIOS ? const Duration(milliseconds: 100) : null,
    ),
  ];
}

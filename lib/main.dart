import 'package:dangos/common/common_export.dart';
import 'package:dangos/core/configs/languages/lang.dart';
import 'package:dangos/core/configs/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final initialRoute = await AppPages.getInitialRoute();
  Get.put(GlobalController());

  runApp(
    ScreenUtilInit(
      designSize: const Size(390, 844),
      useInheritedMediaQuery: true,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetBuilder<GlobalController>(
          builder: (controller) {
            return GetMaterialApp(
              title: "Dangos",
              initialRoute: initialRoute,
              getPages: AppPages.routes,
              theme: ThemeData.light(),
              darkTheme: ThemeData.dark(),
              themeMode: ThemeMode.system,
              translations: Language(),
              locale: Locale('en'),
              fallbackLocale: Locale('en'),
              debugShowCheckedModeBanner: false,
              builder: (context, child) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1)),
                  child: Material(
                    child: Obx(() {
                      return Stack(
                        children: [
                          child ?? const SizedBox.shrink(),
                          if (controller.isLoading.value)
                            Positioned.fill(
                              child: Container(
                                color: bgBlack.withAlpha(150),
                                child: LoadingIndicator(),
                              ),
                            ),
                        ],
                      );
                    }),
                  ),
                );
              },
            );
          },
        );
      },
    ),
  );
}

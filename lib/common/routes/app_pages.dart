import 'package:fun_education_app_teacher/app/pages/dashboard-page/dashboard_page_binding.dart';
import 'package:fun_education_app_teacher/app/pages/dashboard-page/dashboard_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/splash-screen/splash_screen_binding.dart';
import 'package:fun_education_app_teacher/app/pages/splash-screen/splash_screen_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.DASHBOARD_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD_PAGE,
      page: () => DashboardPageView(),
      binding: DashboardPageBinding(),
    ),
  ];
}

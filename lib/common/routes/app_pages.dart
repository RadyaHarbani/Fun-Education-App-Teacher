import 'package:fun_education_app_teacher/app/pages/add-siswa-page/add_siswa_page_binding.dart';
import 'package:fun_education_app_teacher/app/pages/add-siswa-page/add_siswa_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/dashboard-page/dashboard_page_binding.dart';
import 'package:fun_education_app_teacher/app/pages/dashboard-page/dashboard_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/detail-kelas-page/detail_kelas_page_binding.dart';
import 'package:fun_education_app_teacher/app/pages/detail-kelas-page/detail_kelas_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/profile-drawer/profile_drawer_binding.dart';
import 'package:fun_education_app_teacher/app/pages/profile-drawer/profile_drawer_view.dart';
import 'package:fun_education_app_teacher/app/pages/splash-screen/splash_screen_binding.dart';
import 'package:fun_education_app_teacher/app/pages/splash-screen/splash_screen_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.DETAIL_KELAS_PAGE;

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
    GetPage(
      name: _Paths.PROFILE_DRAWER,
      page: () => ProfileDrawerView(),
      binding: ProfileDrawerBinding(),
    ),
    GetPage(
      name: _Paths.ADD_SISWA_PAGE,
      page: () => AddSiswaPageView(),
      binding: AddSiswaPageBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_KELAS_PAGE,
      page: () => DetailKelasPageView(),
      binding: DetailKelasPageBinding(),
    ),
  ];
}
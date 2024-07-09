import 'package:fun_education_app_teacher/app/archive/dashboard-page/dashboard_page_binding.dart';
import 'package:fun_education_app_teacher/app/archive/dashboard-page/dashboard_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/add-report-page/add_report_page_binding.dart';
import 'package:fun_education_app_teacher/app/pages/add-report-page/add_report_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/add-student-page/add_student_page_binding.dart';
import 'package:fun_education_app_teacher/app/pages/add-student-page/add_student_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/add-task-page/add_task_page_binding.dart';
import 'package:fun_education_app_teacher/app/pages/add-task-page/add_task_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/detail_class_page_binding.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/detail_class_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/detail-mark-page/detail_mark_page_binding.dart';
import 'package:fun_education_app_teacher/app/pages/detail-mark-page/detail_mark_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/detail-report-page/detail_report_page_binding.dart';
import 'package:fun_education_app_teacher/app/pages/detail-report-page/detail_report_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/detail-task-page/detail_task_page_binding.dart';
import 'package:fun_education_app_teacher/app/pages/detail-task-page/detail_task_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/edit-report-page/edit_report_page_binding.dart';
import 'package:fun_education_app_teacher/app/pages/edit-report-page/edit_report_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/edit-task-page/edit_task_page_binding.dart';
import 'package:fun_education_app_teacher/app/pages/edit-task-page/edit_task_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/home-page/home_page_binding.dart';
import 'package:fun_education_app_teacher/app/pages/home-page/home_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/home-saving-page/home_saving_page_binding.dart';
import 'package:fun_education_app_teacher/app/pages/home-saving-page/home_saving_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/login-page/login_page_binding.dart';
import 'package:fun_education_app_teacher/app/pages/login-page/login_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/profile-drawer/profile_drawer_binding.dart';
import 'package:fun_education_app_teacher/app/pages/profile-drawer/profile_drawer_view.dart';
import 'package:fun_education_app_teacher/app/pages/splash-screen/splash_screen_binding.dart';
import 'package:fun_education_app_teacher/app/pages/splash-screen/splash_screen_view.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME_SAVING_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_PAGE,
      page: () => LoginPageView(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_DRAWER,
      page: () => ProfileDrawerView(),
      binding: ProfileDrawerBinding(),
    ),
    GetPage(
      name: _Paths.ADD_STUDENT_PAGE,
      page: () => AddStudentPageView(),
      binding: AddStudentPageBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_CLASS_PAGE,
      page: () => DetailClassPageView(),
      binding: DetailClassPageBinding(),
    ),
    GetPage(
      name: _Paths.HOME_PAGE,
      page: () => HomePageView(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: _Paths.ADD_TASK_PAGE,
      page: () => AddTaskPageView(),
      binding: AddTaskPageBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_TASK_PAGE,
      page: () => DetailTaskPageView(),
      binding: DetailTaskPageBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_TASK_PAGE,
      page: () => EditTaskPageView(),
      binding: EditTaskPageBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD_PAGE,
      page: () => DashboardPageView(),
      binding: DashboardPageBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_MARK_PAGE,
      page: () => DetailMarkPageView(),
      binding: DetailMarkPageBinding(),
    ),
    GetPage(
      name: _Paths.ADD_REPORT_PAGE,
      page: () => AddReportPageView(),
      binding: AddReportPageBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_REPORT_PAGE,
      page: () => EditReportPageView(),
      binding: EditReportPageBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_REPORT_PAGE,
      page: () => DetailReportPageView(),
      binding: DetailReportPageBinding(),
    ),
    GetPage(
      name: _Paths.HOME_SAVING_PAGE,
      page: () => HomeSavingPageView(),
      binding: HomeSavingPageBinding(),
    ),
  ];
}

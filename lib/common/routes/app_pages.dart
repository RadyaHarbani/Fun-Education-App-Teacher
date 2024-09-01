import 'package:fun_education_app_teacher/app/pages/add-report-page/add_report_page_binding.dart';
import 'package:fun_education_app_teacher/app/pages/add-report-page/add_report_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/add-task-page/add_task_page_binding.dart';
import 'package:fun_education_app_teacher/app/pages/add-task-page/add_task_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/detail-album-photo-page/detail_album_photo_binding.dart';
import 'package:fun_education_app_teacher/app/pages/detail-album-photo-page/detail_album_photo_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/detail_class_page_binding.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/detail_class_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/detail-list-student-page/detail_list_student_page_binding.dart';
import 'package:fun_education_app_teacher/app/pages/detail-list-student-page/detail_list_student_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/detail-mark-page/detail_mark_page_binding.dart';
import 'package:fun_education_app_teacher/app/pages/detail-mark-page/detail_mark_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/detail-report-page/detail_report_page_binding.dart';
import 'package:fun_education_app_teacher/app/pages/detail-report-page/detail_report_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/detail-task-page/detail_task_page_binding.dart';
import 'package:fun_education_app_teacher/app/pages/detail-task-page/detail_task_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/detail-unverified-student-page/detail_unverified_student_page_binding.dart';
import 'package:fun_education_app_teacher/app/pages/detail-unverified-student-page/detail_unverified_student_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/detail_saving_page/detail_saving_page_binding.dart';
import 'package:fun_education_app_teacher/app/pages/detail_saving_page/detail_saving_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/edit-information-student-page/edit_information_student_page_binding.dart';
import 'package:fun_education_app_teacher/app/pages/edit-information-student-page/edit_information_student_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/edit-report-page/edit_report_page_binding.dart';
import 'package:fun_education_app_teacher/app/pages/edit-report-page/edit_report_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/edit-task-page/edit_task_page_binding.dart';
import 'package:fun_education_app_teacher/app/pages/edit-task-page/edit_task_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/gallery-page/gallery_page_binding.dart';
import 'package:fun_education_app_teacher/app/pages/gallery-page/gallery_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/graduated-student-page/graduated_student_page_binding.dart';
import 'package:fun_education_app_teacher/app/pages/graduated-student-page/graduated_student_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/home-page/home_page_binding.dart';
import 'package:fun_education_app_teacher/app/pages/home-page/home_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/home-saving-page/home_saving_page_binding.dart';
import 'package:fun_education_app_teacher/app/pages/home-saving-page/home_saving_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/list-detail-saving-page/list_detail_saving_page_binding.dart';
import 'package:fun_education_app_teacher/app/pages/list-detail-saving-page/list_detail_saving_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/list-student-page/list_student_page_binding.dart';
import 'package:fun_education_app_teacher/app/pages/list-student-page/list_student_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/login-page/login_page_binding.dart';
import 'package:fun_education_app_teacher/app/pages/login-page/login_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/navbar-main/navbar_main_binding.dart';
import 'package:fun_education_app_teacher/app/pages/navbar-main/navbar_main_view.dart';
import 'package:fun_education_app_teacher/app/pages/otp-verification-page/otp_verification_page_binding.dart';
import 'package:fun_education_app_teacher/app/pages/otp-verification-page/otp_verification_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/report-history-page/report_history_page_binding.dart';
import 'package:fun_education_app_teacher/app/pages/report-history-page/report_history_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/reset-password-page/reset_password_page_binding.dart';
import 'package:fun_education_app_teacher/app/pages/reset-password-page/reset_password_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/splash-screen/splash_screen_binding.dart';
import 'package:fun_education_app_teacher/app/pages/splash-screen/splash_screen_view.dart';
import 'package:fun_education_app_teacher/app/pages/transaction-history-page/transaction_history_page_binding.dart';
import 'package:fun_education_app_teacher/app/pages/transaction-history-page/transaction_history_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/upload-album-page/upload_album_page_binding.dart';
import 'package:fun_education_app_teacher/app/pages/upload-album-page/upload_album_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/upload-photo-page/upload_photo_page_binding.dart';
import 'package:fun_education_app_teacher/app/pages/upload-photo-page/upload_photo_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/unverified-student-page/unverified_student_page_binding.dart';
import 'package:fun_education_app_teacher/app/pages/unverified-student-page/unverified_student_page_view.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.NAVBAR_MAIN,
      page: () => NavbarMainView(),
      bindings: [
        NavbarMainBinding(),
        HomePageBinding(),
        HomeSavingPageBinding(),
        GalleryPageBinding(),
      ],
    ),
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
      name: _Paths.OTP_VERIFICATION_PAGE,
      page: () => OtpVerificationPageView(),
      binding: OtpVerificationPageBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD_PAGE,
      page: () => ResetPasswordPageView(),
      binding: ResetPasswordPageBinding(),
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
      name: _Paths.REPORT_HISTORY_PAGE,
      page: () => ReportHistoryPageView(),
      binding: ReportHistoryPageBinding(),
    ),
    GetPage(
      name: _Paths.HOME_SAVING_PAGE,
      page: () => HomeSavingPageView(),
      binding: HomeSavingPageBinding(),
    ),
    GetPage(
      name: _Paths.LIST_DETAIL_SAVING_PAGE,
      page: () => ListDetailSavingPageView(),
      binding: ListDetailSavingPageBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_SAVING_PAGE,
      page: () => DetailSavingPageView(),
      binding: DetailSavingPageBinding(),
    ),
    GetPage(
      name: _Paths.TRANSACTION_HISTORY_PAGE,
      page: () => TransactionHistoryPageView(),
      binding: TransactionHistoryPageBinding(),
    ),
    GetPage(
      name: _Paths.LIST_STUDENT_PAGE,
      page: () => ListStudentPageView(),
      binding: ListStudentPageBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_LIST_STUDENT_PAGE,
      page: () => DetailListStudentPageView(),
      binding: DetailListStudentPageBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_INFORMATION_STUDENT_PAGE,
      page: () => EditInformationStudentPageView(),
      binding: EditInformationStudentPageBinding(),
    ),
    GetPage(
      name: _Paths.GALLERY_PAGE,
      page: () => GalleryPageView(),
      binding: GalleryPageBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_ALBUM_PHOTO_PAGE,
      page: () => DetailAlbumPhotoPageView(),
      binding: DetailAlbumPhotoPageBinding(),
    ),
    GetPage(
      name: _Paths.UPLOAD_PHOTO_PAGE,
      page: () => UploadPhotoPageView(),
      binding: UploadPhotoPageBinding(),
    ),
    GetPage(
      name: _Paths.UPLOAD_ALBUM_PAGE,
      page: () => UploadAlbumPageView(),
      binding: UploadAlbumPageBinding(),
    ),
    GetPage(
      name: _Paths.UNVERIFIED_STUDENT_PAGE,
      page: () => UnverifiedStudentPageView(),
      binding: UnverifiedStudentPageBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_UNVERIFIED_STUDENT_PAGE,
      page: () => DetailUnverifiedStudentPageView(),
      binding: DetailUnverifiedStudentPageBinding(),
    ),
    GetPage(
      name: _Paths.GRADUATED_STUDENT_PAGE,
      page: () => GraduatedStudentPageView(),
      binding: GraduatedStudentPageBinding(),
    ),
  ];
}

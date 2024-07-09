part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const SPLASH_SCREEN = _Paths.SPLASH_SCREEN;
  static const LOGIN_PAGE = _Paths.LOGIN_PAGE;
  static const PROFILE_DRAWER = _Paths.PROFILE_DRAWER;
  static const ADD_STUDENT_PAGE = _Paths.ADD_STUDENT_PAGE;
  static const DETAIL_CLASS_PAGE = _Paths.DETAIL_CLASS_PAGE;
  static const HOME_PAGE = _Paths.HOME_PAGE;
  static const ADD_TASK_PAGE = _Paths.ADD_TASK_PAGE;
  static const DETAIL_TASK_PAGE = _Paths.DETAIL_TASK_PAGE;
  static const EDIT_TASK_PAGE = _Paths.EDIT_TASK_PAGE;
  static const DASHBOARD_PAGE = _Paths.DASHBOARD_PAGE;
  static const DETAIL_MARK_PAGE = _Paths.DETAIL_MARK_PAGE;
  static const ADD_REPORT_PAGE = _Paths.ADD_REPORT_PAGE;
  static const EDIT_REPORT_PAGE = _Paths.EDIT_REPORT_PAGE;
  static const DETAIL_REPORT_PAGE = _Paths.DETAIL_REPORT_PAGE;
  static const HOME_SAVING_PAGE = _Paths.HOME_SAVING_PAGE;
  static const LIST_DETAIL_SAVING_PAGE = _Paths.LIST_DETAIL_SAVING_PAGE;
}

abstract class _Paths {
  _Paths._();
  static const SPLASH_SCREEN = '/splash-screen';
  static const LOGIN_PAGE = '/login-page';
  static const PROFILE_DRAWER = '/profile-drawer';
  static const ADD_STUDENT_PAGE = '/add-student-page';
  static const DETAIL_CLASS_PAGE = '/detail-class-page';
  static const HOME_PAGE = '/home-page';
  static const ADD_TASK_PAGE = '/add-task-page';
  static const DETAIL_TASK_PAGE = '/detail-task-page';
  static const EDIT_TASK_PAGE = '/edit-task-page';
  static const DASHBOARD_PAGE = '/dashboard-page';
  static const DETAIL_MARK_PAGE = '/detail-mark-page';
  static const ADD_REPORT_PAGE = '/add-report-page';
  static const EDIT_REPORT_PAGE = '/edit-report-page';
  static const DETAIL_REPORT_PAGE = '/detail-report-page';  
  static const HOME_SAVING_PAGE = '/home-saving-page';
  static const LIST_DETAIL_SAVING_PAGE = '/list-detail-saving-page';
}

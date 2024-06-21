part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const SPLASH_SCREEN = _Paths.SPLASH_SCREEN;
  static const LOGIN_PAGE = _Paths.LOGIN_PAGE;
  static const DASHBOARD_PAGE = _Paths.DASHBOARD_PAGE;
  static const PROFILE_DRAWER = _Paths.PROFILE_DRAWER;
  static const ADD_SISWA_PAGE = _Paths.ADD_SISWA_PAGE;
  static const DETAIL_KELAS_PAGE = _Paths.DETAIL_KELAS_PAGE;
}

abstract class _Paths {
  _Paths._();
  static const SPLASH_SCREEN = '/splash-screen';
  static const LOGIN_PAGE = '/login-page';
  static const DASHBOARD_PAGE = '/dashboard-page';
  static const PROFILE_DRAWER = '/profile-drawer';
  static const ADD_SISWA_PAGE = '/add-siswa-page';
  static const DETAIL_KELAS_PAGE = '/detail-kelas-page';
}

part of 'app_pages.dart';

abstract class Routes {
  Routes._();
    static const SPLASH_SCREEN = _Paths.SPLASH_SCREEN;
    static const DASHBOARD_PAGE = _Paths.DASHBOARD_PAGE;
}

abstract class _Paths {
  _Paths._();
  static const SPLASH_SCREEN = '/splash-screen';
  static const DASHBOARD_PAGE = '/dashboard-page';
}

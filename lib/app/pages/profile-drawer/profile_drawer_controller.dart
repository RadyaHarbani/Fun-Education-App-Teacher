import 'dart:io';

import 'package:fun_education_app_teacher/app/api/auth/service/authentication_service.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:open_file/open_file.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

class ProfileDrawerController extends GetxController {
  AuthenticationService authenticationService = AuthenticationService();
  RxBool isLoadingLogout = false.obs;
  RxBool isDownloading = false.obs;
  Dio dio = Dio();

  Future<void> logout() async {
    isLoadingLogout(true);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await authenticationService.logout();
    await prefs.remove('teachersToken');
    Get.offAllNamed(Routes.LOGIN_PAGE);
    isLoadingLogout(false);
  }

  Future<void> downloadExcel() async {
    try {
      isDownloading(true);
      final String url =
          'https://fun-education-api.rplrus.com/api/excel/user-export';

      final directory = await getExternalStorageDirectory();
      final filePath = '${directory?.path}/user_export.xlsx';
      print('Saving file to: $filePath');

      await dio.download(url, filePath, onReceiveProgress: (received, total) {
        if (total != -1) {
          print('Downloading: ${(received / total * 100).toStringAsFixed(0)}%');
        }
      });
      final file = File(filePath);
      if (await file.exists()) {
        print('File downloaded to: $filePath');
        await OpenFile.open(filePath);
        isDownloading(false);
        Get.snackbar(
          'Success',
          'File downloaded successfully and saved to $filePath',
        );
      } else {
        isDownloading(false);
        Get.snackbar(
          'Error',
          'File not found after download!',
        );
      }
    } catch (e) {
      isDownloading(false);
      print('Download error: $e');
      Get.snackbar(
        'Error',
        'An error occurred while downloading the file!',
      );
    }

    // final url = 'https://fun-education-api.rplrus.com/api/excel/user-export';
    // final uri = Uri.tryParse(url);
    // if (uri != null && await launchUrl(uri)) {
    //   await launchUrl(
    //     uri,
    //     mode: LaunchMode.externalApplication,
    //   );
    // } else {
    //   throw 'Could not launch $url';
    // }
  }
}

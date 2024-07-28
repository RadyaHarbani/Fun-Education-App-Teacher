class ApiEndPoint {
  static String baseUrl = 'https://fun-education-api.rplrus.com/api';
  static String baseUrlAuth = '$baseUrl/users';
  static String baseUrlShiftMasuk = '$baseUrl/shift-masuk';
  static String baseUrlCatatanDarurat = '$baseUrl/catatan-darurat';
  static String baseUrlLaporanHarian = '$baseUrl/laporan-harian';
  static String baseUrlTabungan = '$baseUrl/tabungan';
  static String baseUrlTransaksi = '$baseUrl/transaksi';
  static String baseUrlAlurBelajar = '$baseUrl/alur-belajar';
  static String baseUrlPhotos = '$baseUrl/gallery';
  static String baseUrlMinimumPengajuan = '$baseUrl/minimum-pengajuan';
  static String baseUrlPengajuanTabungan = '$baseUrl/pengajuan-tabungan';
  static String baseUrlAlbums = '$baseUrl/album';
  static String baseUrlTask = '$baseUrl/tugas';
  static String baseUrlTaskImage = '$baseUrl/tugas-image';
  static String baseUrlMark = '$baseUrl/tugas-user';
  static String leaderboard = '$baseUrl/leaderboard';

  //Auth
  static String login = '$baseUrlAuth/login';
  static String register = '$baseUrlAuth/register';
  static String logout = '$baseUrlAuth/logout';

  //Shift Masuk
  static String showCurrentShiftMasuk = '$baseUrlShiftMasuk/show-current';
  static String storeIncomingShiftByAdmin = '$baseUrlShiftMasuk/store';
  static String showAllIncomingShift = '$baseUrlShiftMasuk/index';
  static String showByIdIncomingShift = '$baseUrlShiftMasuk/show/';

  //User
  static String showCurrentUser = '$baseUrlAuth/show-current';
  static String showAllUserByIncomingShift = '$baseUrlAuth/index?shift=';
  static String showByIdUser = '$baseUrlAuth/show/';

  //Catatan Darurat
  static String showLatestCatatanDarurat = '$baseUrlCatatanDarurat/show';
  static String storeEmergencyNoteByAdmin = '$baseUrlCatatanDarurat/store';
  static String updateEmergencyNoteByAdmin = '$baseUrlCatatanDarurat/update/';
  static String deleteEmergencyNoteByAdmin = '$baseUrlCatatanDarurat/delete/';

  //Laporan Harian
  static String showCurrentDailyReport = '$baseUrlLaporanHarian/show-current';
  static String showUserDoneUndone = '$baseUrlLaporanHarian/user';
  static String showDailyReportByUserId = '$baseUrlLaporanHarian/show-filter';
  static String storeDailyReportByAdmin = '$baseUrlLaporanHarian/store';
  static String updateDailyReportByAdmin = '$baseUrlLaporanHarian/update';
  static String deleteDailyReportByAdmin = '$baseUrlLaporanHarian/delete';

  //Tabungan
  static String showCurrentTabungan = '$baseUrlTabungan/show-current';

  //Transaksi
  static String showCurrentTransaksi = '$baseUrlTransaksi/show-current';

  //Alur Belajar
  static String showCurrentAlurBelajar = '$baseUrlAlurBelajar/show-current';

  //Photos
  static String showAllPhotos = '$baseUrlPhotos/index';
  static String deletePhotoByAdmin = '$baseUrlPhotos/delete/';
  static String storePhotoByAdmin = '$baseUrlPhotos/store';

  //Albums
  static String showAllAlbums = '$baseUrlAlbums/index';
  static String storeAlbumByAdmin = '$baseUrlAlbums/store';
  static String showByIdAlbum = '$baseUrlAlbums/show/';
  static String deleteAlbumByAdmin = '$baseUrlAlbums/delete/';

  //Minimum Pengajuan
  static String showCurrentMinimumPengajuan =
      '$baseUrlMinimumPengajuan/show-current';

  //Pengajuan Tabungan
  static String storePengajuanTabungan = '$baseUrlPengajuanTabungan/store';

  //Task
  static String showStatusCount = '$baseUrlTask/show-status-count';
  static String showByStatus = '$baseUrlTask/index';
  static String storeTaskByAdmin = '$baseUrlTask/store';
  static String storeTaskImageByAdmin = '$baseUrlTaskImage/store';
  static String deleteTaskImageByAdmin = '$baseUrlTaskImage/delete/';
  static String showByTaskId = '$baseUrlTask/show/';
  static String deleteTaskByAdmin = '$baseUrlTask/delete/';
  static String updateStatusTaskByAdmin = '$baseUrlTask/update-status/';
  static String updateTaskByAdmin = '$baseUrlTask/update/';

  //Mark
  static String markShowByTaskId = '$baseUrlMark/show-by-tugas-id/';
  static String markShowByUserId = '$baseUrlMark/show/';
  static String sendGradeByAdmin = '$baseUrlMark/send-grade/';

  //Leaderboard
  static String showLeaderboardByIncomingShift = '$leaderboard/index';
}

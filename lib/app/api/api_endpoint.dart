class ApiEndPoint {
  static String baseUrl = 'https://fun-education-api.rplrus.com/api';
  static String baseUrlAuth = '$baseUrl/users';
  static String baseUrlShiftMasuk = '$baseUrl/shift-masuk';
  static String baseUrlCatatanDarurat = '$baseUrl/catatan-darurat';
  static String baseUrlLaporanHarian = '$baseUrl/laporan-harian';
  static String baseUrlLaporanBulanan = '$baseUrl/laporan-bulanan';
  static String baseUrlTabungan = '$baseUrl/tabungan';
  static String baseUrlTransaksi = '$baseUrl/transaksi';
  static String baseUrlAlurBelajar = '$baseUrl/alur-belajar';
  static String baseUrlAllPhotos = '$baseUrl/gallery';
  static String baseUrlMinimumPengajuan = '$baseUrl/minimum-pengajuan';
  static String baseUrlPengajuanTabungan = '$baseUrl/pengajuan-tabungan';
  static String baseUrlAllAlbumPhotos = '$baseUrl/album';

  //Auth
  static String login = '$baseUrlAuth/login';
  static String register = '$baseUrlAuth/register';
  static String logout = '$baseUrlAuth/logout';

  //Shift Masuk
  static String showCurrentShiftMasuk = '$baseUrlShiftMasuk/show-current';

  //User
  static String showCurrentUser = '$baseUrlAuth/show-current';

  //Catatan Darurat
  static String showLatestCatatanDarurat = '$baseUrlCatatanDarurat/show';
  static String storeEmergencyNoteByAdmin = '$baseUrlCatatanDarurat/store';
  static String updateEmergencyNoteByAdmin = '$baseUrlCatatanDarurat/update/';
  static String deleteEmergencyNoteByAdmin = '$baseUrlCatatanDarurat/delete/';

  //Laporan Harian
  static String showCurrentLaporanHarian = '$baseUrlLaporanHarian/show-current';

  //Laporan Bulanan
  static String showCurrentLaporanBulanan =
      '$baseUrlLaporanBulanan/show-current';

  //Tabungan
  static String showCurrentTabungan = '$baseUrlTabungan/show-current';

  //Transaksi
  static String showCurrentTransaksi = '$baseUrlTransaksi/show-current';

  //Alur Belajar
  static String showCurrentAlurBelajar = '$baseUrlAlurBelajar/show-current';

  //Show All Photos
  static String showAllPhotos = '$baseUrlAllPhotos/index';

  //Minimum Pengajuan
  static String showCurrentMinimumPengajuan =
      '$baseUrlMinimumPengajuan/show-current';

  //Pengajuan Tabungan
  static String storePengajuanTabungan = '$baseUrlPengajuanTabungan/store';
  //Show All Photos
  static String showAllAlbumPhotos = '$baseUrlAllAlbumPhotos/index';
}

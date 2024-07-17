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
  static String baseUrlPhotos = '$baseUrl/gallery';
  static String baseUrlMinimumPengajuan = '$baseUrl/minimum-pengajuan';
  static String baseUrlPengajuanTabungan = '$baseUrl/pengajuan-tabungan';
  static String baseUrlAlbums = '$baseUrl/album';

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
  
}

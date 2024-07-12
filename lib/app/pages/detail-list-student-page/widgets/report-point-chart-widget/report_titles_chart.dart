class ReportTitlesChart {
  String getWeekDay(int value) {
    switch (value) {
      case 0:
        return 'Senin';
      case 1:
        return 'Selasa';
      case 2:
        return 'Rabu';
      case 3:
        return 'Kamis';
      case 4:
        return 'Jumat';
      case 5:
        return 'Sabtu';
      case 6:
        return 'Minggu';
      default:
        throw Error();
    }
  }

  String getWeekNumber(int value) {
    return 'Minggu ${value + 1}';
  }
}
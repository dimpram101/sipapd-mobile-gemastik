extension DateFormatter on DateTime {
  DateTime getDateOnly() {
    return DateTime(year, month, day);
  }

  String getDateOnlyString() {
    return DateTime(year, month, day).toString().replaceAll("00:00:00.000", "");
  }
}

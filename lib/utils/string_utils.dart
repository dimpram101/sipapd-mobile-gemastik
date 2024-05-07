import 'package:cloud_firestore/cloud_firestore.dart';

const Map<String, String> attributes = {
  "No-Helmet": "Helmet",
  "No-Gloves": "Gloves",
  "No-Vest": "Vest",
  "No-Shoes": "Shoes",
};

class StringUtils {
  static String dateToString(String date, String divider, {String? joinWith}) {
    final dateList = date.split(divider);
    return dateList.join(joinWith ?? ' ');
  }

  static String attributeFormatter(List<dynamic> attribute) {
    final List<dynamic> filteredAttribute = attribute.toSet().toList();
    final formattedAttribute = filteredAttribute.map((e) => attributes[e] ?? e).toList();
    return formattedAttribute.join(", ");
  }

  static timestampToDate(Timestamp t) {
    DateTime date = t.toDate();
    // YYYY-MM-DD HH:MM:SS
    return date.toString().substring(0, 10);
  }

  static dateTimetoDate(DateTime dateTime) {
    return dateTime.toString().substring(0, 10);
  }

  // static convertTimeStamp(Timestamp timestamp) {
  //   String convertedDate;

  //   return convertedDate;
  // }
}

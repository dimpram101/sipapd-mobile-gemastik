import 'package:sipapd_mobile/utils/list_utils.dart';

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
    final List<dynamic> filteredAttribute = ListUtils.removeDuplicates(attribute);
    final formattedAttribute = filteredAttribute.map((e) => attributes[e] ?? e).toList();
    return formattedAttribute.join(", ");
  }
}

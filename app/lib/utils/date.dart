import 'package:intl/intl.dart';

String genAppropirateDateText(DateTime date) {
    final nowDate = DateTime.now();
    var dateText = DateFormat("M月d日 (W)").format(date);
    if(date.day == nowDate.add(Duration(days: -1)).day) {
        dateText = "昨日の献立";
    } else if(date.day == nowDate.add(Duration(days: 1)).day) {
        dateText = "明日の献立";
    } else if(date.day == nowDate.day) {
        dateText = "今日の献立";
    } else if(date.year != nowDate.year) {
        dateText = DateFormat("y年M月d日 (W)").format(date);
    }
    dateText = dateText.replaceAll("W", <String>["", "月", "火", "水", "木", "金", "土", "日"][date.weekday]);
    return dateText;
}

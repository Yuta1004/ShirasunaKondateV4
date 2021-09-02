import 'package:intl/intl.dart';

String genAppropirateDateText(DateTime date) {
    final nowDate = DateTime.now();
    var dateText = DateFormat("M月d日 (W)").format(date);
    if(_equalDate(date, nowDate.add(Duration(days: -1)))) {
        dateText = "昨日の献立";
    } else if(_equalDate(date, nowDate.add(Duration(days: 1)))) {
        dateText = "明日の献立";
    } else if(_equalDate(date, nowDate)) {
        dateText = "今日の献立";
    } else if(date.year != nowDate.year) {
        dateText = DateFormat("y年M月d日 (W)").format(date);
    }
    dateText = dateText.replaceAll("W", <String>["", "月", "火", "水", "木", "金", "土", "日"][date.weekday]);
    return dateText;
}

bool _equalDate(DateTime a0, DateTime a1) {
    return a0.year == a1.year && a0.month == a1.month && a0.day == a1.day;
}

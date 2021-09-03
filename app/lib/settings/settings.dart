import "package:shared_preferences/shared_preferences.dart";

/* 設定項目と関数の対応表
- 翌日の献立表示
    - ON/OFF : bool => (get/set)DisplayTomorrowKondateSettings
    - 時刻 : DateTime => (get/set)DisplayTomorrowKondateTimeSettings
- 栄養情報表示
    - ON/OFF : bool => (get/set)DisplayNutritiveInfoSettings
    - 要素 : Map<Nutritive, String> => (get/set)DisplayNutritiveInfoDetailsSettings
- 配信サーバ
    - URL : String => (get/set)ServerURL
*/

Future<bool> getDisplayTomorrowKondateSettings() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool("displayTomorrowKondate") ?? false;
}

void setDisplayTomorrowKondateSettings(bool value) async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool("displayTomorrowKondate", value);
}

Future<DateTime> getDisplayTomorrowKondateTimeSettings() async {
    final pref = await SharedPreferences.getInstance();
    final savedTime = pref.getInt("displayTomorrowKondateTime") ?? 19*60;
    final nowDateTime = DateTime.now();
    return DateTime(
        nowDateTime.year,
        nowDateTime.month,
        nowDateTime.day,
        savedTime ~/ 60,
        savedTime % 60
    );
}

void setDisplayTomorrowKondateTimeSettings(DateTime time) async {
    final pref = await SharedPreferences.getInstance();
    pref.setInt("displayTomorrowKondateTime", time.hour*60+time.minute);
}

Future<bool> getDisplayNutritiveInfoSettings() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool("displayNutritiveInfo") ?? true;
}

void setDisplayNutritiveInfoSettings(bool value) async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool("displayNutritiveInfo", value);
}

enum Nutritive {
    Calorie,
    Carbohydrate,
    Lipid,
    Protein,
    Salt,
}

Future<Map<Nutritive, bool>> getDisplayNutritiveInfoDetailsSettings() async {
    final pref = await SharedPreferences.getInstance();
    final savedList = pref.getStringList("displayNutritiveInfoDetails") ?? [Nutritive.Calorie.toString()];
    final detailsTable = <Nutritive, bool>{};
    for(Nutritive elem in Nutritive.values) {
        detailsTable[elem] = savedList.contains(elem.toString());
    }
    return detailsTable;
}

void setDisplayNutritiveInfoDetailsSettings(Map<Nutritive, bool> detailsTable) async {
    final pref = await SharedPreferences.getInstance();
    final savedList = detailsTable.entries
        .where((elem) => elem.value)
        .map((elem) => elem.key.toString())
        .toList();
    pref.setStringList("displayNutritiveInfoDetails", savedList);
}

Future<String> getServerURL() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString("serverURL") ?? "localhost";
}

void setServerURL(String url) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString("serverURL", url);
}

import "package:flutter/material.dart";
import "package:settings_ui/settings_ui.dart";
import "package:day_night_time_picker/day_night_time_picker.dart";
import "/settings/settings.dart";

class SettingsPage extends StatefulWidget {
    @override
    _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
    bool _displayTomorrowKondate = false;
    String _displayTomorrowKondateTime = "19:00";
    bool _displayNutritiveInfo = false;

    @override
    void initState() {
        super.initState();
        getDisplayTomorrowKondateSettings().then((val) {
            setState(() { _displayTomorrowKondate = val; });
        });
        getDisplayTomorrowKondateTimeSettings().then((val) {
            setState(() { _displayTomorrowKondateTime = val.hour.toString()+":"+val.minute.toString(); });
        });
        getDisplayNutritiveInfoSettings().then((val) {
            setState(() { _displayNutritiveInfo = val; });
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(
                    "設定",
                    style: TextStyle(fontWeight: FontWeight.bold)
                ),
            ),
            body: Column(
                children: <Widget>[
                    SettingsSection(
                        title: "起動時に翌日の献立を表示",
                        tiles: <SettingsTile>[
                            SettingsTile.switchTile(
                                title: "有効にする",
                                switchValue: _displayTomorrowKondate,
                                onToggle: (bool val) {
                                    setDisplayTomorrowKondateSettings(val);
                                    setState(() { _displayTomorrowKondate = val; });
                                },
                            ),
                            SettingsTile(
                                title: "時刻",
                                subtitle: _displayTomorrowKondateTime+"から",
                                onPressed: (context) {
                                    Navigator.of(context).push(
                                        showPicker(
                                            value: TimeOfDay.now(),
                                            onChange: (TimeOfDay time) {
                                                final savedTime = DateTime(2020, 1, 1, time.hour, time.minute);
                                                setDisplayTomorrowKondateTimeSettings(savedTime);
                                                setState(() {
                                                    _displayTomorrowKondateTime = savedTime.hour.toString()+":"+savedTime.minute.toString();
                                                });
                                            },
                                        )
                                    );
                                },
                            ),
                        ],
                    ),
                    SettingsSection(
                        title: "栄養情報表示",
                        tiles: <SettingsTile>[
                            SettingsTile.switchTile(
                                title: "有効にする",
                                switchValue: _displayNutritiveInfo,
                                onToggle: (bool val) {
                                    setDisplayNutritiveInfoSettings(val);
                                    setState(() { _displayNutritiveInfo = val; });
                                },
                            ),
                            SettingsTile(
                                title: "表示する栄養情報",
                                subtitle: "カロリー/塩分",
                            ),
                        ],
                    ),
                    SettingsSection(
                        title: "サーバ",
                        tiles: <SettingsTile>[
                            SettingsTile(
                                title: "配信サーバURL",
                                subtitle: "https://www.aaa.example.com",
                            ),
                        ],
                    ),
                ],
            ),
        );
    }
}

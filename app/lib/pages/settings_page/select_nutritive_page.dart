import "package:flutter/material.dart";
import "package:settings_ui/settings_ui.dart";
import "package:marquee_widget/marquee_widget.dart";
import "/grpc/v1/info_distributor_v1.pb.dart";
import "/utils/nutritive.dart";
import "/settings/settings.dart";

class SelectNutritivePage extends StatefulWidget {
    @override
    _SelectNutritivePageState createState() => _SelectNutritivePageState();
}

class _SelectNutritivePageState extends State<SelectNutritivePage> {
    Map<Nutritive, bool> detailsTable = {
        Nutritive.Calorie: true,
        Nutritive.Carbohydrate: false,
        Nutritive.Lipid: false,
        Nutritive.Protein: false,
        Nutritive.Salt: false,
    };
    final kondateDemoData = KInfoResponse_Kondate(
        type: null,
        menu: null,
        calorie: 629,
        carbohydrate: 20.1,
        lipid: 17.5,
        protein: 103.5,
        salt: 2.3
    );

    @override
    void initState() {
        super.initState();
        getDisplayNutritiveInfoDetailsSettings().then((val) {
            setState(() { detailsTable = val; });
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(
                    "表示する栄養情報",
                    style: TextStyle(fontWeight: FontWeight.bold)
                ),
            ),
            body: Column(
                children: <Widget>[
                    SettingsSection(
                        tiles: <SettingsTile>[
                            SettingsTile.switchTile(
                                title: "カロリー",
                                switchValue: detailsTable[Nutritive.Calorie],
                                onToggle: (bool val) { updateDetailsTable(Nutritive.Calorie, val); }
                            ),
                            SettingsTile.switchTile(
                                title: "炭水化物",
                                switchValue: detailsTable[Nutritive.Carbohydrate],
                                onToggle: (bool val) { updateDetailsTable(Nutritive.Carbohydrate, val); },
                            ),
                            SettingsTile.switchTile(
                                title: "脂質",
                                switchValue: detailsTable[Nutritive.Lipid],
                                onToggle: (bool val) { updateDetailsTable(Nutritive.Lipid, val); },
                            ),
                            SettingsTile.switchTile(
                                title: "タンパク質",
                                switchValue: detailsTable[Nutritive.Protein],
                                onToggle: (bool val) { updateDetailsTable(Nutritive.Protein, val); },
                            ),
                            SettingsTile.switchTile(
                                title: "塩分",
                                switchValue: detailsTable[Nutritive.Salt],
                                onToggle: (bool val) { updateDetailsTable(Nutritive.Salt, val); },
                            ),
                        ],
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Container(),
                    ),
                    Text(
                        "表示例",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                        ),
                    ),
                    Container(
                        color: Colors.grey[350],
                        height: 30,
                        child: Row(
                            children: <Widget>[
                                Expanded(
                                    flex: 1,
                                    child: Center(
                                        child: Text(
                                            "朝食",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold
                                            ),
                                        ),
                                    ),
                                ),
                                Expanded(
                                    flex: 9,
                                    child: Marquee(
                                        pauseDuration: Duration(seconds: 1),
                                        child: Text(
                                            genFormattedNutritiveText(detailsTable, kondateDemoData),
                                            style: TextStyle(fontSize: 18)
                                        ),
                                    ),
                                ),
                            ],
                        ),
                    ),
                ],
            ),
        );
    }

    void updateDetailsTable(Nutritive nutritive, bool val) {
        detailsTable[nutritive] = val;
        setState(() {
            setDisplayNutritiveInfoDetailsSettings(detailsTable);
        });
    }
}

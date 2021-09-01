import "/grpc/utils.pb.dart";
import "/grpc/v1/info_distributor_v1.pb.dart";

class KondateData {
    late DateTime date;
    late KInfoResponse_Kondate info;

    KondateData({
        required this.date,
        required this.info,
    });

    KondateData.fromDB(DateTime date, int type, String menuList, String nutritiveList) {
        final splittedNutritiveList = nutritiveList.split(";");
        this.date = date;
        this.info = KInfoResponse_Kondate(
            type: _convertInt2Type(type),
            menu: menuList.split(";").where((elem) => elem.length > 0).toList(),
            calorie: int.parse(splittedNutritiveList[0]),
            carbohydrate: double.parse(splittedNutritiveList[1]),
            lipid: double.parse(splittedNutritiveList[2]),
            protein: double.parse(splittedNutritiveList[3]),
            salt: double.parse(splittedNutritiveList[4]),
        );
    }

    Map<String, dynamic> toMap() {
        return {
            "date": this.date.year*10000+this.date.month*100+this.date.day,
            "type": _convertType2Int(this.info.type),
            "menu_list": this.info.menu.join(";"),
            "nutritive_list": [this.info.calorie, this.info.carbohydrate, this.info.lipid, this.info.protein, this.info.salt].join(";"),
        };
    }

    KondateType _convertInt2Type(int type) {
        if(type == 1) return KondateType.BREAKFAST;
        if(type == 2) return KondateType.LUNCH;
        return KondateType.DINNER;
    }

    int _convertType2Int(KondateType type) {
        if(type == KondateType.BREAKFAST) return 1;
        if(type == KondateType.LUNCH) return 2;
        return 3;
    }
}

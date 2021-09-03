import "package:sprintf/sprintf.dart";
import "/grpc/v1/info_distributor_v1.pb.dart";
import "/settings/settings.dart";

String genFormattedNutritiveText(Map<Nutritive, bool> detailsTable, KInfoResponse_Kondate kondate) {
    var formattedText = "", idx = 0;
    final nutritiveValues = [kondate.calorie, kondate.carbohydrate, kondate.lipid, kondate.protein, kondate.salt];
    detailsTable.forEach((nutritive, isEnabled) {
        if(isEnabled) {
            formattedText += sprintf("%s: %.1f%s  ", [
                _convertNutritive2Name(nutritive),
                nutritiveValues[idx].toDouble(),
                _convertNutritive2Unit(nutritive),
            ]);
            ++ idx;
        }
    });
    return formattedText;
}

String _convertNutritive2Name(Nutritive nutritive) {
    if(nutritive == Nutritive.Calorie) return "カロリー";
    if(nutritive == Nutritive.Carbohydrate) return "炭水化物";
    if(nutritive == Nutritive.Lipid) return "脂質";
    if(nutritive == Nutritive.Protein) return "タンパク質";
    return "塩分";
}

String _convertNutritive2Unit(Nutritive nutritive) {
    if(nutritive == Nutritive.Calorie) return "kcal";
    return "g";
}

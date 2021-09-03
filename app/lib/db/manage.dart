import "package:sqflite/sqflite.dart";
import "/db/model.dart";

Future<Database> _openDatabase() async {
    return await openDatabase(
        "kondateapp.db",
        version: 1,
        onCreate: (Database conn, _) async {
            await conn.execute("create table kondate (date interger, type interger, menu_list text not null, nutritive_list text not null, primary key(date, type))");
            await conn.execute("create table type (type interger primary key, type_name char[10])");
            await conn.transaction((txn) async {
                await txn.execute("insert into type values (1, \"breakfast\"), (2, \"lunch\"), (3, \"dinner\")");
            });
        }
    );
}

Future<bool> existsKondateData(DateTime date) async {
    final conn = await _openDatabase();
    final exists = 0 < Sqflite.firstIntValue(
        await conn.query(
            "kondate",
            columns: ["count(*)"],
            where: "date = ?",
            whereArgs: [date.year*10000+date.month*100+date.day]
        )
    )!;
    await conn.close();
    return exists;
}

Future<Null> insertKondateData(KondateData data) async {
    final conn = await _openDatabase();
    await conn.transaction((txn) async {
        await txn.insert("kondate", data.toMap());
    });
    await conn.close();
}

Future<List<KondateData>> selectKondateData(DateTime date) async {
    final conn = await _openDatabase();
    final List<Map<String, dynamic>> result = await conn.query(
        "kondate",
        columns: ["*"],
        where: "date = ?",
        whereArgs: [date.year*10000+date.month*100+date.day]
    );
    return List.generate(result.length, (idx) {
        return KondateData.fromDB(date, result[idx]["type"], result[idx]["menu_list"], result[idx]["nutritive_list"]);
    });
}

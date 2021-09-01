import "package:sqflite/sqflite.dart";
import "/db/model.dart";

const DBNAME = "kondate.db";

Future<bool> existsTables() async {
    final conn = await openDatabase(DBNAME);
    final exists = 1 == Sqflite.firstIntValue(
        await conn.query(
            "sqlite_master",
            columns: ["count(*)"],
            where: "type = ? and name = ?",
            whereArgs: ["table", "kondate"]
        )
    );
    await conn.close();
    return exists;
}

Future<Null> createTables() async {
    final conn = await openDatabase(DBNAME);
    await conn.execute("create table kondate (date interger, type interger, menu_list text not null, nutritive_list text not null, primary key(date, type))");
    await conn.execute("create table type (type interger primary key, type_name char[10])");
    await conn.execute("insert into type values (1, \"breakfast\"), (2, \"lunch\"), (3, \"dinner\")");
    await conn.close();
}

Future<bool> existsKondateData(DateTime date) async {
    final conn = await openDatabase(DBNAME);
    final exists =  1 == Sqflite.firstIntValue(
        await conn.query(
            "kondate",
            columns: ["count(*)"],
            where: "date = ?",
            whereArgs: [date.year*10000+date.month*100+date.day]
        )
    );
    await conn.close();
    return exists;
}

Future<Null> insertKondateData(KondateData data) async {
    final conn = await openDatabase(DBNAME);
    await conn.transaction((txn) async {
        await conn.insert("kondate", data.toMap());
    });
    await conn.close();
}

Future<List<KondateData>> selectKondateData(DateTime date) async {
    final conn = await openDatabase(DBNAME);
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

package work.nitycnyuta.shirasunakondatev4.server.api.v1

import java.io.Closeable
import java.sql.DriverManager
import java.sql.SQLException
import org.sqlite.SQLiteException
import work.nitycnyuta.shirasunakondatev4.proto.Date
import work.nitycnyuta.shirasunakondatev4.proto.Result
import work.nitycnyuta.shirasunakondatev4.proto.KondateType
import work.nitycnyuta.shirasunakondatev4.proto.v1.KInfoResponse.Kondate
import work.nitycnyuta.shirasunakondatev4.proto.v1.KInfoSearchResponse.SearchResult

class KondateDBManagerV1(private val dbPath: String) : Closeable {
    val conn = DriverManager.getConnection("jdbc:sqlite:$dbPath")

    fun get(date: Date): Pair<Result, List<Kondate>> {
        val pstmt = conn.prepareStatement("select * from kondate where date = ?;")
        pstmt.setString(1, "%04d%02d%02d".format(date.year, date.month, date.dayofmonth))
        try {
            val kondateList = mutableListOf<Kondate>()
            val result = pstmt.executeQuery()
            while(result.next()) {
                val type = convertInt2Type(result.getInt("type"))
                val nutritive_list = result.getString("nutritive_list").split(";")
                kondateList.add(
                    Kondate
                            .newBuilder()
                            .setType(type)
                            .addAllMenu(result.getString("menu_list").split(";").filter{ it.length > 0 })
                            .setCalorie(nutritive_list[0].toInt())
                            .setCarbohydrate(nutritive_list[1].toFloat())
                            .setLipid(nutritive_list[2].toFloat())
                            .setProtein(nutritive_list[3].toFloat())
                            .setSalt(nutritive_list[4].toFloat())
                            .build()
                )
            }
            return Pair(if(kondateList.size == 0) Result.NOT_FOUND else Result.SUCCESS, kondateList)
        } catch (e: SQLiteException) {
            return Pair(Result.INTERNAL_ERROR, mutableListOf())
        }
    }

    fun search(query: String): List<SearchResult> {
        val pstmt = conn.prepareStatement("select date, type from kondate where menu_list like ?;")
        pstmt.setString(1, "%$query%")
        try {
            val result = pstmt.executeQuery()
            val searchResult = mutableListOf<SearchResult>()
            while(result.next()) {
                val dateS = result.getString("date")
                val type = convertInt2Type(result.getInt("type"))
                val date = Date
                                .newBuilder()
                                .setYear(dateS.substring(0, 4).toInt())
                                .setMonth(dateS.substring(4, 6).toInt())
                                .setDayofmonth(dateS.substring(6, 8).toInt())
                                .build()
                searchResult.add(
                    SearchResult.newBuilder().setDate(date).setType(type).build()
                )
            }
            return searchResult
        } catch (e: Exception) {}
        return listOf()
    }

    override fun close() {
        conn.close()
    }

    private fun convertInt2Type(type: Int): KondateType = when(type) {
        1 -> KondateType.BREAKFAST
        2 -> KondateType.LUNCH
        3 -> KondateType.DINNER
        else -> KondateType.BREAKFAST
    }
}

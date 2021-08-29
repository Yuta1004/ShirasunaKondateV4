package work.nitycnyuta.shirasunakondatev4.server.api.v1

import java.io.Closeable
import java.sql.DriverManager
import java.sql.SQLException
import org.sqlite.SQLiteException
import work.nitycnyuta.shirasunakondatev4.proto.Date
import work.nitycnyuta.shirasunakondatev4.proto.KondateType
import work.nitycnyuta.shirasunakondatev4.proto.v1.KInfoResponse.Kondate
import work.nitycnyuta.shirasunakondatev4.proto.v1.KInfoSearchResponse.SearchResult

class KondateDBManagerV1(private val dbPath: String) : Closeable {
    val conn = DriverManager.getConnection("jdbc:sqlite:$dbPath")

    fun get(date: Date, type: KondateType): Pair<Boolean, Kondate> {
        val pstmt = conn.prepareStatement("select * from ${convertType2Str(type)} where date = ?;")
        pstmt.setString(1, "%04d%02d%02d".format(date.year, date.month, date.dayofmonth))
        try {
            val result = pstmt.executeQuery()
            val nutritive_list = result.getString("nutritive_list").split(";")
            return Pair(
                true,
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
        } catch (e: Exception) {}
        return Pair(false, Kondate.newBuilder().build())
    }

    fun search(query: String): List<SearchResult> {
        val searchResult = mutableListOf<List<SearchResult>>()
        searchResult.add(__search_child(KondateType.BREAKFAST, query))
        searchResult.add(__search_child(KondateType.LUNCH, query))
        searchResult.add(__search_child(KondateType.DINNER, query))
        return searchResult.flatten()
    }

    fun __search_child(type: KondateType, query: String): List<SearchResult> {
        val pstmt = conn.prepareStatement("select date from ${convertType2Str(type)} where menu_list like ?;")
        pstmt.setString(1, "%$query%")
        try {
            val result = pstmt.executeQuery()
            val searchResult = mutableListOf<SearchResult>()
            while(result.next()) {
                val dateS = result.getString("date")
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

    private fun convertType2Str(type: KondateType): String = when(type) {
        KondateType.BREAKFAST -> "breakfast"
        KondateType.LUNCH -> "lunch"
        KondateType.DINNER -> "dinner"
        else -> "breakfast"
    }
}

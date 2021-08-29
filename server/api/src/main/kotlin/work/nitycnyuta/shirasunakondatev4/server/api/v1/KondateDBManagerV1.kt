package work.nitycnyuta.shirasunakondatev4.server.api.db

import java.io.Closeable
import java.sql.DriverManager
import java.sql.SQLException
import org.sqlite.SQLiteException
import work.nitycnyuta.shirasunakondatev4.proto.KondateType
import work.nitycnyuta.shirasunakondatev4.proto.v1.KInfoResponse.Kondate

class KondateDBManagerV1(private val dbPath: String) : Closeable {
    val conn = DriverManager.getConnection("jdbc:sqlite:$dbPath")

    fun get(year: Int, month: Int, dayofmonth: Int, type: KondateType): Pair<Boolean, Kondate> {
        val pstmt = conn.prepareStatement("select * from ${convertType2Str(type)} where date = ?;")
        pstmt.setString(1, String.format("%04d%02d%02d", year, month, dayofmonth))
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

    fun search(query: String) {
        // TODO
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

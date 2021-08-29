package work.nitycnyuta.shirasunakondatev4.server.api.db

import java.io.Closeable
import java.sql.DriverManager

class KondateDBManagerV1(private val dbPath: String) : Closeable {
    val conn = DriverManager.getConnection("jdbc:sqlite:$dbPath")

    fun get(year: Int, month: Int, dayofmonth: Int){
        // TODO
    }

    fun search(query: String) {
        // TODO
    }

    override fun close() {
        conn.close()
    }
}

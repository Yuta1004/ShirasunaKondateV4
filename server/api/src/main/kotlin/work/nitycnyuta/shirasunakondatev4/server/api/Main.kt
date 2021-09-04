@file:JvmName("Main")

package work.nitycnyuta.shirasunakondatev4.server.api

import io.grpc.Server
import io.grpc.ServerBuilder
import work.nitycnyuta.shirasunakondatev4.server.api.v1.KInfoDistributorV1Service

class APIServer(private val port: Int) {
    val server: Server = ServerBuilder
                .forPort(port)
                .intercept(LogInterceptor())
                .addService(KInfoDistributorV1Service())
                .build()

    fun start() {
        server.start()
        println("API Server started.")
        Runtime.getRuntime().addShutdownHook(
            Thread {
                this@APIServer.stop()
            }
        )
    }

    private fun stop() {
        server.shutdown()
    }

    fun blockUntilShutdown() {
        server.awaitTermination()
    }
}

fun main() {
    val server = APIServer(50000)
    server.start()
    server.blockUntilShutdown()
}

package work.nitycnyuta.shirasunakondatev4.server.api;

import java.time.LocalDateTime
import io.grpc.Metadata
import io.grpc.ServerCall
import io.grpc.ServerCallHandler
import io.grpc.ServerInterceptor
import org.slf4j.LoggerFactory

class LogInterceptor: ServerInterceptor {
    companion object {
        private val logger = LoggerFactory.getLogger(LogInterceptor::class.java)
    }

    override fun <ReqT: Any, RespT: Any> interceptCall (
        call: ServerCall<ReqT, RespT>, headers: Metadata, next: ServerCallHandler<ReqT, RespT>
    ): ServerCall.Listener<ReqT> {
        // {"DateTime": "2020-04-10 12:04", "MethodName": "AAAAA", "MetaData": "AAAAA"}
        logger.info("{\"DateTime\": \"${LocalDateTime.now()}\", \"MethodName\": \"${call.methodDescriptor.fullMethodName}\", \"MetaData\": \"${headers}\"")
        return next.startCall(call, headers)
    }
}

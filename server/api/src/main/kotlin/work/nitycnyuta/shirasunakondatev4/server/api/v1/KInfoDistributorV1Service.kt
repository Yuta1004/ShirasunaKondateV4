package work.nitycnyuta.shirasunakondatev4.server.api.v1

import work.nitycnyuta.shirasunakondatev4.proto.Date
import work.nitycnyuta.shirasunakondatev4.proto.v1.KInfoDistributorV1GrpcKt
import work.nitycnyuta.shirasunakondatev4.proto.v1.KInfoResponse
import work.nitycnyuta.shirasunakondatev4.proto.v1.KInfoResponse.Kondate
import work.nitycnyuta.shirasunakondatev4.proto.v1.KInfoSearchRequest
import work.nitycnyuta.shirasunakondatev4.proto.v1.KInfoSearchResponse

class KInfoDistributorV1Service : KInfoDistributorV1GrpcKt.KInfoDistributorV1CoroutineImplBase() {
    override suspend fun get(request: Date) = KInfoResponse
                .newBuilder()
                .build()

    override suspend fun search(request: KInfoSearchRequest) = KInfoSearchResponse
                .newBuilder()
                .build()
}

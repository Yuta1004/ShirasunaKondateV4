package work.nitycnyuta.shirasunakondatev4.server.api.v1

import work.nitycnyuta.shirasunakondatev4.proto.Date
import work.nitycnyuta.shirasunakondatev4.proto.Result
import work.nitycnyuta.shirasunakondatev4.proto.KondateType
import work.nitycnyuta.shirasunakondatev4.proto.v1.KInfoDistributorV1GrpcKt
import work.nitycnyuta.shirasunakondatev4.proto.v1.KInfoResponse
import work.nitycnyuta.shirasunakondatev4.proto.v1.KInfoResponse.Kondate
import work.nitycnyuta.shirasunakondatev4.proto.v1.KInfoSearchRequest
import work.nitycnyuta.shirasunakondatev4.proto.v1.KInfoSearchResponse
import work.nitycnyuta.shirasunakondatev4.server.api.v1.KondateDBManagerV1

class KInfoDistributorV1Service : KInfoDistributorV1GrpcKt.KInfoDistributorV1CoroutineImplBase() {
    override suspend fun get(request: Date) =
        KondateDBManagerV1("/srv/db/kondate.db").use {
            var result = Result.NOT_FOUND
            val info = mutableListOf<Kondate>()
            for(type in listOf(KondateType.BREAKFAST, KondateType.LUNCH, KondateType.DINNER)) {
                val (_result, kondate) = it.get(request, type)
                info.add(kondate)
                if (_result == Result.SUCCESS) {
                    result = _result;
                } else if (_result == Result.INTERNAL_ERROR) {
                    return@use KInfoResponse.newBuilder().setResult(_result).build()
                }
            }
            return@use KInfoResponse.newBuilder().setResult(result).addAllInfo(info).build()
        }

    override suspend fun search(request: KInfoSearchRequest) = KInfoSearchResponse
                .newBuilder()
                .build()
}

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
            val (result, info) = it.get(request)
            if(result == Result.INTERNAL_ERROR) {
                return@use KInfoResponse.newBuilder().setResult(result).build()
            } else {
                return@use KInfoResponse.newBuilder().setResult(result).addAllInfo(info).build()
            }
        }

    override suspend fun search(request: KInfoSearchRequest) =
        KondateDBManagerV1("/srv/db/kondate.db").use {
            val searchResults = it.search(request.query)
            val result = mapOf(true to Result.SUCCESS, false to Result.NOT_FOUND)[searchResults.size > 0]
            return@use KInfoSearchResponse.newBuilder().setResult(result).addAllSearchResults(searchResults).build()
        }
}

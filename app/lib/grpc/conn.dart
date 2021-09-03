import 'package:grpc/grpc.dart';
import "/grpc/utils.pb.dart";
import "/grpc/v1/info_distributor_v1.pbgrpc.dart";
import "/db/manage.dart";
import "/db/model.dart";
import "/settings/settings.dart";

KInfoDistributorV1Client createStub(String address) {
    return KInfoDistributorV1Client(
        ClientChannel(
            address,
            port: 50000,    // for DevEnv
            options: ChannelOptions(credentials: ChannelCredentials.insecure()),    // for DevEnv
        ),
        options: CallOptions(
            timeout: Duration(seconds: 20),
        ),
    );
}

Future<List<KondateData>> getKondateData(DateTime date) async {
    final exists = await existsKondateData(date);
    if(exists){
        return await selectKondateData(date);
    }

    final address = await getServerURL();
    final stub = createStub(address);
    try {
        final data = await stub.get(Date(year: date.year, month: date.month, dayofmonth: date.day));
        if(data.result == Result.SUCCESS) {
            await insertKondateData(KondateData(date: date, info: data.info[0]));
            await insertKondateData(KondateData(date: date, info: data.info[1]));
            await insertKondateData(KondateData(date: date, info: data.info[2]));
        } else {
            return [];
        }
    } catch (error) {
        return [];
    }

    return await selectKondateData(date);
}

Future<List<KInfoSearchResponse_SearchResult>> searchKondateData(String query) async {
    final address = await getServerURL();
    final stub = createStub(address);
    try {
        final data = await stub.search(KInfoSearchRequest(query: query));
        if(data.result == Result.SUCCESS) {
            return data.searchResults;
        }
    } catch (error) { }
    return [];
}

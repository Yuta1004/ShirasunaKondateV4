import 'package:grpc/grpc.dart';
import "/grpc/utils.pb.dart";
import "/grpc/v1/info_distributor_v1.pbgrpc.dart";
import "/db/manage.dart";
import "/db/model.dart";

Future<List<KondateData>> getKondateData(DateTime date) async {
    final exists = await existsKondateData(date);
    if(exists){
        return await selectKondateData(date);
    }

    final channel = ClientChannel(
        "localhost",
        port: 50000,
        options: ChannelOptions(
            credentials: ChannelCredentials.insecure()      // for Dev
        )
    );
    final stub = KInfoDistributorV1Client(
        channel,
        options: CallOptions(
            timeout: Duration(seconds: 20)
        )
    );

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

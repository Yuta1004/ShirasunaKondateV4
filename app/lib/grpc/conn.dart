import 'package:grpc/grpc.dart';
import "/grpc/utils.pb.dart";
import "/grpc/v1/info_distributor_v1.pbgrpc.dart";
import "/db/manage.dart";
import "/db/model.dart";

const _ADDRESS = "localhost";
const _PORT = 50000;
const _DEV_ENV = true;

KInfoDistributorV1Client createStub() {
    final options;
    if(_DEV_ENV) {
        options = ChannelOptions(credentials: ChannelCredentials.insecure());
    } else {
        options = ChannelOptions(credentials: ChannelCredentials.secure());
    }
    return KInfoDistributorV1Client(
        ClientChannel(
            _ADDRESS,
            port: _PORT,
            options: options,
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

    final stub = createStub();
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

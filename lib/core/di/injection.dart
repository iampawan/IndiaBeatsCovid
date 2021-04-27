import 'package:dio/dio.dart';
import 'package:india_beats_covid/services/client/dio_client.dart';
import 'package:india_beats_covid/services/client/i_client.dart';
import 'package:india_beats_covid/services/client/mock_client.dart';

enum Flavor { MOCK, REST }

enum DataMode { DART, JSON }

//DI
class Injector {
  static final Injector _singleton = Injector._internal();
  static Flavor _flavor;
  static DataMode _dataMode;
  static Dio _dio;
  static CancelToken _cancelToken;

  static void configure(
      Flavor flavor, DataMode dataMode, Dio dio, CancelToken cancelToken) {
    _flavor = flavor;
    _dataMode = dataMode;
    _dio = dio;
    _cancelToken = cancelToken;
  }

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  IClient get currentClient {
    switch (_flavor) {
      case Flavor.MOCK:
        return MockClient();
      case Flavor.REST:
        return DioClient(dio: _dio, cancelToken: _cancelToken);
      default:
        return DioClient(dio: _dio, cancelToken: _cancelToken);
    }
  }

  DataMode get currentDataMode {
    switch (_dataMode) {
      case DataMode.DART:
        return DataMode.DART;
      case DataMode.JSON:
        return DataMode.JSON;
      default:
        return DataMode.DART;
    }
  }
}

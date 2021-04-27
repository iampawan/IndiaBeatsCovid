import 'package:india_beats_covid/services/client/i_client.dart';
import 'package:india_beats_covid/services/client/service_res.dart';

class MockClient extends IClient {
  @override
  Future<MappedNetworkServiceResponse<T>> deleteAsync<T>(String resourcePath,
      {bool customHeaders, Map<String, dynamic> queryParams}) {
    throw UnimplementedError();
  }

  @override
  Future<MappedNetworkServiceResponse<T>> getAsync<T>(String resourcePath,
      {bool customHeaders, Map<String, dynamic> queryParams}) {
    throw UnimplementedError();
  }

  @override
  Future<MappedNetworkServiceResponse<T>> patchAsync<T>(
      String resourcePath, data,
      {bool customHeaders = false}) {
    throw UnimplementedError();
  }

  @override
  Future<MappedNetworkServiceResponse<T>> postAsync<T>(
      String resourcePath, data,
      {bool customHeaders = false, bool isPlainFormat = false}) {
    throw UnimplementedError();
  }

  @override
  Future<MappedNetworkServiceResponse<T>> postFileAsync<T>(
      String resourcePath, Object data,
      {bool customHeaders = false}) {
    throw UnimplementedError();
  }
}

// * Inteface for different Clients

import 'package:india_beats_covid/services/client/service_res.dart';

abstract class IClient {
  Future<MappedNetworkServiceResponse<T>> getAsync<T>(String resourcePath,
      {bool customHeaders, Map<String, dynamic> queryParams});
  Future<MappedNetworkServiceResponse<T>> deleteAsync<T>(String resourcePath,
      {bool customHeaders, Map<String, dynamic> queryParams});
  Future<MappedNetworkServiceResponse<T>> postAsync<T>(
      String resourcePath, dynamic data,
      {bool customHeaders = false, bool isPlainFormat = false});
  Future<MappedNetworkServiceResponse<T>> postFileAsync<T>(
      String resourcePath, Object data,
      {bool customHeaders = false});
  Future<MappedNetworkServiceResponse<T>> patchAsync<T>(
      String resourcePath, dynamic data,
      {bool customHeaders = false});
}

// * Inteface for different Clients

import 'package:india_beats_covid/services/client/service_res.dart';

abstract class IClient {
  Future<MappedServiceResponse<T>> getAsync<T>(String resourcePath,
      {bool customHeaders, Map<String, dynamic> queryParams});
  Future<MappedServiceResponse<T>> deleteAsync<T>(String resourcePath,
      {bool customHeaders, Map<String, dynamic> queryParams});
  Future<MappedServiceResponse<T>> postAsync<T>(
      String resourcePath, dynamic data,
      {bool customHeaders = false, bool isPlainFormat = false});
  Future<MappedServiceResponse<T>> postFileAsync<T>(
      String resourcePath, Object data,
      {bool customHeaders = false});
  Future<MappedServiceResponse<T>> patchAsync<T>(
      String resourcePath, dynamic data,
      {bool customHeaders = false});
}

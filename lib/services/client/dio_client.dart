import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:india_beats_covid/services/client/service_res.dart';
import 'package:india_beats_covid/utils/constants.dart';
import 'package:meta/meta.dart';

import 'i_client.dart';

// * RestClient for HTTP Requests

class DioClient implements IClient {
  Map<String, String> authHeaders;
  Map<String, String> headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
  };

  Dio currentDio;

  CancelToken _cancelToken;

  final socketExceptionMessage = Constants.noInternet;

  DioClient({@required Dio dio, CancelToken cancelToken}) {
    currentDio = dio;
    // _dio?.interceptors?.add(LogInterceptor());
    if (cancelToken != null) {
      _cancelToken = cancelToken;
    }
    authHeaders = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
    };

    // if (defaultTargetPlatform != TargetPlatform.macOS) {
    //   initAlice(dio);
    // }
  }

// * Method for HTTP GET REQUEST
  @override
  Future<MappedServiceResponse<T>> getAsync<T>(String resourcePath,
      {bool customHeaders, queryParams}) async {
//    developer.log(queryParams.toString());
    dynamic response;
    try {
      // currentDio.interceptors.add(LogInterceptor(
      //   request: true,
      //   requestBody: true,
      // ));
      response = await currentDio.get(
        resourcePath,
        cancelToken: _cancelToken ?? CancelToken(),
        queryParameters: queryParams,
        options: Options(
          headers: customHeaders == true ? authHeaders : headers,
        ),
      );
    } on SocketException catch (_) {
      return MappedServiceResponse<T>(
          networkServiceResponse: NetworkServiceResponse<T>(
              success: false, message: socketExceptionMessage));
    } catch (e) {
      if ((e as DioError).response?.statusCode == HttpStatus.badRequest) {
        return MappedServiceResponse(
            networkServiceResponse: NetworkServiceResponse(
                success: false,
                message: (e as DioError).response.data["error"]));
      }
      return catchError(e);
    }

    return await processResponse<T>(response);
  }

  @override
  Future<MappedServiceResponse<T>> deleteAsync<T>(String resourcePath,
      {bool customHeaders, queryParams}) async {
//    developer.log(queryParams.toString());
    dynamic response;
    try {
      response = await currentDio.delete(
        resourcePath,
        cancelToken: _cancelToken ?? CancelToken(),
        queryParameters: queryParams,
        options: Options(
          headers: customHeaders == true ? authHeaders : headers,
        ),
      );
    } on SocketException catch (_) {
      return MappedServiceResponse<T>(
          networkServiceResponse: NetworkServiceResponse<T>(
              success: false, message: socketExceptionMessage));
    } catch (e) {
      if ((e as DioError).response?.statusCode == HttpStatus.badRequest) {
        return MappedServiceResponse(
            networkServiceResponse: NetworkServiceResponse(
                success: false,
                message: (e as DioError).response.data["error_message"]));
      }
      return catchError(e);
    }

    return await processResponse<T>(response);
  }

// * Method for HTTP POST REQUEST
  @override
  Future<MappedServiceResponse<T>> postAsync<T>(
      String resourcePath, dynamic data,
      {bool customHeaders = false, bool isPlainFormat = false}) async {
    if (isPlainFormat) {
      currentDio.options.contentType = "text/plain";
    } else {
      // _dio.options = BaseOptions(
      //   headers: customHeaders == true ? authHeaders : headers,
      // );
    }
    final content = isPlainFormat ? data : json.encoder.convert(data);
    debugPrint(content, wrapWidth: 1024);
    dynamic response;
    try {
      response = await currentDio.post(
        resourcePath,
        cancelToken: _cancelToken,
        data: content,
      );
    } on SocketException catch (_) {
      return MappedServiceResponse<T>(
          networkServiceResponse: NetworkServiceResponse<T>(
              success: false, message: socketExceptionMessage));
    } catch (e) {
      developer.log(e.toString());
      return catchError(e);
    }

    return await processResponse<T>(response);
  }

  // * Method for HTTP POST REQUEST
  @override
  Future<MappedServiceResponse<T>> patchAsync<T>(
      String resourcePath, dynamic data,
      {bool customHeaders = false}) async {
    if (customHeaders) {
      authHeaders.putIfAbsent("Authorization", () => "Token (if any)");
    }
    final content = json.encoder.convert(data);
    debugPrint(content, wrapWidth: 1024);
    dynamic response;
    try {
      response = await currentDio.patch(
        resourcePath,
        cancelToken: _cancelToken,
        data: content,
        options: Options(
          headers: customHeaders == true ? authHeaders : headers,
        ),
      );
    } on SocketException catch (_) {
      return MappedServiceResponse<T>(
          networkServiceResponse: NetworkServiceResponse<T>(
              success: false, message: socketExceptionMessage));
    } catch (e) {
      developer.log(e.toString());
      return catchError(e);
    }

    return await processResponse<T>(response);
  }

  @override
  Future<MappedServiceResponse<T>> postFileAsync<T>(
      String resourcePath, Object data,
      {bool customHeaders = false}) async {
    dynamic response;
    try {
      response = await currentDio.post(
        resourcePath,
        data: data,
      );
    } on SocketException catch (_) {
      return MappedServiceResponse<T>(
          networkServiceResponse: NetworkServiceResponse<T>(
              success: false, message: socketExceptionMessage));
    } catch (e) {
      developer.log(e.toString());
      return catchError(e);
    }

    return await processResponse<T>(response);
  }

  MappedServiceResponse catchError(e) {
    final DioError err = e;
    const String problemMsg =
        "Problem connecting to the server. Please try again";
    String message;
    if (DioErrorType.receiveTimeout == err.type ||
        DioErrorType.connectTimeout == err.type) {
      message =
          "Server is not reachable. Please verify your internet connection and try again";
    } else if (e.message.contains('SocketException')) {
      message = socketExceptionMessage;
    } else if (DioErrorType.response == err.type) {
      if (e.message.contains('SocketException')) {
        message = socketExceptionMessage;
      }
    } else if (err?.response?.statusCode.toString().startsWith("4")) {
      try {
        message = err.response?.data["error"] ?? problemMsg;
      } catch (e) {
        message = problemMsg;
      }
    } else {
      message = problemMsg;
    }
    return MappedServiceResponse(
        networkServiceResponse:
            NetworkServiceResponse(success: false, message: message));
  }

  Future<MappedServiceResponse<T>> processResponse<T>(Response response) async {
    if (!((response.statusCode < HttpStatus.ok) ||
        (response.statusCode >= HttpStatus.multipleChoices) ||
        (response.data == null))) {
      // final jRes = jsonEncode(response.data);
      // debugPrint(jRes, wrapWidth: 1024);
      // developer.log(jRes);
      return MappedServiceResponse<T>(
          mappedResult: response.data,
          networkServiceResponse: NetworkServiceResponse<T>(success: true));
    } else {
      final errorResponse = response.data;
      return MappedServiceResponse<T>(
          networkServiceResponse: NetworkServiceResponse<T>(
              success: false,
              message: "(${response.statusCode}) ${errorResponse.toString()}"));
    }
  }
}

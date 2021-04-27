class NetworkServiceResponse<T> {
  T content;
  bool success;
  String message;

  NetworkServiceResponse({this.content, this.success, this.message});
}

class MappedServiceResponse<T> {
  dynamic mappedResult;
  NetworkServiceResponse<T> networkServiceResponse;
  MappedServiceResponse({this.mappedResult, this.networkServiceResponse});
}

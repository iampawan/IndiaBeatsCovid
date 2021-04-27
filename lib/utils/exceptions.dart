import 'constants.dart';

class NotFoundException implements Exception {
  @override
  String toString() {
    return "Nothing found";
  }
}

class AppException implements Exception {
  final String message;

  AppException(this.message);
  @override
  String toString() {
    return message ?? Constants.wentWrong;
  }
}

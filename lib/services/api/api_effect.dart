import 'package:india_beats_covid/services/client/service_res.dart';
import 'package:india_beats_covid/utils/constants.dart';
import 'package:india_beats_covid/utils/exceptions.dart';
import 'package:velocity_x/velocity_x.dart';

abstract class APIEffects implements VxEffects<MappedServiceResponse<dynamic>> {
  @override
  fork(result) {
    try {
      if (result.networkServiceResponse.success) {
        success(result.mappedResult);
      } else {
        final error =
            result.networkServiceResponse?.message ?? Constants.wentWrong;
        fail(error);
        throw AppException(error);
      }
    } catch (e) {
      throw AppException(e.toString());
    }
  }

  void success(dynamic result);
  void fail(String message);
}

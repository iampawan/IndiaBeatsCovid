import 'package:dio/dio.dart';
import 'package:india_beats_covid/core/models/cities.dart';
import 'package:india_beats_covid/core/models/donors.dart';
import 'package:india_beats_covid/core/models/external_links.dart';
import 'package:india_beats_covid/core/models/hospital_beds.dart';
import 'package:india_beats_covid/core/models/oxygen_suppliers.dart';
import 'package:india_beats_covid/core/models/stats.dart';
import 'package:india_beats_covid/utils/constants.dart';
import 'package:india_beats_covid/utils/exceptions.dart';

import '../client/dio_client.dart';

class APIService {
  DioClient _client;

  APIService({DioClient client}) {
    _client =
        client ?? DioClient(dio: Dio(BaseOptions(baseUrl: Constants.baseUrl)));
  }

  //Stats Api
  Future<Stats> getStats() async {
    const _url = "home_stats.json";
    final res = await _client.getAsync(_url);
    if (res.networkServiceResponse.success) {
      final Stats result = Stats.fromJson(res.mappedResult);
      return result;
    }

    throw AppException(res.networkServiceResponse.message);
  }

  //Plasma Donors Api
  Future<List<Donors>> getDonors() async {
    const _url = "plasma_donors.json";
    final res = await _client.getAsync(_url);
    if (res.networkServiceResponse.success) {
      final List<Donors> result = donorsFromJson(res.mappedResult);
      return result;
    }

    throw AppException(res.networkServiceResponse.message);
  }

  //Hospital Beds Api
  Future<List<HospitalBeds>> getHospitalBeds() async {
    const _url = "hospital_beds.json";
    final res = await _client.getAsync(_url);
    if (res.networkServiceResponse.success) {
      final List<HospitalBeds> result = hospitalBedsFromJson(res.mappedResult);
      return result;
    }

    throw AppException(res.networkServiceResponse.message);
  }

  //External Links Api
  Future<List<ExternalLinks>> getExternalLinks() async {
    const _url = "external_links.json";
    final res = await _client.getAsync(_url);
    if (res.networkServiceResponse.success) {
      final List<ExternalLinks> result =
          externalLinksFromJson(res.mappedResult);
      return result;
    }

    throw AppException(res.networkServiceResponse.message);
  }

  //Oxygen Suppliers Api
  Future<List<OxygenSupplier>> getOxygenSuppliers() async {
    const _url = "oxygen_suppliers.json";
    final res = await _client.getAsync(_url);
    if (res.networkServiceResponse.success) {
      final List<OxygenSupplier> result =
          oxygenSupplierFromJson(res.mappedResult);
      return result;
    }

    throw AppException(res.networkServiceResponse.message);
  }

  //Cities Api
  Future<List<City>> getCities() async {
    const _url = "cities.json";
    final res = await _client.getAsync(_url);
    if (res.networkServiceResponse.success) {
      final List<City> result = cityFromJson(res.mappedResult);
      return result;
    }

    throw AppException(res.networkServiceResponse.message);
  }
}

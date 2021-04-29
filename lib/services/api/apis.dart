import 'package:dio/dio.dart';

import 'package:india_beats_covid/services/client/service_res.dart';
import 'package:india_beats_covid/utils/constants.dart';
import '../client/dio_client.dart';

class APIService {
  DioClient _client;

  APIService({DioClient client}) {
    _client =
        client ?? DioClient(dio: Dio(BaseOptions(baseUrl: Constants.baseUrl)));
  }

  //Stats Api
  Future<MappedServiceResponse<dynamic>> getStats() {
    const _url = "home_stats.json";
    return _client.getAsync(_url);
  }

  //Plasma Donors Api
  Future<MappedServiceResponse<dynamic>> getDonors() {
    const _url = "plasma_donors.json";
    return _client.getAsync(_url);
  }

  //Hospital Beds Api
  Future<MappedServiceResponse<dynamic>> getHospitalBeds() {
    const _url = "hospital_beds.json";
    return _client.getAsync(_url);
  }

  //External Links Api
  Future<MappedServiceResponse<dynamic>> getExternalLinks() {
    const _url = "external_links.json";
    return _client.getAsync(_url);
  }

  //Oxygen Suppliers Api
  Future<MappedServiceResponse<dynamic>> getOxygenSuppliers() {
    const _url = "oxygen_suppliers.json";
    return _client.getAsync(_url);
  }

  //Medicine Suppliers Api
  Future<MappedServiceResponse<dynamic>> getMedicineSupplies() {
    const _url = "medicines.json";
    return _client.getAsync(_url);
  }

  //Cities Api
  Future<MappedServiceResponse<dynamic>> getCities() {
    const _url = "cities.json";
    return _client.getAsync(_url);
  }

  //Version Api
  Future<MappedServiceResponse<dynamic>> checkVersion() {
    const _url = "version.json";
    return _client.getAsync(_url);
  }
}

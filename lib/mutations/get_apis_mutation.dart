import 'package:india_beats_covid/core/models/cities.dart';
import 'package:india_beats_covid/core/models/donors.dart';
import 'package:india_beats_covid/core/models/external_links.dart';
import 'package:india_beats_covid/core/models/hospital_beds.dart';
import 'package:india_beats_covid/core/models/oxygen_suppliers.dart';
import 'package:india_beats_covid/core/models/stats.dart';
import 'package:india_beats_covid/pkgs.dart';
import 'package:india_beats_covid/services/api/api_effect.dart';
import 'package:india_beats_covid/services/api/apis.dart';

final APIService _apiService = APIService();

loadAllAPIs() async {
  StatsMutation();
  DonorsMutation();
  CityMutation();
  HospitalBedsMutation();
  OxygenMutation();
  ExternalLinksMutation();
}

class StatsMutation extends VxMutation<Store> with APIEffects {
  String err;

  @override
  perform() {
    return _apiService.getStats();
  }

  @override
  void success(result) {
    store.stats = Stats.fromJson(result);
  }

  @override
  void fail(String message) {
    err = "Couldn't fetch. Error $message.";
  }

  @override
  void onException(e, StackTrace s) {
    err = e.toString();
    super.onException(e, s);
  }
}

class DonorsMutation extends VxMutation<Store> with APIEffects {
  String err;

  @override
  perform() {
    return _apiService.getDonors();
  }

  @override
  void success(result) {
    store.donors = donorsFromJson(result);
  }

  @override
  void fail(String message) {
    err = "Couldn't fetch. Error $message.";
  }

  @override
  void onException(e, StackTrace s) {
    err = e.toString();
    super.onException(e, s);
  }
}

class HospitalBedsMutation extends VxMutation<Store> with APIEffects {
  String err;

  @override
  perform() {
    return _apiService.getHospitalBeds();
  }

  @override
  void success(result) {
    store.beds = hospitalBedsFromJson(result);
  }

  @override
  void fail(String message) {
    err = "Couldn't fetch. Error $message.";
  }

  @override
  void onException(e, StackTrace s) {
    err = e.toString();
    super.onException(e, s);
  }
}

class OxygenMutation extends VxMutation<Store> with APIEffects {
  String err;

  @override
  perform() {
    return _apiService.getOxygenSuppliers();
  }

  @override
  void success(result) {
    store.oxygenSuppliers = oxygenSupplierFromJson(result);
  }

  @override
  void fail(String message) {
    err = "Couldn't fetch. Error $message.";
  }

  @override
  void onException(e, StackTrace s) {
    err = e.toString();
    super.onException(e, s);
  }
}

class CityMutation extends VxMutation<Store> with APIEffects {
  String err;

  @override
  perform() {
    return _apiService.getCities();
  }

  @override
  void success(result) {
    store.cities = cityFromJson(result);
  }

  @override
  void fail(String message) {
    err = "Couldn't fetch. Error $message.";
  }

  @override
  void onException(e, StackTrace s) {
    err = e.toString();
    super.onException(e, s);
  }
}

class ExternalLinksMutation extends VxMutation<Store> with APIEffects {
  String err;

  @override
  perform() {
    return _apiService.getExternalLinks();
  }

  @override
  void success(result) {
    store.externalLinks = externalLinksFromJson(result);
  }

  @override
  void fail(String message) {
    err = "Couldn't fetch. Error $message.";
  }

  @override
  void onException(e, StackTrace s) {
    err = e.toString();
    super.onException(e, s);
  }
}

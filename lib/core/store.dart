import 'package:india_beats_covid/core/models/cities.dart';
import 'package:india_beats_covid/core/models/external_links.dart';
import 'package:india_beats_covid/core/models/hospital_beds.dart';
import 'package:india_beats_covid/core/models/medicine.dart';
import 'package:india_beats_covid/core/models/oxygen_suppliers.dart';
import 'package:india_beats_covid/core/models/stats.dart';
import 'package:india_beats_covid/core/models/version_checker.dart';
import 'package:velocity_x/velocity_x.dart';

import 'models/donors.dart';

class Store extends VxStore {
  // App Settings
  VxNavigator navigator;
  bool isDarkTheme = false;

  //Home
  int selectedIndex = 0;

  // Data
  Stats stats;
  List<Donors> donors;
  List<HospitalBeds> beds;
  List<OxygenSupplier> oxygenSuppliers;
  List<MedicineSupply> medicineSupplies;
  List<City> cities;
  List<ExternalLinks> externalLinks;
  VersionChecker versionChecker;
}

import 'package:amc_applicaition/data/data_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';


final locater = GetIt.I;
SharedPreferences? prefs;

setup() async {
  locater.registerSingleton<DataService>(DataService());
  prefs = await SharedPreferences.getInstance();
}

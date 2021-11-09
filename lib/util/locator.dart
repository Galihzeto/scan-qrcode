import 'package:get_it/get_it.dart';
import 'package:scan_qrcode/util/global.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Global());
}
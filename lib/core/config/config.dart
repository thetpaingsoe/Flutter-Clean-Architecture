import 'package:flutter_clean_architecture/core/config/constants.dart';

class Config {
  // Debug Mode ON/OFF
  // When you off this mode, it will not show you the debug information
  // in the debug consoles related with the api data fetching.
  static bool isDebugMode = true;

  // Offset & Limit Constants
  static const int limit = 30;
  static const int offset = 0;

  // Data Source Config : Server / Local
  // This is control that is using to switch between server and local datasource.
  // But for your real case, you need to implment the control that meet your requirement.
  static const DataSource dataSource = DataSource.remote;
}

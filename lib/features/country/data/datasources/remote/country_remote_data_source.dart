
import 'package:flutter_clean_architecture/features/country/data/datasources/local/country_local_data_source.dart';

// Since currently there is api source for the country list
// It just use the same with local data source.
// @todo integrate to real api data socure fetching after api is done.
class CountryRemoteDataSourceImpl extends CountryLocalDataSourceImpl {}
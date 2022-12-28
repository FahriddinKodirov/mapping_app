import 'package:mapping_app/data/api/api_service.dart';
import 'package:mapping_app/data/models/lat_long.dart';

class GeocodingRepo {
 final ApiService apiService;

 GeocodingRepo({required this.apiService});

 Future<String> getAdress(LatLong latLong, kind) =>
            apiService.getLocationName(geoCodeText: '${latLong.lattiitude},${latLong.lattiitude}', kind: kind);
}
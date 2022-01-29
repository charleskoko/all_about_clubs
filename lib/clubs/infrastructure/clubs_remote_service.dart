import 'package:all_about_clubs/clubs/domain/club.dart';
import 'package:all_about_clubs/core/infrastructure/dio_extension.dart';
import 'package:all_about_clubs/core/infrastructure/network_exceptions.dart';
import 'package:all_about_clubs/core/infrastructure/remote_response.dart';
import 'package:dio/dio.dart';

class ClubsRemoteService {
  final Dio _dio;
  ClubsRemoteService(this._dio);

  Future<RemoteResponse> getClubs() async {
    final requestUri =
        Uri.https('public.allaboutapps.at', '/hiring/clubs.json');
    try {
      final response = await _dio.getUri(requestUri,
          options: Options(headers: {'Accept': 'application/json'}));
      if (response.statusCode == 200) {
        final convertedData = (response.data as List<dynamic>)
            .map((e) => Club.fromJson(e as Map<String, dynamic>))
            .toList();
        convertedData.sort((a, b) => (a.name!.compareTo(b.name ?? '')));
        return ConnectionResponse<List<Club>>(convertedData);
      } else {
        throw RestApiException(response.statusCode);
      }
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        return NoConnection();
      } else if (e.response != null) {
        throw RestApiException(e.response?.statusCode);
      } else {
        rethrow;
      }
    }
  }
}
  


// Todo: Dio error extension
// Todo: Terminer Clubs remote services
//Todo: Faire le Dio extension
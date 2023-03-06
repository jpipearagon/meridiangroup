import '../../../core/network/api_end_points.dart';
import '../../../core/network/base_api_service.dart';
import '../../../core/network/network_api_service.dart';
import '../model/movie_model.dart';

class ListMovieRepo {

  final BaseApiService _apiService = NetworkApiService();

  @override
  Future<ListMovieModel?> getListMovies() async {
    try {
      dynamic response = await _apiService.getResponse(ApiEndPoints().LIST_MOVIES_POPULAR);
      print("Log: $response");
      final jsonData = ListMovieModel.fromJson(response);
      return jsonData;
    } catch (e) {
      throw e;
    }
  }
}

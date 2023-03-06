import '../../../core/network/api_end_points.dart';
import '../../../core/network/base_api_service.dart';
import '../../../core/network/network_api_service.dart';
import '../model/movie_model.dart';

class ListMovieRepo {

  final BaseApiService _apiService = NetworkApiService();

  @override
  Future<MovieModel?> getListMovies() async {
    try {
      dynamic response = await _apiService.getResponse(ApiEndPoints().LIST_MOVIES);
      print("Log: $response");
      final jsonData = MovieModel.fromJson(response);
      return jsonData;
    } catch (e) {
      throw e;
    }
  }
}

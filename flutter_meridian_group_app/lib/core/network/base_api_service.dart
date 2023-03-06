abstract class BaseApiService {
  final String API_KEY = "fd4c25c2f0665141e89d2d389472f84e";
  final String BASE_URL = "https://api.themoviedb.org/";

  Future<dynamic> getResponse(String url);
}

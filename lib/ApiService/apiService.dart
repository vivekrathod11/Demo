import 'package:dio/dio.dart';
import 'package:nike/responsePojo/shoeResponse.dart';
import 'package:nike/utils/constants.dart';
import 'package:retrofit/retrofit.dart';
part 'apiService.g.dart';




@RestApi(baseUrl: Constants.BASE_URL)
abstract class ApiService {
  factory ApiService (Dio dio ,{String baseUrl}) = _ApiService;

  final dio = Dio();
  static ApiService create () {
    final dio = Dio();
    dio.interceptors.add(LogInterceptor(requestBody: true,responseBody: true));
    return ApiService(dio);
  }




  @GET(Constants.SHOES)
  Future<ShoeResponses>fetchOnboardingData(
      @Header("X-RapidAPI-Key") String apiKey,
      @Header("X-RapidAPI-Host") String apiHost);
}
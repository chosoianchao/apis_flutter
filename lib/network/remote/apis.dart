import 'package:demo_call_apis/constant.dart';
import 'package:demo_call_apis/model/photo/photo.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'apis.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio) {
    // dio.options = BaseOptions(
    //   receiveTimeout: 30000,
    //   connectTimeout: 30000,
    //   contentType: 'application/json',
    //   headers: {
    //     'Authorization': '',
    //     'X-ApiKey': '',
    //     'Content-Type': 'application/json'
    //   },
    // );
    return _ApiClient(dio);
  }

  @GET(Constant.photos)
  Future<List<Photo>> getPhotos();

  @POST(Constant.photos)
  Future<Photo> postPhoto(@Body() Photo photo);
}

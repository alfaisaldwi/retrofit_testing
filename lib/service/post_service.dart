import 'package:dio/dio.dart';
import 'package:retrof/model/post_model.dart';
import 'package:retrofit/retrofit.dart';

part 'post_service.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/')
abstract class PostService {
  factory PostService(Dio dio) = _PostService;

  @GET('/posts')
  Future<List<PostModel>> getPost();

  @GET("/posts/{id}")
  Future<PostModel> getPostFromId(@Path("id") int id);
  @POST('/posts')
  Future<void> postPost(PostModel posts);
}

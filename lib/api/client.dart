import 'package:deckhub/api/app_of_the_day.dart';
import 'package:deckhub/api/appstream.dart';
import 'package:deckhub/api/pagination.dart';
import 'package:deckhub/api/search.dart';
import 'package:deckhub/api/summary.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'client.g.dart';

@RestApi(baseUrl: "https://flathub.org/api/v2")
abstract class FlathubClient {
  factory FlathubClient(Dio dio, {String baseUrl}) = _FlathubClient;

  @GET("/summary/{id}")
  @CacheControl(maxAge: 86400) // 1 day
  Future<FlathubSummary> summary(@Path("id") String id);

  @GET("/appstream/{id}")
  @CacheControl(maxAge: 3600) // 1 hour
  Future<FlathubAppstream> appstream(@Path("id") String id);

  @GET("/developer/")
  @CacheControl(maxAge: 86400) // 1 day
  Future<List<String>> listDevelopers();

  @GET("/addon/{id}")
  @CacheControl(maxAge: 3600) // 1 hour
  Future<List<String>> appAddons(@Path("id") String id);


  @GET("/appstream")
  @CacheControl(maxAge: 3600) // 1 hour
  Future<List<String>> allApps();

  @GET("/collection/developer/{id}")
  Future<FlathubPagination> developer(
    @Path("id") String id, [
    @Query("page") int page = 1,
    @Query("per_page") int perPage = 50,
  ]);

  @GET("/collection/popular")
  @CacheControl(maxAge: 604800) // 1 week
  Future<FlathubPagination> popularLastMonth([
    @Query("page") int page = 1,
    @Query("per_page") int perPage = 50,
  ]);

  @GET("/collection/trending")
  @CacheControl(maxAge: 86400) // 1 day
  Future<FlathubPagination> trendingLastTwoWeek([
    @Query("page") int page = 1,
    @Query("per_page") int perPage = 50,
  ]);

  @GET("/collection/verified")
  @CacheControl(maxAge: 86400) // 1 day
  Future<FlathubPagination> verified([
    @Query("page") int page = 1,
    @Query("per_page") int perPage = 50,
  ]);

  @GET("/collection/recently-added")
  @CacheControl(maxAge: 86400) // 1 day
  Future<FlathubPagination> recentlyAdded([
    @Query("page") int page = 1,
    @Query("per_page") int perPage = 50,
  ]);

  @GET("/collection/recently-updated")
  @CacheControl(maxAge: 86400) // 1 day
  Future<FlathubPagination> recentlyUpdated([
    @Query("page") int page = 1,
    @Query("per_page") int perPage = 50,
  ]);

  @GET("/app-picks/apps-of-the-week/{id}")
  @CacheControl(maxAge: 604800) // 1 week
  Future<FlathubAppsOfTheWeek> appsOfTheWeek(@Path("id") String id);

  @GET("/app-picks/app-of-the-day/{id}")
  @CacheControl(maxAge: 3600) // 1 hour
  Future<FlathubAppOfTheDay> appOfTheDay(@Path("id") String id);

  @GET("/category/{id}")
  @CacheControl(maxAge: 86400) // 1 day
  Future<FlathubPagination> category(
    @Path("id") String id, [
    @Query("page") int page = 1,
    @Query("per_page") int perPage = 50,
  ]);

  @POST("/search")
  @CacheControl(maxAge: 86400) // 1 day
  Future<FlathubPagination> search(
    @Body() FlathubSearchOptions options, [
    @Query("page") int page = 1,
    @Query("per_page") int perPage = 50,
  ]);
}

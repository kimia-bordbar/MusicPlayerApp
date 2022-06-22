import 'package:dio/dio.dart';
import 'package:music_player/models/album_base_model.dart';
import 'package:music_player/models/artist_base_model.dart';
import 'package:music_player/models/category_base_model.dart';
import 'package:music_player/models/song_base_model.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "http://androidsupport.ir/projects/radiojavan/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("api.php?artist_list")
  Future<ArtistBaseModel> getArtist();

  @GET("api.php?recent_artist_list")
  Future<ArtistBaseModel> getRecentArtist();

  @GET("api.php?album_list")
  Future<AlbumBaseModel> getAlbum();

  @GET("api.php?latest")
  Future<SongBaseModel> getLatestSongs();

  @GET("api.php?cat_list")
  Future<CategoryBaseModel> getCategory();

  @GET("api.php?artist_name={id}")
  Future<SongBaseModel> getArtistsSongs(@Path("id") String id);

  @GET("api.php?album_id={id}")
  Future<SongBaseModel> getAlbumsSongs(@Path("id") String id);

  @GET("api.php?cat_id={id}")
  Future<SongBaseModel> getCategoriesSongs(@Path("id") String id);

  @GET("api.php?mp3_id={id}")
  Future<SongBaseModel> getSingleSong(@Path("id") String id);


  @GET("api.php?search_text={id}")
  Future<SongBaseModel> getSearchSong(@Path("id") String id);


}

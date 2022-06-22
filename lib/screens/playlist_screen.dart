import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:music_player/api/rest_client.dart';
import 'package:music_player/models/playlist_base_model.dart';
import 'package:music_player/view/item_playlist.dart';

class PlayListScreen extends StatefulWidget {
  const PlayListScreen({Key? key}) : super(key: key);

  @override
  State<PlayListScreen> createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {
  final dio = Dio();
  late Future<PlaylistBaseModel> getPlayList;
  @override
  Widget build(BuildContext context) {
    var client = RestClient(dio);
    getPlayList = client.getPlaylist();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: FutureBuilder<PlaylistBaseModel>(
          future: getPlayList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.ONLINE_MP3.length,
                itemBuilder: (context, index) {
                  return ItemPlayList(
                    playListName:
                        snapshot.data!.ONLINE_MP3[index].playlist_name,
                    image: snapshot.data!.ONLINE_MP3[index].playlist_image,
                    playListId: snapshot.data!.ONLINE_MP3[index].pid,
                  );
                },
              );
            } else if (snapshot.hasError) {
              return const Text(
                  'از اتصال دستگاه خود به اینترنت اطمینان حاصل شوید.');
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.copyWith().secondary,
                ),
              );
            }
          }),
    );
  }
}

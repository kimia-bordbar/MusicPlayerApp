import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:music_player/api/rest_client.dart';
import 'package:music_player/models/song_base_model.dart';
import 'package:music_player/view/item_song.dart';

class AlbumDetailScreen extends StatefulWidget {
  final String albumId;
  final String albumName;
  final String albumImage;
  const AlbumDetailScreen({
    Key? key,
    required this.albumId,
    required this.albumName,
    required this.albumImage,
  }) : super(key: key);

  @override
  State<AlbumDetailScreen> createState() => _AlbumDetailScreenState();
}

class _AlbumDetailScreenState extends State<AlbumDetailScreen> {
  final dio = Dio();

  @override
  Widget build(BuildContext context) {
    var client = RestClient(dio);
    late Future<SongBaseModel> getAlbumsSongs;

    getAlbumsSongs = client.getAlbumsSongs(widget.albumId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.albumName,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder<SongBaseModel>(
              future: getAlbumsSongs,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .copyWith()
                                .secondary,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.network(
                              widget.albumImage,
                              fit: BoxFit.fill,
                              errorBuilder: (context, object, stack) {
                                return const Center(child: Text(':/'));
                              },
                            ),
                          ),
                        ),
                      ),
                    
                      const SizedBox(
                        height: 30,
                      ),
                      // ------------------------

                      Flexible(
                        child: ListView.separated(
                          separatorBuilder: ((context, inex) => Divider(
                                color: Theme.of(context)
                                    .colorScheme
                                    .copyWith()
                                    .secondary,
                              )),
                          itemCount: snapshot.data!.ONLINE_MP3.length,
                          itemBuilder: (context, index) {
                            return ItemSong(
                              songName:
                                  snapshot.data!.ONLINE_MP3[index].mp3_title,
                              artistName:
                                  snapshot.data!.ONLINE_MP3[index].mp3_artist,
                              image: snapshot
                                  .data!.ONLINE_MP3[index].mp3_thumbnail_b,
                              songId: snapshot.data!.ONLINE_MP3[index].id,
                            );
                          },
                        ),
                      )
                    ],
                  );
                } else if (snapshot.hasError) {
                  return const Text(
                      'از اتصال دستگاه خود به اینترنت اطمینان حاصل شوید.');
                } else {
                  return  Center(
                    child: CircularProgressIndicator(color:
                            Theme.of(context).colorScheme.copyWith().secondary,),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

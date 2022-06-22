import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:music_player/api/rest_client.dart';
import 'package:music_player/models/song_base_model.dart';
import 'package:music_player/view/item_song.dart';

class ArtistDetailScreen extends StatefulWidget {
  final String artistName;
  const ArtistDetailScreen({
    Key? key,
    required this.artistName,
  }) : super(key: key);

  @override
  State<ArtistDetailScreen> createState() => _ArtistDetailScreenState();
}

class _ArtistDetailScreenState extends State<ArtistDetailScreen> {
  final dio = Dio();

  @override
  Widget build(BuildContext context) {
    var client = RestClient(dio);
    late Future<SongBaseModel> getArtistsSongs;

    getArtistsSongs = client.getArtistsSongs(widget.artistName);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.artistName),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color:
                            Theme.of(context).colorScheme.copyWith().secondary,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: FutureBuilder<SongBaseModel>(
                            future: getArtistsSongs,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Image.network(
                                  snapshot.data!.ONLINE_MP3[0].mp3_thumbnail_b,
                                  fit: BoxFit.fill,
                                  errorBuilder: (context, object, stack) {
                                    return const Center(child: Text(':/'));
                                  },
                                );
                              } else if (snapshot.hasError) {
                                return const Text(
                                    'از اتصال دستگاه خود به اینترنت اطمینان حاصل شوید.');
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .copyWith()
                                        .secondary,
                                  ),
                                );
                              }
                            }),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // audio controllers ....
                  Container(
                    height: 60.0,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // ------------------------

                  FutureBuilder<SongBaseModel>(
                      future: getArtistsSongs,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Flexible(
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
                                  songName: snapshot
                                      .data!.ONLINE_MP3[index].mp3_title,
                                  artistName: snapshot
                                      .data!.ONLINE_MP3[index].mp3_artist,
                                  image: snapshot
                                      .data!.ONLINE_MP3[index].mp3_thumbnail_b,
                                  songId: snapshot.data!.ONLINE_MP3[index].id,
                                );
                              },
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return const Text(
                              'از اتصال دستگاه خود به اینترنت اطمینان حاصل شوید.');
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      }),
                ],
              )),
        ),
      ),
    );
  }
}

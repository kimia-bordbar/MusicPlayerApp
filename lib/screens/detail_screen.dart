import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:music_player/api/rest_client.dart';
import 'package:music_player/models/song_base_model.dart';

class DetailScreen extends StatefulWidget {
  final String songId;
  const DetailScreen({Key? key, required this.songId}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final dio = Dio();

  @override
  Widget build(BuildContext context) {
    var client = RestClient(dio);
    late Future<SongBaseModel> getSingleSong;

    getSingleSong = client.getSingleSong(widget.songId);

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder<SongBaseModel>(
              future: getSingleSong,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.5,
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
                              snapshot.data!.ONLINE_MP3[0].mp3_thumbnail_b,
                              fit: BoxFit.fill,
                              errorBuilder: (context, object, stack) {
                                return const Center(child: Text(':/'));
                              },
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Text(
                            snapshot.data!.ONLINE_MP3[0].mp3_title,
                            style: Theme.of(context)
                                .textTheme
                                .copyWith()
                                .headline6,
                          ),
                          Text(
                            snapshot.data!.ONLINE_MP3[0].mp3_artist,
                            style: Theme.of(context)
                                .textTheme
                                .copyWith()
                                .headline5,
                          )
                        ],
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
                    ],
                  );
                } else if (snapshot.hasError) {
                  return const Text(
                      'از اتصال دستگاه خود به اینترنت اطمینان حاصل شوید.');
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
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

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_player/api/rest_client.dart';
import 'package:music_player/models/album_base_model.dart';
import 'package:music_player/models/artist_base_model.dart';
import 'package:music_player/models/song_base_model.dart';
import 'package:music_player/view/item_gridview.dart';
import 'package:music_player/view/item_artist_listview.dart';
import 'package:music_player/view/item_song_listview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<ArtistBaseModel> getRecentArtistData;
  late Future<SongBaseModel> getLatestSongData;
  late Future<AlbumBaseModel> getAlbumData;
  late Future<SongBaseModel> getArtistsSongs;
  @override
  void initState() {
    super.initState();
    final dio = Dio();
    var client = RestClient(dio);
    getRecentArtistData = client.getRecentArtist();
    getLatestSongData = client.getLatestSongs();
    getAlbumData = client.getAlbum();
    // getRecentArtistData.then((value) {
    //   log(value.toString());
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: RefreshIndicator(
          color: Theme.of(context).colorScheme.copyWith().secondary,
          onRefresh: () async {
            await Future.delayed(const Duration(milliseconds: 1500));
            setState(() {
              getRecentArtistData;
              getLatestSongData;
              getAlbumData;
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Artist List ----------------------
              Text(
                'خواننده های اخیر',
                style: GoogleFonts.acme(fontSize: 25),
              ),
              const SizedBox(height: 18),
              SizedBox(
                height: 200,
                child: FutureBuilder<ArtistBaseModel>(
                    future: getRecentArtistData,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.ONLINE_MP3.length,
                          itemBuilder: (context, index) {
                            return ItemArtistListView(
                              artistName:
                                  snapshot.data!.ONLINE_MP3[index].artist_name,
                              image:
                                  snapshot.data!.ONLINE_MP3[index].artist_image,
                            );
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
                                  .secondary),
                        );
                      }
                    }),
              ),

              const SizedBox(height: 25),

              // Song List ----------------------
              Text(
                'آهنگ های اخیر',
                style: GoogleFonts.acme(
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 18),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
                height: 320,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: FutureBuilder<SongBaseModel>(
                    future: getLatestSongData,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.ONLINE_MP3.length,
                          itemBuilder: (context, index) {
                            return ItemSongListView(
                              songId: snapshot.data!.ONLINE_MP3[index].id,
                              songName:
                                  snapshot.data!.ONLINE_MP3[index].mp3_title,
                              artistName:
                                  snapshot.data!.ONLINE_MP3[index].mp3_artist,
                              image: snapshot
                                  .data!.ONLINE_MP3[index].mp3_thumbnail_b,
                            );
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
                    },
                  ),
                ),
              ),
              const SizedBox(height: 25),

              // Album List ----------------------
              Text(
                'آلبوم ها',
                style: GoogleFonts.acme(
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 18),
              SizedBox(
                height: 600,
                child: FutureBuilder<AlbumBaseModel>(
                    future: getAlbumData,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.70,
                          ),
                          itemCount: snapshot.data!.ONLINE_MP3.length,
                          primary: false,
                          itemBuilder: (context, index) {
                            return ItemGridView(
                              albumName:
                                  snapshot.data!.ONLINE_MP3[index].album_name,
                              image:
                                  snapshot.data!.ONLINE_MP3[index].album_image,
                              albumId: snapshot.data!.ONLINE_MP3[index].aid,
                            );
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
                        ));
                      }
                    }),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}

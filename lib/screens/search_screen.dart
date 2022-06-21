import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_player/api/rest_client.dart';
import 'package:music_player/models/song_base_model.dart';
import 'package:music_player/view/item_song.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = TextEditingController();
  final dio = Dio();
  Future<SongBaseModel>? getSearchSong;

  @override
  Widget build(BuildContext context) {
    var client = RestClient(dio);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
          child: Column(
            children: [
              TextField(
                style: TextStyle(
                  color: Theme.of(context).colorScheme.copyWith().primary,
                ),
                controller: controller,
                decoration: InputDecoration(
                  filled: true,
                  contentPadding: const EdgeInsets.only(
                    right: 14.0,
                    bottom: 8.0,
                    top: 8.0,
                    left: 8.0,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.copyWith().secondary,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.copyWith().secondary,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  fillColor: Theme.of(context).colorScheme.copyWith().secondary,
                  hintText: 'نام آهنگ ...',
                  hintStyle: GoogleFonts.sourceSansPro(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                  prefixIcon: IconButton(
                    color: Theme.of(context).colorScheme.copyWith().primary,
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        getSearchSong = client.getSearchSong(controller.text);
                      });
                    },
                  ),
                  suffixIcon: IconButton(
                    color: Theme.of(context).colorScheme.copyWith().primary,
                    icon: const Icon(Icons.delete_forever_rounded),
                    onPressed: () {
                      setState(() {
                        controller.text = '';
                        getSearchSong = client.getSearchSong('search');
                      });
                    },
                  ),
                ),
              ),
              // -------------------------------
              const SizedBox(height: 30),
              Flexible(
                child: FutureBuilder<SongBaseModel>(
                  future: getSearchSong,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data == null
                            ? 0
                            : snapshot.data!.ONLINE_MP3.length,
                        itemBuilder: (context, index) {
                          return ItemSong(
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
                    } else {
                      return Text(
                        'موردی یافت نشد.',
                        style: Theme.of(context).textTheme.copyWith().headline6,
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

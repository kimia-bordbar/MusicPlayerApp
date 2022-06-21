import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:music_player/screens/detail_screen.dart';

class ItemSongListView extends StatelessWidget {
  final String songId;
  final String songName;
  final String artistName;
  final String image;
  const ItemSongListView({
    Key? key,
    required this.songId,
    required this.songName,
    required this.artistName,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GestureDetector(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.copyWith().secondary,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                    image,
                    fit: BoxFit.fill,
                    errorBuilder: (context, object, stack) {
                      return const Center(child: Text(':/'));
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text(
                  textAlign: TextAlign.end,
                  songName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.sourceSansPro(
                    fontSize: 18.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Text(
                  textAlign: TextAlign.end,
                  artistName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.sourceSansPro(
                    fontSize: 14.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          Get.to(() => DetailScreen(songId: songId));
        },
      ),
    );
  }
}

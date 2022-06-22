import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/screens/detail_screen.dart';

class ItemSong extends StatelessWidget {
  final String songId;

  final String songName;
  final String artistName;
  final String image;
  const ItemSong({
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
        child: Container(
          decoration: BoxDecoration(
            // color: Theme.of(context).colorScheme.copyWith().secondary,
            borderRadius: BorderRadius.circular(15.0),
          ),
          height: 90,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                    image,
                    fit: BoxFit.fill,
                    errorBuilder: (context, object, stack) {
                      return const Center(child: Text(':/'));
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        songName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.copyWith().headline5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, right: 15.0),
                      child: Text(
                        artistName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.copyWith().headline4,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        onTap: () {
          Get.to(() => DetailScreen(songId: songId));
        },
      ),
    );
  }
}

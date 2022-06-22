import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/screens/playlist_detail_screen.dart';

class ItemPlayList extends StatelessWidget {
  final String playListId;
  final String playListName;
  final String image;
  const ItemPlayList({
    Key? key,
    required this.playListId,
    required this.playListName,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GestureDetector(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
            ),
            height: 100,
            width: double.infinity,
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
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        playListName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.copyWith().headline6,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        onTap: () {
          Get.to(
            () => PlaylistDetailScreen(
              playlistId: playListId,
              playlistName: playListName,
            ),
          );
        },
      ),
    );
  }
}

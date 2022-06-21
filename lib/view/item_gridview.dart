import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_player/screens/album_detail_screen.dart';

class ItemGridView extends StatelessWidget {
  final String albumId;
  final String albumName;
  final String image;
  const ItemGridView({
    Key? key,
    required this.albumId,
    required this.albumName,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
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
                albumName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.sourceSansPro(
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Get.to(() => AlbumDetailScreen(
              albumId: albumId,
              albumImage: image,
              albumName:albumName,
            ));
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_player/screens/artist_detail_screen.dart';

class ItemArtistListView extends StatelessWidget {
  final String artistName;
  final String image;
  const ItemArtistListView({
    Key? key,
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
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.copyWith().secondary,
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(90.0),
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
                  artistName,
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
        onTap: (){
          Get.to(()=>ArtistDetailScreen(artistName: artistName));
        },
      ),
    );
  }
}

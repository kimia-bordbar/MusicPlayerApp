import 'package:flutter/material.dart';

class ItemPlayList extends StatelessWidget {
  final String playListName;
  final String image;
  const ItemPlayList({
    Key? key,
    required this.playListName,
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
          height: 100,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        playListName,
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
        onTap: () {},
      ),
    );
  }
}

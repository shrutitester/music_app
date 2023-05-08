import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_music_app/models/song_model.dart';

import 'models/playlist_model.dart';

class PlaylistCard extends StatelessWidget {
  const PlaylistCard({Key? key, required this.playlist, required this.song}) : super(key: key);

  final Playlist playlist;
  final Song song;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.toNamed('/song', arguments: song);
      },
      child: Container(
        height: 75,
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                playlist.imageUrl,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 20,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    song.title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${playlist.songs.length} songs',
                    maxLines: 2,
                    style:Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
            ),
            IconButton(onPressed: (){},
                icon: const Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:test_music_app/playlistsong.dart';
import 'models/playlist_model.dart';
import 'models/song_model.dart';

class PlaylistScreen extends StatelessWidget {
  PlaylistScreen({Key? key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    List<Song> songs = Song.songs;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.deepPurple.shade800.withOpacity(0.8),
                Colors.deepPurple.shade200.withOpacity(0.8),
              ])
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Icon(Icons.favorite_border),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text('Recent favourites',
                  style: Theme.of(context)
                  .textTheme.headline5!
                  .copyWith(fontWeight: FontWeight.bold
                )),
                SizedBox(
                  height: MediaQuery.of(context).size.height* 0.27,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 2,
                      itemBuilder: (context, index){
                        return PlaylistSong(song: songs[index]);
                      }
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

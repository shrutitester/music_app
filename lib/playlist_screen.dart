import 'package:flutter/material.dart';

import 'models/playlist_model.dart';

class PlaylistScreen extends StatelessWidget {
  PlaylistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Playlist> playlists = Playlist.playlists;
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
                GridView.builder(
                    itemCount: playlists.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4
                    ),
                    itemBuilder: (BuildContext context, int index){
                      return Container(
                        height: 75,

                        child: Column(
                          children: [
                            Image.network(playlists[index].imageUrl,
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            )
                          ],
                        ),
                      );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:test_music_app/models/playlist_model.dart';
import 'package:test_music_app/playlist_card.dart';
import 'package:test_music_app/song_card.dart';
import 'models/song_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Song> songs = Song.songs;
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
        appBar: _CustomAppBar(),
        bottomNavigationBar: _CustomNavBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _DiscoverMusic(),
                SizedBox(height: 20,),
                SizedBox(
                  height: MediaQuery.of(context).size.height* 0.27,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: songs.length,
                      itemBuilder: (context, index){
                        return SongCard(song: songs[index]);
                      }
                      ),
                ),
                SizedBox(height: 20,),
                _PlayMusic(),
                Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 20),
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: playlists.length,
                        itemBuilder: ((context, index){
                          return PlaylistCard(playlist: playlists[index],song: songs[index],);
                        }))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PlayMusic extends StatefulWidget {
  const _PlayMusic({Key? key}) : super(key: key);

  @override
  State<_PlayMusic> createState() => _PlayMusicState();
}

class _PlayMusicState extends State<_PlayMusic> {
  bool isPlay = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){
        setState(() {
          isPlay = !isPlay;
        });
      },
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Stack(
          children: [
            Container(
          height: 50,
          width: width * 0.45,
          decoration: BoxDecoration(
              color: Colors.deepPurple.shade400,
              borderRadius: BorderRadius.circular(15)
            ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Center(
                    child: Text('Trending right now',
                      style: TextStyle(
                          color: isPlay ? Colors.white : Colors.deepPurple,
                          fontSize: 17
                      ),),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text('Rock',
                      style: TextStyle(
                          color: isPlay ? Colors.white : Colors.deepPurple,
                          fontSize: 17
                      ),),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


class _DiscoverMusic extends StatelessWidget {
  const _DiscoverMusic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        TextFormField(
          decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: Colors.white,
              hintText: 'Search',
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.grey.shade400),
              prefixIcon:
              Icon(Icons.search, color: Colors.grey.shade400,),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none
              )
          ),
        ),
        SizedBox(height: 20,),
        Text('Trending right now',
          style: Theme.of(context)
              .textTheme.headline5!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}


class _CustomNavBar extends StatelessWidget {
  const _CustomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.deepPurple.shade800,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.white,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.music_note), label: 'Play'),
         BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}


class _CustomAppBar extends StatelessWidget with PreferredSizeWidget{
  const _CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Icon(Icons.list),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}


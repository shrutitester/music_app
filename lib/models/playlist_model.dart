import 'package:test_music_app/models/song_model.dart';

class Playlist{
  final String title;
  final List<Song> songs;
  final String imageUrl;

  Playlist({
    required this.title,
    required this.songs,
    required this.imageUrl,
});

  static List<Playlist> playlists = [
    Playlist(
        title: 'Hip-hop R&b Mix',
        songs: Song.songs,
        imageUrl: 'https://images.unsplash.com/photo-1576525865260-9f0e7cfb02b3?ixlib'),
    Playlist(
        title: 'Rock & Roll',
        songs: Song.songs,
        imageUrl: 'https://images.unsplash.com/photo-1576525865260-9f0e7cfb02b3?ixlib'),
    Playlist(
        title: 'Techno',
        songs: Song.songs,
        imageUrl: 'https://images.unsplash.com/photo-1576525865260-9f0e7cfb02b3?ixlib'),
  ];
}